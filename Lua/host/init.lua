if not _G.__oldtype then -- overloads
	_G.__oldtype = _G.type
	_G.type = nil
	_G.type = function( v )
		local t = getmetatable(v)
		if t and t.__type then return t.__type end
		return _G.__oldtype(v)
	end
end

print("\n\n\nInitializing IntelliCon Host\n")

udp.open(1337, false, function(data, ip)
	print("aaa")
	if data[0] == "$" then -- this is a broadcast
		print("Received Broadcast from :" .. ip .. "\n")
		
	else 
	
	end

end)

