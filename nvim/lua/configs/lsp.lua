-- [[ Configure LSP ]]

-- Some utilities
vim.keymap.set("n", "<leader>ls", ':LspStart<cr>', { desc = 'Lsp start' })
vim.keymap.set("n", "<leader>lp", ':LspStop<cr>', { desc = 'Lsp ppause' })
vim.keymap.set("n", "<leader>lr", ':LspRestart<cr>', { desc = 'Lsp restart' })


--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- Function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

  nmap('gd', require('fzf-lua').lsp_definitions, 'Goto Definition')
  nmap('gr', require('fzf-lua').lsp_references, 'Goto References')
  nmap('gI', require('fzf-lua').lsp_implementations, 'Goto Implementation')
  nmap('<leader>D', require('fzf-lua').lsp_typedefs, 'Type Definition')
  nmap('<leader>ds', require('fzf-lua').lsp_document_symbols, 'Document Symbols')
  nmap('<leader>ws', require('fzf-lua').lsp_workspace_symbols, 'Workspace Symbols')
  nmap('<leader>ca', require('fzf-lua').lsp_code_actions, 'Code Action')
  -- Bind gt to Telescope LSP type definitions
  nmap('gt', require('fzf-lua').lsp_typedefs, 'Goto Type Def')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')

  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Workspace List Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

vim.api.nvim_set_keymap('n', '<leader>ff', ':Format<CR>', { noremap = true, silent = true, desc = "Format" })


-- document existing key chains
local wk = require("which-key")
wk.add({
  { "<leader>b", group = "Buffer" },
  { "<leader>b_", hidden = true },
  { "<leader>c", group = "Code" },
  { "<leader>c_", hidden = true },
  { "<leader>d", group = "Document" },
  { "<leader>d_", hidden = true },
  { "<leader>f_", hidden = true },
  { "<leader>g", group = "Git" },
  { "<leader>g_", hidden = true },
  { "<leader>i", group = "Insert" },
  { "<leader>i_", hidden = true },
  { "<leader>r", group = "Rename" },
  { "<leader>r_", hidden = true },
  { "<leader>s", group = "Search" },
  { "<leader>s_", hidden = true },
  { "<leader>t", group = "Toggle" },
  { "<leader>t_", hidden = true },
  { "<leader>w", group = "Workspace" },
  { "<leader>w_", hidden = true },
  { "<leader>x", group = "Error" },
  { "<leader>x_", hidden = true },
  { "<leader>", group = "VISUAL <leader>", mode = "v" },
  { "<leader>k", group = "Harpoon Explorer", icon = "󰛢" },
  { "<leader>", group = "Leader", icon = "󰘳" },
  { "<leader>g", group = "Git", icon = "󰊢" },
})


-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config.
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- TODO:
  clangd = {},
  -- gopls = {},
  -- pyright = {},
  rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

for server_name, server_config in pairs(servers) do
  require('lspconfig')[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = server_config,
    filetypes = (server_config or {}).filetypes,
  }
end

local lsp = require('lspconfig')
local configs = require('lspconfig.configs')
if not configs.just_lsp then
  configs.just_lsp = {
    default_config = {
      cmd = { '/home/dream/.cargo/bin/just-lsp' },
      filetypes = { 'just' },
      root_dir = function(fname)
        return lsp.util.find_git_ancestor(fname)
      end,
      settings = {},
    },
  }
end
lsp.just_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
