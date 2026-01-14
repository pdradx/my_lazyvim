local function remove_value(tbl, value)
  for i = #tbl, 1, -1 do
    if tbl[i] == value then
      table.remove(tbl, i)
      return true
    end
  end
  return false
end

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      remove_value(opts.ensure_installed, "stylua")
      -- if remove_value(opts.ensure_installed, "stylua") then
      --   vim.notify("Removed stylua from mason ensure_installed...")
      -- end
      table.insert(opts.ensure_installed, "clang-format")
      -- vim.notify("Mason opts: " .. vim.inspect(opts), vim.log.levels.DEBUG)
    end,
    -- opts = {
    --   ensure_installed = {
    --     "stylua",
    --     "shellcheck",
    --     "shfmt",
    --     "flake8",
    --   },
    -- },
  },

  {
    "mfussenegger/nvim-lint",
    -- optional = true,
    opts = function(_, opts)
      -- vim.notify("Removing cmake linter(before): " .. vim.inspect(opts), vim.log.levels.DEBUG)
      opts.linters_by_ft["cmake"] = nil
      -- vim.notify("Removing cmake linter(after): " .. vim.inspect(opts), vim.log.levels.DEBUG)
    end,
    -- opts = {
    --   linters_by_ft = {
    --     cmake = { "cmakelint" },
    --   },
    -- },
  },
  -- -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   -- opts will be merged with the parent spec
  --   opts = { use_diagnostic_signs = true },
  -- },
  --
  -- -- add cmp-emoji
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "emoji" })
  --   end,
  -- },
}
