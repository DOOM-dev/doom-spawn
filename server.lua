local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('doom-spawn:server:getOwnedHouses', function(source, cb, cid)
    if cid ~= nil then
        local houses = exports.oxmysql:fetchSync('SELECT * FROM player_houses WHERE citizenid = ?', {cid})
        if houses[1] ~= nil then
            cb(houses)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)
