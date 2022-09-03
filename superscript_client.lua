godMode = "disabled"
hiddenHud = false
debugging = false
magicCursor = false

function explode()
    local x, y, z = getElementPosition(localPlayer)
    for i=1, 10 do
        createExplosion(x, y, z, 10, true, 10, true)
    end
end
addCommandHandler ( "boom", explode )

addEventHandler ( "onClientPlayerDamage",root,
function ()
    if getElementData(source,"invincible") then
        cancelEvent()
    end
end)

function stopDamage ()
    if (godMode == "enabled") then
        cancelEvent()
    end
end
addEventHandler ( "onClientPlayerDamage", getRootElement(), stopDamage )
addEventHandler ( "onClientPlayerStealthKill", getRootElement(), stopDamage )
addEventHandler ( "onClientPedDamage", getRootElement(), stopDamage )

function activeGod ()
    local r, g, b = 0
    if (godMode == "enabled") then
        godMode = "disabled"
        r = 200
        g = 0
        b = 0
    else
        godMode = "enabled"
        r = 0
        g = 200
        b = 0
    end

    outputChatBox("God mode: " ..godMode.. "", r, g, b, false)
end
addCommandHandler("god", activeGod)

function activeHiddenHud ()
    if (hiddenHud == false) then
        hiddenHud = true
        setPlayerHudComponentVisible("all", false)
        showChat(false)
    else
        hiddenHud = false
        setPlayerHudComponentVisible("all", true)
        showChat(true)
    end
end
addCommandHandler("hud", activeHiddenHud)

addCommandHandler("debug",
function()
    if debugging == false then
        debugging = true
        outputChatBox("Debugging: enabled", 0, 200, 0, false)
        setDebugViewActive(true)
    else
        debugging = false
        outputChatBox("Debugging: disabled", 200, 0, 0, false)
        setDebugViewActive(false)
    end
end)

addEventHandler("onClientPlayerDamage", getRootElement(),
function(_, damageType)
    local x, y, z = getElementPosition(localPlayer)
    local fat = getPedStat(localPlayer, 21)
    if fat == 1000 and damageType == 54 then
        createExplosion(x, y, z, 9, true, 10, true)
    end
    
end)

addEventHandler("onClientClick", root,
function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, clickedElement)
    if magicCursor == true then
        outputChatBox(inspect(clickedElement))
        showCursor(false, false)
    end
    magicCursor = false
end)

addCommandHandler("magiccursor",
function()
    magicCursor = true
    showCursor(true, true)
end)

function destroyEmptyVehicles(player, command)
    local vehicles = getElementsByType("vehicle")
    for i, vehicle in ipairs(vehicles) do
        if getVehicleOccupant(vehicle) == false then
            destroyElement(vehicle)
        end
    end
end
addCommandHandler("clearveh", destroyEmptyVehicles)

--TODO: creare generatore di treni con (tipo di treno, tipo di carrozze, numero di carrozze) come parametri
