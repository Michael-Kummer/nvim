return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "julials" },
        })

        local lspconfig = require("lspconfig")

        -- Lua LSP configuration
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        -- Pyright configuration
        lspconfig.pyright.setup {}

        -- Julia LSP configuration
        lspconfig.julials.setup({
            julia_env_path = "~/.julia/environments/v1.10/",
            on_new_config = function(config, workspace_dir)
                local _ = require("mason-core.functional")
                local fs = require("mason-core.fs")
                local path = require("mason-core.path")

                local env_path = nil
                local file_exists = _.compose(fs.sync.file_exists, path.concat, _.concat { workspace_dir })
                if (file_exists { "Project.toml" } and file_exists { "Manifest.toml" }) or
                    (file_exists { "JuliaProject.toml" } and file_exists { "JuliaManifest.toml" }) then
                    env_path = workspace_dir
                end

                if not env_path then
                    env_path = config.julia_env_path and vim.fn.expand(config.julia_env_path)
                end

                if not env_path then
                    local ok, env = pcall(vim.fn.system, {
                        "julia",
                        "--startup-file=no",
                        "--history-file=no",
                        "-e",
                        "using Pkg; print(dirname(Pkg.Types.Context().env.project_file))",
                    })
                    if ok then
                        env_path = env
                    end
                end

                config.cmd = {
                    vim.fn.exepath "julia-lsp",
                    env_path,
                }
                config.cmd_env = vim.tbl_extend("keep", config.cmd_env or {}, {
                    SYMBOL_SERVER = config.symbol_server,
                    SYMBOL_CACHE_DOWNLOAD = (config.symbol_cache_download == false) and "0" or "1",
                })
            end,
        })
    end,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
}

