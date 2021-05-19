local lsp_config = require'lspconfig'
local lsp_status = require'lsp-status'
local lsp_completion = require'completion'
local util = require 'lspconfig/util'
local on_attach = require'completion'.on_attach
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
        root_dir = util.root_pattern("go.mod",".git", "main.go");
    },
    rust_analyzer = {
        root_dir=util.root_pattern("Cargo.toml", "rust-project.json");
    },
    tsserver = { root_dir = root_dir },
    html = { root_dir = root_dir },
}

for server, config in pairs(servers) do
    lsp_config[server].setup(vim.tbl_deep_extend('force', lsp_default_config, config))
end

require 'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true
    }
}

