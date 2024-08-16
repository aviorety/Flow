local HttpService = game:GetService('HttpService')

local Config = {}


function Config.save(file_name: any, config: any)
	local flags = HttpService:JSONEncode(config)
	writefile('Flow/'..file_name..'.lua', flags)
end


function Config.load(file_name: any, config: any)
	if not isfile('Flow/'..file_name..'.lua') then
		Config.save(file_name, config)

		return
	end

	local flags = readfile('Flow/'..file_name..'.lua')

	if not flags then
		Config.save(file_name, config)

		return
	end
	
	return HttpService:JSONDecode(flags)
end


return Config