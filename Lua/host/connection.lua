--[[
	Handles the connection to the Intellicon host
	

]]--

do -- load and parse config file
	local content = file.readAll("commands.json")
	--if content then content = json.parse(content) end
	content = content or {}
	
end

-- main function that accepts our data
function onData(data, IP)
	print(data)
	
	local _l = string.len(data)
	if _l < 2 then return end
	
	local a = tonumber(data[0])
	local b = tonumber(data[1])
end

do -- Open UDP Socket
	_G._socket = udp.open(config.ip_port, false, onData)


	if _G._socket then 
		print("Sucessfully opened port on " .. config.ip_port) 
	else
		error("Something went wrong creating the socket!")
	end
end
