local Connections = {}


function Connections:disconnect()
    if not Connections[self] then
        return
    end

    Connections[self]:Disconnect()
    Connections[self] = nil
end


function Connections:disconnect_all()
    for _, value in Connections do
        if typeof(value) == 'function' then
            continue
        end

        value:Disconnect()
    end
end


return Connections