--  disable to use vanila roslyn
-- stylua: ignore
if true then return {} end

return {
    recommended = function()
        return LazyVim.extras.wants({
            ft = { "cs", "vb", "fsharp" },
            root = { "*.sln", "*.csproj", "*.fsproj", "omnisharp.json", "function.json", "paket.dependencies", "paket.lock" },
        })
    end,
    -- { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "c_sharp", "fsharp" } },
    },
    {
        "nvimtools/none-ls.nvim",
        optional = true,
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = opts.sources or {}
            table.insert(opts.sources, nls.builtins.formatting.csharpier)
            table.insert(opts.sources, nls.builtins.formatting.fantomas)
        end,
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                cs = { "csharpier" },
                fsharp = { "fantomas" },
            },
        },
    },
    {
        "GustavEikaas/easy-dotnet.nvim",
        opts = {
            lsp = {
                -- enabled = false,
                enabled = true,
            },
            debugger = {
                -- The path to netcoredbg executable
                --example mason path: vim.fs.joinpath(vim.fn.stdpath("data"), "mason/bin/netcoredbg.cmd"),
                bin_path = nil,
                -- bin_path = "/nix/store/l1xsgnngjwvb1vi8yvlnvjaq92a8srxm-netcoredbg-3.1.2-1054/bin/netcoredbg",
                auto_register_dap = true,
                mappings = {
                    open_variable_viewer = { lhs = "T", desc = "open variable viewer" },
                },
            },
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "csharpier",
                "netcoredbg",
                "fantomas",
            },
        },
    },
    -- {
    --     "neovim/nvim-lspconfig",
    --     opts = {
    --         servers = {
    --             fsautocomplete = {},
    --             omnisharp = {
    --                 handlers = {
    --                     ["textDocument/definition"] = function(...)
    --                         return require("omnisharp_extended").handler(...)
    --                     end,
    --                 },
    --                 keys = {
    --                     {
    --                         "gd",
    --                         LazyVim.has("telescope.nvim") and function()
    --                             require("omnisharp_extended").telescope_lsp_definitions()
    --                         end or function()
    --                             require("omnisharp_extended").lsp_definitions()
    --                         end,
    --                         desc = "Goto Definition",
    --                     },
    --                 },
    --                 enable_roslyn_analyzers = true,
    --                 organize_imports_on_format = true,
    --                 enable_import_completion = true,
    --             },
    --         },
    --     },
    -- },
    {
        "mfussenegger/nvim-dap",
        optional = true,
        opts = function()
            local dap = require("dap")
            if not dap.adapters["netcoredbg"] then
                require("dap").adapters["netcoredbg"] = {
                    type = "executable",
                    command = vim.fn.exepath("netcoredbg"),
                    args = { "--interpreter=vscode" },
                    options = {
                        detached = false,
                    },
                }
            end
            for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
                if not dap.configurations[lang] then
                    dap.configurations[lang] = {
                        {
                            type = "netcoredbg",
                            name = "Launch file",
                            request = "launch",
                            ---@diagnostic disable-next-line: redundant-parameter
                            program = function()
                                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
                            end,
                            cwd = "${workspaceFolder}",
                        },
                    }
                end
            end
        end,
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "Nsidorenco/neotest-vstest",
        },
        opts = {
            adapters = {
                ["neotest-vstest"] = {
                    -- Here we can set options for neotest-vstest
                },
            },
        },
    },
}
