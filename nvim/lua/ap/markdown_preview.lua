local M = {}

local uv = vim.uv or vim.loop

local assets = {
  ["marked.min.js"] = "https://cdn.jsdelivr.net/npm/marked@15/marked.min.js",
  ["purify.min.js"] = "https://cdn.jsdelivr.net/npm/dompurify@3/dist/purify.min.js",
  ["highlight.min.js"] = "https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11/highlight.min.js",
  ["github.min.css"] = "https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11/styles/github.min.css",
  ["github-dark.min.css"] = "https://cdn.jsdelivr.net/npm/@highlightjs/cdn-assets@11/styles/github-dark.min.css",
  ["github-markdown.css"] = "https://cdn.jsdelivr.net/npm/github-markdown-css@5/github-markdown.css",
}

local asset_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "markdown-preview", "assets")

local state = {
  buf = nil,
  base_dir = nil,
  server = nil,
  port = nil,
}

local css = [[
:root { color-scheme: light dark; }
html, body { margin: 0; }
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Noto Sans", Helvetica, Arial, sans-serif;
  background: #ffffff;
}
@media (prefers-color-scheme: dark) {
  body { background: #0d1117; }
}
header {
  position: sticky;
  top: 0;
  z-index: 10;
  display: flex;
  gap: 10px;
  align-items: center;
  padding: 10px 18px;
  font-size: 13px;
  border-bottom: 1px solid rgba(128, 128, 128, 0.25);
  background: rgba(255, 255, 255, 0.85);
  backdrop-filter: blur(8px);
}
@media (prefers-color-scheme: dark) {
  header { background: rgba(13, 17, 23, 0.85); }
}
header .file { font-weight: 600; }
#status { color: #1a7f37; }
#status.error { color: #cf222e; }
.markdown-body {
  box-sizing: border-box;
  min-width: 200px;
  max-width: 980px;
  margin: 0 auto;
  padding: 45px;
}
@media (max-width: 767px) {
  .markdown-body { padding: 15px; }
}
]]

local js = [[
(function () {
  var content = document.getElementById('content');
  var status = document.getElementById('status');
  var last = null;

  if (typeof marked !== 'undefined') {
    marked.use({ gfm: true, breaks: false });
  }

  function slug(text) {
    return text.trim().toLowerCase().replace(/[^\w\s-]/g, '').replace(/\s+/g, '-');
  }

  function render(md) {
    var html = marked.parse(md);
    var clean = DOMPurify.sanitize(html, { ADD_ATTR: ['target'] });
    content.innerHTML = clean;

    var seen = Object.create(null);
    content.querySelectorAll('h1,h2,h3,h4,h5,h6').forEach(function (h) {
      var base = slug(h.textContent) || 'section';
      var id = base;
      var i = 0;
      while (seen[id]) { i++; id = base + '-' + i; }
      seen[id] = true;
      h.id = id;
    });

    content.querySelectorAll('a[href]').forEach(function (a) {
      try {
        var url = new URL(a.getAttribute('href'), location.href);
        if (url.origin !== location.origin) {
          a.target = '_blank';
          a.rel = 'noopener noreferrer';
        }
      } catch (e) {}
    });

    content.querySelectorAll('img[src]').forEach(function (img) {
      var src = img.getAttribute('src');
      if (!src || /^(?:[a-z][a-z0-9+.-]*:|\/\/|\/)/i.test(src)) return;
      img.setAttribute('src', '/file?path=' + encodeURIComponent(src));
    });

    content.querySelectorAll('pre code').forEach(function (el) {
      if (typeof hljs === 'undefined') return;
      try { hljs.highlightElement(el); } catch (e) {}
    });
  }

  function load(first) {
    fetch('/content', { cache: 'no-store' })
      .then(function (res) { return res.text(); })
      .then(function (text) {
        if (!first && text === last) {
          status.textContent = 'live';
          status.className = '';
          return;
        }
        var doc = document.scrollingElement || document.documentElement;
        var max = doc.scrollHeight - window.innerHeight;
        var ratio = max > 0 ? doc.scrollTop / max : 0;
        last = text;
        try {
          render(text);
          status.textContent = 'live';
          status.className = '';
        } catch (e) {
          content.textContent = 'Preview error: ' + e;
          status.textContent = 'error';
          status.className = 'error';
        }
        if (!first) {
          requestAnimationFrame(function () {
            var next = doc.scrollHeight - window.innerHeight;
            window.scrollTo(0, ratio * Math.max(0, next));
          });
        }
      })
      .catch(function () {
        status.textContent = 'disconnected';
        status.className = 'error';
      });
  }

  load(true);
  setInterval(function () { load(false); }, 500);
})();
]]

