local QBCore = exports['qb-core']:GetCoreObject()
local ped = PlayerPedId()


local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end
RegisterNetEvent('simcard:UseSimcard', function(source, args)
    if Config.randomnumber then
        loadAnimDict("cellphone@")
        TaskPlayAnim(ped, 'cellphone@', 'f_cellphone_text_in', 8.0, 10.0, 8000, 2, 1, false, false, false)
        QBCore.Functions.Progressbar("Change_Num", "Changing Phone number", 8000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {
            model = "prop_npc_phone_02",
            bone = 28422,
        }, {}, function()
            StopAnimTask(ped, "cellphone@", "f_cellphone_text_in", 8.0)
            ClearPedTasks(ped)
            TriggerServerEvent('checkNumberrand',  item)
        end, function()
            StopAnimTask(ped, "cellphone@", "f_cellphone_text_in", 8.0)
            ClearPedTasks(ped)
            QBCore.Functions.Notify( "Cancelled", "error")
        end) 
    else
        local dialog = exports["qb-input"]:ShowInput({
            header = "Phone number change app", 
            submitText  = "New Number",
            inputs = {
                {
                text = "Change your phone number",
                name = "item",
                type = "number",
                isRequired = true,
                }
            },
        })
        if dialog ~= nil then
            item = tonumber(dialog.item)
            local length = string.len(item)
            if length ~= Config.charLen then
                QBCore.Functions.Notify("Invalid Input", "error" )
            else
                loadAnimDict("cellphone@")
                TaskPlayAnim(ped, 'cellphone@', 'f_cellphone_text_in', 8.0, 10.0, 8000, 2, 1, false, false, false)
                QBCore.Functions.Progressbar("Change_Num", "Changing Phone number", 8000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {
                    model = "prop_npc_phone_02",
                    bone = 28422,
                }, {}, function()
                    StopAnimTask(ped, "cellphone@", "f_cellphone_text_in", 8.0)
                    ClearPedTasks(ped)
                    TriggerServerEvent('checkNumber',  item)
                end, function()
                    StopAnimTask(ped, "cellphone@", "f_cellphone_text_in", 8.0)
                    ClearPedTasks(ped)
                    QBCore.Functions.Notify( "Cancelled", "error")
        end) 
            end
        end
    end
end)


RegisterNetEvent('notify1', function ()
    QBCore.Functions.Notify("Number changed", "primary")
end)

RegisterNetEvent('notify2', function ()
    QBCore.Functions.Notify("Sorry this number is not available", "error")
end)

