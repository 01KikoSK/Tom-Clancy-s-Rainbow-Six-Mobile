-- Script for modifying player's health

-- Function to get player's current health
function getHealth()
    return readBytes("Tom Clancy's Rainbow Six Mobile", 0x12345678, 4) -- Replace 0x12345678 with the actual memory address of the player's health
end

-- Function to set player's health to a specific value
function setHealth(value)
    writeBytes("Tom Clancy's Rainbow Six Mobile", 0x12345678, value) -- Replace 0x12345678 with the actual memory address of the player's health
end

-- Function to increase player's health by a specific value
function increaseHealth(value)
    local currentHealth = getHealth()
    setHealth(currentHealth + value)
end

-- Function to decrease player's health by a specific value
function decreaseHealth(value)
    local currentHealth = getHealth()
    setHealth(currentHealth - value)
end

-- Script menu
menu = {
    -- Health menu
    {
        title = "Health",
        function = getHealth,
        -- Increase health by 10
        onclick = function() increaseHealth(10) end
    },
    -- Decrease health by 10
    {
        title = "Decrease Health",
        function = getHealth,
        onclick = function() decreaseHealth(10) end
    },
    -- Set health to 100
    {
        title = "Set Health to 100",
        function = getHealth,
        onclick = function() setHealth(100) end
    }
}

-- GameGuardian cheat menu
gameGuardian.Menu("Rainbow Six Mobile Cheat Menu", menu)