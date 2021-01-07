if not _G.__oldtype then -- overloads
	_G.__oldtype = _G.type
	_G.type = nil
	_G.type = function( v )
		local t = getmetatable(v)
		if t and t.__type then return t.__type end
		return _G.__oldtype(v)
	end
end

print("\n\n\nInitializing IntelliCon Node\n")

include("jsonparser.lua") -- generic library to parse JSON

do -- load and parse config file
	local content = file.readAll("intellicon_node.cfg")
	if content then content = json.parse(content) end
	content = content or {}

	_G.config = {}
	_G.config.ip_port		= content.ip_port or 1337 -- IP port to run on
	_G.config.node_name 	= content.node_name or "Unnamed Node" -- Human readable name
	_G.config.node_id 		= content.node_id or 0 -- 32bit ID; given by Intellicon Host; DONT EDIT MANUALLY!

	local jstr = json.stringify(config)
	file.writeAll("intellicon_node.cfg", jstr)
end



-- open receiving port
_G.recvsocket = udp.open(config.ip_port, false, function(data, ip)
	-- parse data here
	print("received something from ", ip, " data: ", data)
end)

_G.connected = false 
think.add("mainloop", 1000, function()
	if not connected then
		print("sending broadcast")
		udp.dump("10.0.0.255", config.ip_port, "$")
		return
	end
end)




