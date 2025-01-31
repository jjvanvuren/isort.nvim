local M = {}

local function run_isort()
  -- Get the current buffer and its file path
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)

  -- If the file exists and is a Python file, run isort
  if file ~= "" and file:match("%.py$") then
    -- Check if isort would make any changes
    vim.fn.system({ "isort", "--check-only", file })

    if vim.v.shell_error ~= 0 then
      -- Run the isort command on the file using vim.fn.system
      vim.fn.system({ "isort", file })
      -- Reload the buffer to see the changes
      vim.cmd("e!")
    end
  end
end

function M.setup(opts)
  opts = opts or {}
  opts.sort_on_save = opts.sort_on_save == nil and true or opts.sort_on_save
  opts.keymap = opts.keymap or "<leader>ci"

  if opts.sort_on_save then
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.py",
      callback = run_isort,
    })
  end

  vim.api.nvim_create_user_command("Isort", run_isort, {})

  vim.keymap.set("n", opts.keymap, ":Isort<CR>", { noremap = true, silent = true, desc = "Sort Python Imports" })
end

return M
