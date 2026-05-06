return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          {
            "<F5>",
            function()
              require("dap").continue()
            end,
            desc = "Run/Continue",
          },
          {
            "<F10>",
            function()
              require("dap").step_over()
            end,
            desc = "Step Over",
          },
          {
            "<F11>",
            function()
              require("dap").step_into()
            end,
            desc = "Step Into",
          },
          -- { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
          -- { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
          -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
          -- { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
          -- { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
          -- { "<leader>dj", function() require("dap").down() end, desc = "Down" },
          -- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
          -- { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
          -- { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
          -- { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
          -- { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
          -- { "<leader>ds", function() require("dap").session() end, desc = "Session" },
          -- { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
          -- { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
        },
      },
    },
  },
}
