print("Initializing Intellicon Host!\n")

include("jsonparser.lua") -- generic library to parse JSON

do -- load and parse config file
	local content = file.readAll("intellicon_host.cfg")
	if content then content = json.parse(content) end
	content = content or {}

	_G.config = {}
	_G.config.ip_port		= content.ip_port or 1337 -- IP port to run on
	_G.config.node_name 	= content.node_name or "Unnamed Host" -- Human readable name
	_G.config.node_id 		= content.node_id or 0 -- 32bit ID; given by Intellicon Host; DONT EDIT MANUALLY!

	local jstr = json.stringify(config)
	file.writeAll("intellicon_Host.cfg", jstr)
end

include("connection.lua")

