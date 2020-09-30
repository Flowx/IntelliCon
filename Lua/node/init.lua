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

_G.port = 1337

_G.connected = false 


think.add("mainloop", 1000, function()
	if not connected then
		print("sending broadcast")
		udp.dump("10.0.0.255", port, "$")
	end
end)




