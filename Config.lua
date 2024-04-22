
Config = {}

Config.WaitTime = 8000 -- This will set the time for the ProgressBar | 1000 = 1 second

Config.UseLanguage = "en" -- make new languages to your own likng

Config.UseSoundEffect = false -- makes a sound when you use elevator Note: still a work in progress

Config.Elevator = {
    [1] = {
        Sound = "LiftSoundBellRing",
        name = "elevator_1", -- it should be different for each elevator you make
        locations = {
            vector3(355.5, -596.06, 28.77), -- This is the location for interaction can be more than one location now
            vector3(-260.72, -959.64, 130.62),
            vector3(338.51, -583.81, 74.16),
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(-270.4, -959.07, 31.22, 254.72),
            },
            [1] = {
                Coords = vector4(338.51, -583.81, 74.16, 250.07),
            },
            [2] = {
                Coords = vector4(327.02, -603.85, 43.28, 337.25),
            },
            [3] = {
                Coords = vector4(340.18, -584.68, 28.8, 104.87),
            },
        }
    },
    [2] = {
        Sound = "LiftSoundBellRing",
        name = "elevator_2", -- it should be different for each elevator you make
        locations = {
            vector3(987.53, 79.45, 80.99),
            vector3(986.84, 75.65, 111.27),
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(987.36, 79.49, 80.99, 327.01),
            },
            [1] = {
                Coords = vector4(986.84, 75.65, 111.27, 326.74),
            },
        }
    },
}





Config.Locals = {
    ["en"] = {
        Waiting = "Waiting for the Elevator...",
        Restricted = "Access Restricted!",
        CurrentFloor = "Current Floor: ",
        Unable = "You Can't Use The Elevator...",
    },
}
