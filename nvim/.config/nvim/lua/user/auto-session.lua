local M = {}

local opts = {auto_save_enabled = true, auto_restore_enabled = true}

function M.setup() require('auto-session').setup(opts) end

return M
