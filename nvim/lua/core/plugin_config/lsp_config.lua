require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'eslint' }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', 'cs', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'di', ':OrganizeImports<CR>', { noremap = true, silent = true })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

local commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
}


require('lspconfig').lua_ls.setup { on_attach = on_attach, capabilities = capabilities, commands = commands }
require('lspconfig').tsserver.setup { on_attach = on_attach, capabilities = capabilities, commands = commands  }
require('lspconfig').eslint.setup { on_attach = on_attach, capabilities = capabilities, commands = commands }
