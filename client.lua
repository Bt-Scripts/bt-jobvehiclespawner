local ESX = exports['es_extended']:getSharedObject()

local function spawnVehicle(model)
    local spawnCoords = Config.SpawnCoords
    local vehicleHeading = Config.SpawnHeading
    local vehicleHash = GetHashKey(model or "adder")

    RequestModel(vehicleHash)

    Citizen.CreateThread(function()
        local waiting = 0
        while not HasModelLoaded(vehicleHash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                lib.notify({ title = 'Failed to Spawn', description = 'The vehicle model could not be loaded.', type = 'error' })
                return
            end
        end

        local vehicle = CreateVehicle(vehicleHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, vehicleHeading, true, false)
        if DoesEntityExist(vehicle) then
            lib.notify({ title = 'Successfully Spawned', description = '', type = 'success' })
        else
            lib.notify({ title = 'Error While Spawning', description = '', type = 'error' })
        end
    end)
end

local mainOptions = {
    { title = 'Cars' }
}

for _, category in ipairs(Config.Categories) do
    table.insert(mainOptions, {
        title = category.title,
        menu = category.id,
        icon = 'car'
    })
end

lib.registerContext({
    id = 'main-menu',
    title = 'Vehicle Spawn Menu',
    options = mainOptions
})

for _, category in ipairs(Config.Categories) do
    local options = {}

    for _, veh in ipairs(category.vehicles) do
        table.insert(options, {
            title = veh.title,
            description = '',
            icon = 'car',
            onSelect = function()
                spawnVehicle(veh.model)
            end
        })
    end

    lib.registerContext({
        id = category.id,
        title = category.title,
        menu = 'main-menu',
        options = options
    })
end

RegisterCommand('vehiclemenu', function()
    local playerData = ESX.GetPlayerData()
    if playerData.job.name ~= Config.AllowedJob then
        lib.notify({ title = 'Access Denied', description = 'You are not a police officer.', type = 'error' })
        return
    end
    lib.showContext('main-menu')
end)

Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - Config.SpawnCoords)
        local m = Config.Marker

        if dist < m.drawDistance then
            DrawMarker(m.type, Config.SpawnCoords.x, Config.SpawnCoords.y, Config.SpawnCoords.z, 0, 0, 0, 0, 0, 0, m.size, m.size, m.height, m.r, m.g, m.b, m.a, false, true, 2, false, nil, nil, false)
            Citizen.Wait(0)
        else
            Citizen.Wait(1000)
        end
    end
end)
