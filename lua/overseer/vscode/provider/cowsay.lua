-- lua/overseer/vscode/provider/cowsay.lua
local M = {}

---@param defn table This is the decoded JSON data for the task
---@return table
M.get_task_opts = function(defn)
  print("Starting a cowsay task")
  return {
    -- cmd is required. It can be a string or list of strings.
    cmd = vim.list_extend({ "cowsay" }, defn.words),
    -- Optional working directory for task
    cwd = nil,
    -- Optionally specify environment variables for the task
    env = nil,
    -- Can override the problem matcher in the task definition
    problem_matcher = nil,
  }
end

return M