local mime = {
  png = "image/png",
  jpg = "image/jpeg",
  jpeg = "image/jpeg",
  gif = "image/gif",
  svg = "image/svg+xml",
  webp = "image/webp",
  avif = "image/avif",
  bmp = "image/bmp",
  ico = "image/x-icon",
  pdf = "application/pdf",
}

local function mime_for(path)
  local ext = path:match("%.([%w]+)$")
  return (ext and mime[ext:lower()]) or "application/octet-stream"
end

local function read_file(path)
  local file = io.open(path, "rb")
  if not file then
    return nil
  end
  local data = file:read("*a")
  file:close()
  return data
end

local function url_decode(value)
  value = value:gsub("+", " ")
  return (value:gsub("%%(%x%x)", function(hex)
    return string.char(tonumber(hex, 16))
  end))
end

local function html_escape(value)
  return (value:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end

local function ensure_assets()
  vim.fn.mkdir(asset_dir, "p")
  for name, url in pairs(assets) do
    local path = vim.fs.joinpath(asset_dir, name)
    if vim.fn.filereadable(path) == 0 then
      vim.fn.system({ "curl", "-fsSL", "--max-time", "20", url, "-o", path })
      if vim.v.shell_error ~= 0 then
        pcall(vim.fn.delete, path)
      end
    end
  end
end

local function asset_url(name)
  if vim.fn.filereadable(vim.fs.joinpath(asset_dir, name)) == 1 then
    return "/assets/" .. name
  end
  return assets[name]
end

local function page(title)
  return table.concat({
    "<!doctype html><html><head><meta charset=\"utf-8\">",
    "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
    "<title>" .. title .. "</title>",
    "<link rel=\"stylesheet\" href=\"" .. asset_url("github-markdown.css") .. "\">",
    "<link rel=\"stylesheet\" href=\"" .. asset_url("github.min.css") .. "\" media=\"(prefers-color-scheme: light)\">",
    "<link rel=\"stylesheet\" href=\"" .. asset_url("github-dark.min.css") .. "\" media=\"(prefers-color-scheme: dark)\">",
    "<style>" .. css .. "</style>",
    "</head><body>",
    "<header><span class=\"file\">" .. title .. "</span><span id=\"status\">live</span></header>",
    "<main id=\"content\" class=\"markdown-body\"></main>",
    "<script src=\"" .. asset_url("marked.min.js") .. "\"></script>",
    "<script src=\"" .. asset_url("purify.min.js") .. "\"></script>",
    "<script src=\"" .. asset_url("highlight.min.js") .. "\"></script>",
    "<script>" .. js .. "</script>",
    "</body></html>",
  })
end

local function respond(client, status, content_type, body)
  local headers = table.concat({
    "HTTP/1.1 " .. status,
    "Content-Type: " .. content_type,
    "Content-Length: " .. tostring(#body),
    "Connection: close",
    "Cache-Control: no-store",
    "",
    "",
  }, "\r\n")
  client:write(headers .. body, function()
    client:close()
  end)
end

local function handle(client, data)
  local request_line = data:match("^([^\r\n]+)")
  if not request_line then
    return respond(client, "400 Bad Request", "text/plain; charset=utf-8", "bad request")
  end

  local method, target = request_line:match("^(%u+) (%S+)")
  if not method then
    return respond(client, "400 Bad Request", "text/plain; charset=utf-8", "bad request")
  end
  if method ~= "GET" then
    return respond(client, "405 Method Not Allowed", "text/plain; charset=utf-8", "method not allowed")
  end

  local path, query = target:match("^([^?]*)%??(.*)$")

  if path == "/" then
    local title = state.buf and vim.api.nvim_buf_is_valid(state.buf) and vim.fs.basename(vim.api.nvim_buf_get_name(state.buf))
      or ""
    if title == "" then
      title = "untitled"
    end
    return respond(client, "200 OK", "text/html; charset=utf-8", page(html_escape(title)))
  end

  if path == "/content" then
    if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
      return respond(client, "410 Gone", "text/plain; charset=utf-8", "Preview buffer was closed. Reopen with :MarkdownPreview")
    end
    local lines = vim.api.nvim_buf_get_lines(state.buf, 0, -1, false)
    return respond(client, "200 OK", "text/plain; charset=utf-8", table.concat(lines, "\n"))
  end

  local asset_name = path:match("^/assets/([%w%._%-]+)$")
  if asset_name and assets[asset_name] then
    local body = read_file(vim.fs.joinpath(asset_dir, asset_name))
    if body then
      return respond(client, "200 OK", mime_for(asset_name), body)
    end
    return respond(client, "404 Not Found", "text/plain; charset=utf-8", "not found")
  end

  if path == "/file" then
    local relative = url_decode(query:match("^path=(.*)$") or "")
    if relative == "" or relative:find("%.%.") or relative:sub(1, 1) == "/" then
      return respond(client, "403 Forbidden", "text/plain; charset=utf-8", "forbidden")
    end
    local base = vim.fs.normalize(state.base_dir or vim.fn.getcwd())
    local full = vim.fs.normalize(vim.fs.joinpath(base, relative))
    if not vim.startswith(full, base .. "/") then
      return respond(client, "403 Forbidden", "text/plain; charset=utf-8", "forbidden")
    end
    local body = read_file(full)
    if not body then
      return respond(client, "404 Not Found", "text/plain; charset=utf-8", "not found")
    end
    return respond(client, "200 OK", mime_for(full), body)
  end

  if path == "/favicon.ico" then
    return respond(client, "204 No Content", "image/x-icon", "")
  end

  return respond(client, "404 Not Found", "text/plain; charset=utf-8", "not found")
end

local function start_server()
  if state.server then
    return state.port
  end

  local server = assert(uv.new_tcp())
  local ok, err = server:bind("127.0.0.1", 0)
  if not ok then
    server:close()
    error("could not bind preview server: " .. tostring(err))
  end

  local sock = server:getsockname()

  server:listen(128, function(listen_err)
    if listen_err then
      return
    end

    local client = uv.new_tcp()
    local chunks = {}

    server:accept(client)

    client:read_start(function(read_err, chunk)
      if read_err or not chunk then
        client:close()
        return
      end

      chunks[#chunks + 1] = chunk
      local data = table.concat(chunks)

      if not data:find("\r\n\r\n", 1, true) then
        if #data > 65536 then
          client:close()
        end
        return
      end

      client:read_stop()
      vim.schedule(function()
        local ok_handle, handle_err = pcall(handle, client, data)
        if not ok_handle then
          respond(client, "500 Internal Server Error", "text/plain; charset=utf-8", tostring(handle_err))
        end
      end)
    end)
  end)

  state.server = server
  state.port = sock.port
  return sock.port
end

local function stop_server()
  if state.server then
    pcall(function()
      state.server:close()
    end)
    state.server = nil
    state.port = nil
  end
end

function M.open()
  state.buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(state.buf)
  state.base_dir = name ~= "" and vim.fs.dirname(name) or vim.fn.getcwd()

  ensure_assets()

  local ok, port = pcall(start_server)
  if not ok then
    vim.notify("Markdown preview: " .. tostring(port), vim.log.levels.ERROR)
    return
  end

  local url = ("http://127.0.0.1:%d/"):format(port)
  vim.notify("Markdown preview: " .. url)

  local opened, open_err = pcall(vim.ui.open, url)
  if not opened then
    vim.notify("Markdown preview: " .. tostring(open_err), vim.log.levels.ERROR)
  end
end

function M.setup()
  vim.api.nvim_create_user_command("MarkdownPreview", M.open, {
    desc = "Open a live GitHub-style Markdown preview in the browser",
  })
  vim.api.nvim_create_user_command("MarkdownPreviewStop", stop_server, {
    desc = "Stop the Markdown preview server",
  })
  vim.keymap.set("n", "<leader>mp", M.open, { desc = "[M]arkdown [P]review" })
  vim.api.nvim_create_autocmd("VimLeavePre", { callback = stop_server })
end

return M
