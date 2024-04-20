Config = {}

Config.WaitTime = 8000 -- This will set the time for the ProgressBar | 1000 = 1 second

Config.UseLanguage = "en" -- make new languages to your own likng

Config.UseSoundEffect = false -- makes a sound when you use elevator Note: still a work in progress

Config.Elevator = {
    [1] = {
        Sound = "LiftSoundBellRing",
        name = "elevator_", -- it should be different for each elevator you make
        location = vector3(355.5, -596.06, 28.77), -- This is the location for interaction
        -- everything above is releated to interaction
        Floors = {
            [1] = {
                Coords = vector3(338.51, -583.81, 74.16),
                ExitHeading = "250.07"
            },
            [2] = {
                Coords = vector3(327.02, -603.85, 43.28),
                ExitHeading = "337.25"
            },
            [3] = {
                Coords = vector3(340.18, -584.68, 28.8),
                ExitHeading = "104.87"
            },
        }
    },

    [2] = {
        Sound = "LiftSoundBellRing",
        name = "elevator_2", -- it should be different for each elevator you make
        location = vector3(-270.4, -959.07, 31.22), -- This is the location for interaction
        -- everything above is releated to interaction 
        Floors = {
            [1] = {
                Coords = vector3(-260.72, -959.64, 130.62),
                ExitHeading = "254.72"
            },
        }
    },

    [3] = {
        Sound = "LiftSoundBellRing",
        name = "elevator_3", -- it should be different for each elevator you make
        location = vector3(-260.72, -959.64, 130.62), -- This is the location for interaction
        -- everything above is releated to interaction 
        Floors = {
            [0] = {
                Coords = vector3(-270.4, -959.07, 31.22),
                ExitHeading = "254.72"
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