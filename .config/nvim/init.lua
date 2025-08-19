require("config/lazy")

local o, wo, bo = vim.opt, vim.wo, vim.bo

vim.loader.enable()

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0

for _, p in ipairs({
  "gzip","zip","zipPlugin","tar","tarPlugin","netrw","netrwPlugin","netrwSettings","netrwFileHandlers",
  "2html_plugin","matchparen","logiPat","rrhelper","spellfile_plugin","tutor","man"
}) do vim.g["loaded_"..p] = 1 end


local function bigfile(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  if name == "" then return false end
  local st = vim.uv.fs_stat(name)
  if not st then return false end
  return st.size > 1024*1024 or vim.api.nvim_buf_line_count(buf) > 10000
end

require("config")

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function(args)
    if bigfile(args.buf) then
      vim.b[args.buf].bigfile = true
      vim.cmd("syntax off")
      vim.opt_local.foldenable = false
      vim.opt_local.swapfile = false
    end
  end,
})

vim.opt.laststatus = 3
vim.o.statusline = " %f %m%r %= %y [%{&ff}] %l/%L:%c "

