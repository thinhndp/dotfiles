local platform = require('utils.platform')()

local environment = {}
if platform.is_win then
  environment.default_domain = 'WSL:Ubuntu'
end

return environment

