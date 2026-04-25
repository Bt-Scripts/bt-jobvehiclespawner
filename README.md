# bt-jobvehiclemenu

A fivem vehicle spawn menu for job vehicles. Opens a context menu with categories, pick a vehicle and it spawns at the coords you set in config. only accessible to the configured job. has a marker at the spawn point so players know where vehicles appear.

---

## Dependencies

you need these or it wont work

- [ox_lib](https://github.com/overextended/ox_lib)
- [es_extended (ESX)](https://github.com/esx-framework/esx_core)

---

## install

1. drop the folder into your resources
   ```
   resources/[scripts]/bt-jobvehiclemenu
   ```

2. add to server.cfg
   ```
   ensure bt-jobvehiclemenu
   ```

3. set your spawn coords, job name and add your vehicles in config.lua

---

## Configuration

everything is in config.lua

```lua
Config.SpawnCoords = vector3(445.3405, -1021.8934, 28.5163) -- where vehicles spawn
Config.SpawnHeading = 90.0  -- direction the vehicle faces when spawned
Config.AllowedJob = 'police' -- only this job can open the menu
```

### marker

the marker shows up at the spawn coords in game so players know where vehicles will appear

```lua
Config.Marker = {
    type = 1,           -- marker type (1 = cylinder)
    size = 1.5,         -- radius
    height = 0.5,
    r = 0, g = 100, b = 200, a = 150,  -- colour (RGBA)
    drawDistance = 30.0 -- stops drawing beyond this distance
}
```

### adding vehicles

to add a category or vehicle just copy the pattern below:

```lua
{
    id = 'my_category',    -- must be unique, no spaces
    title = 'My Category', -- shown in the menu
    vehicles = {
        { title = 'My Vehicle', model = 'police' },   -- model is the vehicle spawn name
        { title = 'My Vehicle 2', model = 'police2' },
    }
},
```

add more `{ title, model }` lines for more vehicles, or copy the whole block for a new category.

---

## usage

open the menu with the command:
```
/vehiclemenu
```

only players with the configured job can open it. everyone else gets an access denied notification.

pick a category then pick a vehicle, it spawns at the coords set in config.

---

## files

```
bt-jobvehiclemenu/
├── fxmanifest.lua
├── config.lua
└── client.lua
```

---

free to use, do whatever with it
