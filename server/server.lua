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
    local result2 = MySQL.prepare.await('SELECT COUNT(*) as count FROM ph_num WHERE number LIKE ?', { query })
    local number = Player.PlayerData.charinfo.phone
    if result2 == 0 and result == 0 then
        local newnumber = tonumber(item)
        local oldnumber = tonumber(number)
        print(oldnumber .. ' to ' .. newnumber)
        print(newnumber)
        MySQL.insert('INSERT INTO ph_num (number) VALUES (?)', {newnumber})
        print(number)
        MySQL.query('DELETE FROM ph_num WHERE number= ?;', {number})
        Player.Functions.UpdateNumber(newnumber, 0)
        TriggerClientEvent('notify1', src)
        Player.Functions.RemoveItem('simcard', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["simcard"], "remove")
    else
        TriggerClientEvent('notify2', src)
    end
end)