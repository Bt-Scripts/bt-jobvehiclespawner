Config = {}

Config.SpawnCoords = vector3(445.3405, -1021.8934, 28.5163)
Config.SpawnHeading = 90.0 -- direction of the vehicle when it spawns in

Config.AllowedJob = 'police' -- job name required to open the menu

Config.Marker = {
    type = 1,           -- marker type (1 = cylinder)
    size = 1.5,         -- radius
    height = 0.5,
    r = 0, g = 100, b = 200, a = 150,  -- colour (RGBA)
    drawDistance = 30.0 -- stops drawing the marker beyond this distance
}

Config.Categories = {
    {
        id = 'general_duties',
        title = 'General Duties',
        vehicles = {
            { title = 'Police Vehicle 1', model = 'police' },
            { title = 'Police Vehicle 2', model = 'police2' },
            { title = 'Police Vehicle 3', model = 'police3' },
        }
    },
    {
        id = 'detective_veh',
        title = 'Detective',
        vehicles = {
            { title = 'FBI 1', model = 'fbi' },
            { title = 'FBI 2', model = 'fbi2' },
            { title = 'FBI 3', model = 'police4' },
        }
    },
    {
        id = 'swat_veh',
        title = 'Swat',
        vehicles = {
            { title = 'Riot Van', model = 'riot' },
        }
    },
    {
        id = 'north_yankton_veh',
        title = 'North Yankton',
        vehicles = {
            { title = 'North Yankton Police 1', model = 'policeold1' },
            { title = 'North Yankton Police 2', model = 'policeold2' },
        }
    },
    {
        id = 'sheriff_veh',
        title = 'Sheriff',
        vehicles = {
            { title = 'Sheriff Car 1', model = 'sheriff' },
            { title = 'Sheriff Car 2', model = 'sheriff2' },
        }
    },
    {
        id = 'other_veh',
        title = 'Other',
        vehicles = {
            { title = 'Park Ranger', model = 'pranger' },
        }
    },
}
