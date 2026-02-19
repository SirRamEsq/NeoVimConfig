require("rlConfig.basicSettings")
require("rlConfig.pluginsLazyInit")
require("rlConfig.keyMappings")
require("rlConfig.foldSettings")

local os_name = vim.loop.os_uname().sysname

if os_name == "Linux" then
	require("rlConfig.osLinux")
elseif os_name == "Windows_NT" then
	require("rlConfig.osWindows")
end
