return {
  "keaising/im-select.nvim",
  event = "InsertLeave",
  opts = function()
    local options = {
      -- Restore the previous used input method state when the following events
      -- are triggered. If you don't want to restore previous used input method in Insert mode,
      -- just let it empty as `set_previous_events = {}`.
      set_previous_events = {},
    }
    local os_info = vim.loop.os_uname()
    if os_info.sysname == "Windows" then
      -- be sure that `im-select.exe` has been added to env var "Path"
      options.default_command = "im-select.exe"
    elseif os_info.sysname == "Darwin" then
      -- be sure that `im-select` has been added to env var "PATH"
      options.default_command = "im-select"
    elseif os_info.sysname == "Linux" and vim.fn.has "wsl" == 1 then
      -- todo: use environment variable to get the path of executable file
      options.default_command = "/mnt/c/Users/yusong/external/bin/im-select.exe"
    end
    return options
  end,
}
