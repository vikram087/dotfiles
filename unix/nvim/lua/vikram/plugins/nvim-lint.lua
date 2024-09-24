return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters.biome = {
            name = "biome",
            cmd = "biome", -- or the full path to the biome binary if it's not on your system's PATH
            stdin = true, -- Make sure biome can read from stdin if needed
            args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--format", "json" }, -- Arguments for biome
            stream = "stdout",
            ignore_exitcode = true,
            parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
                source = "biome",
                severity = vim.lsp.protocol.DiagnosticSeverity.Warning, -- Adjust severity based on needs
            }),
        }

        lint.linters_by_ft = {
            javascript = { "biome" },
            typescript = { "biome" },
            javascriptreact = { "biome" },
            typescriptreact = { "biome" },
            python = { "ruff", "mypy" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
