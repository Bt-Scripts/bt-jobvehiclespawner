lib.registerContext({
  id = 'main-menu',
  title = 'Vehicle Spawn Menu',
  options = {
      {
          title = 'Cars',
      },
      {
        title = 'General Duties',
        menu = 'general_duties',
        icon = 'car'
      },
      {
        title = 'Detective',
        menu = 'detective_veh',
        icon = 'car'
      },
      {
        title = 'Swat',
        menu = 'swat_veh',
        icon = 'car'
      },
      {
        title = 'North Yankton',
        menu = 'north_yankton_veh',
        icon = 'car'
      },
      {
        title = 'Sheriff',
        menu = 'sheriff_veh',
        icon = 'car'
      },
      {
        title = 'Other',
        menu = 'other_veh',
        icon = 'car'
      },
  }
})

lib.registerContext({
  id = 'general_duties',
  title = 'Other context menu',
  menu = 'main-menu',
  onBack = function()
      print('Went back!')
  end,
  options = {
      {
        title = 'Police Vehicle 1',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("police")
          end,
      },
      {
        title = 'Police Vehicle 2',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("police2")
          end,
      },
      {
        title = 'Police Vehicle 3',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("police3")
          end,
      },
  }
})

lib.registerContext({
  id = 'detective_veh',
  title = 'Detective Vehicles',
  menu = 'main-menu',
  onBack = function()
      print('Went back!')
  end,
  options = {
      {
        title = 'FBI 1',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("fbi")
          end,
      },
      {
        title = 'FBI 2',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("fbi2")
          end,
      },
      {
        title = 'FBI 3',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("police4")
          end,
      },
  }
})

lib.registerContext({
  id = 'swat_veh',
  title = 'Swat Vehicles',
  menu = 'main-menu',
  onBack = function()
      print('Went back!')
  end,
  options = {
      {
        title = 'Riot Van',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("riot")
          end,
      },
  }
})

lib.registerContext({
  id = 'north_yankton_veh',
  title = 'North Yankton Vehicles',
  menu = 'main-menu',
  onBack = function()
      print('Went back!')
  end,
  options = {
      {
          title = 'North Yankton Police 1',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("policeold1")
          end,
      },
      {
        title = 'North Yankton Police 2',
        description = '',
        icon = 'car',
        onSelect = function()
            spawnVehicle("policeold2")
        end,
      },
  }
})


lib.registerContext({
  id = 'sheriff_veh',
  title = 'Sheriff Vehicles',
  menu = 'main-menu',
  onBack = function()
      print('Went back!')
  end,
  options = {
      {
          title = 'Sheriff Car 1',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("sheriff")
          end,
      },
      {
        title = 'Sheriff Car 2',
        description = '',
        icon = 'car',
        onSelect = function()
            spawnVehicle("sheriff2")
        end,
      },
  }
})

lib.registerContext({
  id = 'other_veh',
  title = 'Sheriff Vehicles',
  menu = 'main-menu',
  onBack = function()
      print('Went back!')
  end,
  options = {
      {
          title = 'Park Ranger',
          description = '',
          icon = 'car',
          onSelect = function()
              spawnVehicle("pranger")
          end,
      },
  }
})

RegisterCommand('vehiclemenu', function()
  lib.showContext('main-menu')
end)

-- Function to spawn a vehicle at a specific location with a fixed heading
function spawnVehicle(model)
  local spawnCoords = vector3(445.3405, -1021.8934, 28.5163) -- Replace with your desired coordinates
  local vehicleHeading = 90.0 -- Replace with your desired rotation in degrees
  local vehicleModel = model or "adder"
  local vehicleHash = GetHashKey(vehicleModel)

  RequestModel(vehicleHash)

  Citizen.CreateThread(function()
      local waiting = 0
      while not HasModelLoaded(vehicleHash) do
          waiting = waiting + 100
          Citizen.Wait(100)
          if waiting > 5000 then
              TriggerEvent('ox_lib:notify', {
                  title = 'Failed to Spawn',
                  description = 'The vehicle model could not be loaded.',
                  type = 'error',
                  position = 'top'
              })
              return
          end
      end

      local vehicle = CreateVehicle(vehicleHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, vehicleHeading, true, false)
      if DoesEntityExist(vehicle) then
          TriggerEvent('ox_lib:notify', {
              title = 'Successfully Spawned',
              description = '',
              type = 'success',
              position = 'top'
          })
      else
          TriggerEvent('ox_lib:notify', {
              title = 'Error While Spawning',
              description = '',
              type = 'error',
              position = 'top'
          })
      end
  end)
end
