local wezterm = require('wezterm')
local files_in_bg = wezterm.glob(wezterm.config_dir .. "/bg/*")

wezterm.on('window-config-reloaded', function()
  wezterm.log_info 'The config was reloaded for this window!'
end)

local config = require('config')
local appearance = require('config.appearance')
local bindings = require('config.bindings')

return config:init()
  :append(appearance:init(files_in_bg))
  :append(bindings)
  .options
