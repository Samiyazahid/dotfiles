-- Highlighted Yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.cmd("language en_US.utf-8")

-- vim.cmd("autocmd User LspProgressUpdate redrawstatus")
-- vim.cmd("autocmd User LspRequest redrawstatus")

vim.cmd("command! W wqa")
vim.cmd("command! Q wqa!")

vim.cmd([[
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]])

vim.cmd([[
augroup zsh-filetype
  autocmd BufNewFile,BufRead *.zsh set syntax=bash
  autocmd BufNewFile,BufRead *.zsh set filetype=sh
augroup END
]])

vim.api.nvim_create_autocmd({ "BufRead,BufNewFile" }, {
  pattern = "*.json",
  callback = function()
    vim.o.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd({ "BufRead,BufNewFile" }, {
  pattern = "*.md",
  callback = function()
    vim.o.conceallevel = 2
  end,
})
