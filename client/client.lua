local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('simcard:UseSimcard', function(source, args)
    local charLen = 10
    local keyboard, item = exports["nh-keyboard"]:Keyboard({
        header = "Phone number change app", 
        rows = {"New Number"}
    })
    if keyboard then
        local length = string.len(item)
        tonumber(item)
        if length ~= charLen then
            QBCore.Functions.Notify("Invalid Input", "error" )
        else
            TriggerServerEvent('checkNumber',  item)
        end
    end
end)


RegisterNetEvent('notify1', function ()
    QBCore.Functions.Notify("Number changed", "primary")
end)

RegisterNetEvent('notify2', function ()
    QBCore.Functions.Notify("Sorry this number is not available", "error")
end)