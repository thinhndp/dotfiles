local wezterm = require('wezterm')

local appearance = {}

function appearance:init(files)
  local file = nil
  if files ~= nil then
    -- Filter out non-image files
    local image_files = {}
    for _, file in ipairs(files) do
      if file:lower():match("%.jpg$") or file:lower():match("%.png$") then
        table.insert(image_files, file)
      end
    end

    -- If there are no files, use a default file
    if #image_files ~= 0 then
      -- Select a random file from the list
      math.randomseed(os.time())
      file = image_files[math.random(#image_files)]
    end
  end

  local result = {}
  result.window_decorations = 'RESIZE'
  result.color_scheme = 'Catppuccin Macchiato'
  result.font = wezterm.font 'FiraCode Nerd Font Mono'
  result.font_size = 14
  result.freetype_load_flags = 'NO_HINTING'
  if file ~= nil then
    result.background = {
      {
        source = { File = file },
        vertical_align = 'Middle',
        horizontal_align = 'Center',
      },
      {
        source = { Color = "#282A36" },
        height = '100%',
        width = '100%',
        opacity = 0.95,
      }
    }
  else
    result.background = {
      {
        source = { Color = "#282A36" },
        height = '100%',
        width = '100%',
        opacity = 0.95,
      }
    }
  end
  return result
end

return appearance
