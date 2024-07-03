repeat
    task.wait()
until game:IsLoaded()

local Loader = {}
Loader.games = {
    [nil] = {
        name = nil,
        script_id = nil
    }
}


function Loader:__init()
    if not Loader.games[game.GameId] then
        warn(`{game.GameId} is not supported`)

        return
    end

    local script_id = Loader.games[game.GameId].script_id
    local http = `https://api.luarmor.net/files/v3/loaders/{script_id}.lua`

    warn(`{identifyexecutor()}: {http}`)
    loadstring(game:HttpGet(http))()
end


Loader.__init()