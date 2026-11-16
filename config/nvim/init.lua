vim.opt.termguicolors = false
vim.opt.modeline = true

-- Load existing Vim configuration and plugins.
vim.opt.runtimepath:prepend(vim.fn.expand('~/.vim'))
vim.opt.runtimepath:append(vim.fn.expand('~/.vim/after'))
vim.cmd('let &packpath = &runtimepath')
vim.cmd('source ~/.vimrc')

-- Install LSP configurations and enable Python / TypeScript 7.
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable({ 'pyright', 'tsc' })

-- Jump to definition in new tab; Ctrl-o returns.
vim.keymap.set('n', 'gd', function()
  vim.cmd('vsplit')
  vim.lsp.buf.definition()
end, { desc = 'Definition in vertical split' })
