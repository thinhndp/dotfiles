local wezterm = require('wezterm')
local act = wezterm.action
local platform = require('utils.platform')()
local os = require 'os'

local mod = {}
if platform.is_mac then
  mod.CONTROL = 'CMD'
else
  mod.CONTROL = 'CTRL'
end

local keys = {
  -- misc/useful --
  { key = 'F1', mods = 'NONE', action = 'ActivateCopyMode' },
  { key = 'F2', mods = 'NONE', action = act.ActivateCommandPalette },
  { key = 'F3', mods = 'NONE', action = act.ShowLauncher },
  { key = 'F4', mods = 'NONE', action = act.ShowTabNavigator },
  { key = 'F12', mods = 'NONE', action = act.ShowDebugOverlay },

  -- turn background image on/off --
  {
    key = 'F5',
    mods = 'NONE',
    action = wezterm.action_callback(function()
      wezterm.log_info 'in F5 bro'
      local old_dir = wezterm.config_dir .. "/_bg"
      local new_dir = wezterm.config_dir .. "/bg"
      os.rename(old_dir, new_dir)
      wezterm.reload_configuration()
    end)
  },
  {
    key = 'F5',
    mods = mod.CONTROL,
    action = wezterm.action_callback(function()
      wezterm.log_info 'in cmd F5 bro'
      local old_dir = wezterm.config_dir .. "/bg"
      local new_dir = wezterm.config_dir .. "/_bg"
      os.rename(old_dir, new_dir)
    end)
  },
}

return {
  keys = keys
}
