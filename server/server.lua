local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("simcard", function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player or not Player.Functions.GetItemByName('simcard') then return end
    TriggerClientEvent("simcard:UseSimcard", source)
end)

RegisterNetEvent('checkNumber', function(item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local PhoneNumber = item
    local query = '%' .. PhoneNumber .. '%'
    local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE charinfo LIKE ?', { query })
    local oldnumber = Player.PlayerData.charinfo.phone
    if result == 0 then
        local newnumstr = tostring(PhoneNumber)
        Player.Functions.UpdateNumber(newnumstr, 0)
        Player.Functions.Save()
        TriggerClientEvent('notify1', src)
        Player.Functions.RemoveItem('simcard', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["simcard"], "remove")
    else
        TriggerClientEvent('notify2', src)
    end
end)

RegisterNetEvent('checkNumberrand', function()
    local math1 = string.rep(1, Config.charLen)
    local math2 = string.rep(9, Config.charLen)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local PhoneNumber = math.random(math1 , math2)
    local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE charinfo LIKE ?', { PhoneNumber })
    local oldnumber = Player.PlayerData.charinfo.phone
    if result == 0 then
        local newnumstr = tostring(PhoneNumber)
        Player.Functions.UpdateNumber(newnumstr, 0)
        Player.Functions.Save()
        TriggerClientEvent('notify1', src)
        Player.Functions.RemoveItem('simcard', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["simcard"], "remove")
    else
        TriggerClientEvent('notify2', src)
    end
end)
