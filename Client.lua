local QBCore = exports['qb-core']:GetCoreObject()
local interactions = {}
-- opens the ui
RegisterNetEvent('nyx-elevator:showmenu', function(playerId)
    SendNUIMessage({action = 'showlift'})
    SetNuiFocus(true, true)
end)
-- hides the ui
RegisterNetEvent('nyx-elevator:hidemenu', function(playerId)
    SendNUIMessage({action = 'hidelift'})
    SetNuiFocus(false, false)
end)

-- handles changing floors
local function UseElevator(data)
    local ped = PlayerPedId()

    QBCore.Functions.Progressbar("Call_Lift", Config.Locals[Config.UseLanguage].Waiting, Config.WaitTime, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@apt_trans@elevator",
        anim = "elev_1",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "anim@apt_trans@elevator", "elev_1", 1.0)
        DoScreenFadeOut(500)
        Wait(1000)
        if Config.UseSoundEffect then
            TriggerServerEvent("InteractSound_SV:PlayOnSource", Config.Elevators[data.lift].Sound, 0.05)
        end
        SetEntityCoords(ped, data.floor.Coords.x, data.floor.Coords.y, data.floor.Coords.z, 0, 0, 0, false)
        SetEntityHeading(ped, data.floor.ExitHeading)
        Wait(1000)
        DoScreenFadeIn(600)
        
    end)
end

function AddInteraction(index, coords)
    interactions[index] = {
        id = 'elevator'..index,
        name = 'elevator',
        coords = coords,
        distance = 5.0,
        interactDst = 2.5,
        options = {
            {
                label = 'Elevator',
                action = function(entity, coords, args)
                    TriggerEvent('nyx-elevator:showmenu')
                end,
            },
        }
    }

    exports.interact:AddInteraction(interactions[index])
end
-- creats eye  targets from config
CreateThread(function()
    for k, v in pairs(Config.Elevator) do
        local coords = vector3(v.location.x, v.location.y, v.location.z)
        AddInteraction(k, coords)
    end
end)



function NearestElevator()
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    
    local nearestElevator = nil
    local nearestDistance = math.huge
    
    for _, elevator in pairs(Config.Elevator) do 
        local distance = Vdist(playerCoords, elevator.location)
        
        if distance < nearestDistance then
            nearestElevator = elevator
            nearestDistance = distance
        end
    end
    
    return nearestElevator, nearestDistance
end


RegisterNUICallback('selectfloor', function(data, cb)
    local floorNumber = tonumber(data.number)
    
    -- Get the nearest elevator and its floors
    local nearestElevator, nearestDistance = NearestElevator()
    if nearestElevator then
        local selectedFloor = nearestElevator.Floors[floorNumber]
        
        if selectedFloor then
            -- Call the UseElevator function with the elevator and floor data
            UseElevator({ lift = nearestElevator, floor = selectedFloor })
            cb({ success = true, message = "Floor selected successfully" })
            TriggerEvent("nyx-elevator:hidemenu")
        else
            cb({ success = false, message = "Invalid floor selection" })
            TriggerEvent("nyx-elevator:hidemenu")
        end
    else
        cb({ success = false, message = "No elevator found" })
    end
end)



RegisterNUICallback('escape', function(_, cb)
    TriggerEvent("nyx-elevator:hidemenu")
    cb("ok")
end)