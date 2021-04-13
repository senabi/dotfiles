local lsp_config = require'lspconfig'
local lsp_status = require'lsp-status'
local lsp_completion = require'completion'
local util = require 'lspconfig/util'
local on_attach = require'completion'.on_attach
--local lsp_saga = require'lspsaga'
--local lsp_format = require'format'

--local lsp_default_config = {on_attach = on_attach, capabilites = lsp_status.capabilities}
local lsp_default_config = { on_attach = on_attach, capabilites = vim.lsp.protocol.make_client_capabilities() }
function root_dir()
    return vim.loop.os_homedir()
end
local servers = {
    clangd = { root_dir = root_dir },
    zls = { root_dir = root_dir },
    pyls = { root_dir = root_dir },
    gopls = {
        cmd = {'gopls','--remote=auto'},
--        capabilties = {
--            textDocuemnt = {
--                completion = {
--                    completionItem = {
--                        snippetSupport = true
--                    }
--                }
--            }
--        },
--        init_options = {
--            usePlaceholders = true,
--            completeUnimported = true
--      },
--      root_dir = root_dir
        root_dir = util.root_pattern("go.mod",".git", "main.go");
    },
    rust_analyzer = {
        root_dir=util.root_pattern("Cargo.toml", "rust-project.json");
    }
}

-- function to attach completion when setting up lsp
--local on_attach = function(client)
--    require'completion'.on_attach(client)
--end
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable rust_analyzer
--lsp_config.rust_analyzer.setup({
--    on_attach=on_attach;
--    root_dir=util.root_pattern("Cargo.toml", "rust-project.json");
--    capabilities=capabilities;
--})

for server, config in pairs(servers) do
    lsp_config[server].setup(vim.tbl_deep_extend('force', lsp_default_config, config))
end

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--    virtual_text = true,
--    signs = true,
--    update_in_insert = true,
--  }
--)

require 'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true
    }
}

