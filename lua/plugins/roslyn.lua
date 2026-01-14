vim.lsp.config("roslyn", {
  on_attach = function(client, bufnr)
    -- print("This will run when the server attaches!")
    vim.keymap.set("n", "<leader>cb", function()
      print("Here I want to build C# solution!")
      Snacks.terminal("ls", {
          auto_close = false
      })
      -- -- require("snacks")
      -- Snacks
      -- -- .terminal("bash -c 'cmake -B build && cmake --build build'", {
      -- .terminal("bash -c 'ls'", {
      --   cwd = vim.fn.getcwd(),
      -- })
    end, { buffer = bufnr, desc = "Build C# solution" })
  end,
  settings = {
    ["csharp|inlay_hints"] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
      csharp_enable_inlay_hints_for_types = true,
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
  },
})

return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "roslyn",
      },
    },
  },
  {
    "seblyng/roslyn.nvim",

    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- "auto" | "roslyn" | "off"
      --
      -- - "auto": Does nothing for filewatching, leaving everything as default
      -- - "roslyn": Turns off neovim filewatching which will make roslyn do the filewatching
      -- - "off": Hack to turn off all filewatching. (Can be used if you notice performance issues)
      filewatching = "auto",

      -- Optional function that takes an array of targets as the only argument. Return the target you
      -- want to use. If it returns `nil`, then it falls back to guessing the target like normal
      -- Example:
      --
      -- choose_target = function(target)
      --     return vim.iter(target):find(function(item)
      --         if string.match(item, "Foo.sln") then
      --             return item
      --         end
      --     end)
      -- end
      choose_target = nil,

      -- Optional function that takes the selected target as the only argument.
      -- Returns a boolean of whether it should be ignored to attach to or not
      --
      -- I am for example using this to disable a solution with a lot of .NET Framework code on mac
      -- Example:
      --
      -- ignore_target = function(target)
      --     return string.match(target, "Foo.sln") ~= nil
      -- end
      ignore_target = nil,

      -- Whether or not to look for solution files in the child of the (root).
      -- Set this to true if you have some projects that are not a child of the
      -- directory with the solution file
      broad_search = true,

      -- Whether or not to lock the solution target after the first attach.
      -- This will always attach to the target in `vim.g.roslyn_nvim_selected_solution`.
      -- NOTE: You can use `:Roslyn target` to change the target
      lock_target = false,

      -- If the plugin should silence notifications about initialization
      silent = false,
    },
  },
  {
    "mfussenegger/nvim-dap",
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
}
