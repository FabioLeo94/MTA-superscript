lastPlayerVehicle = {}

addEventHandler("onResourceStart", root,
function(source)
    if getResourceName(source) == "utilities" then
        outputChatBox(""..getResourceName(source)..": script abilitato!", root, 0, 255, 0)
    end
end)

addEventHandler("onResourceStop", root,
function(source)
    if getResourceName(source) == "utilities" then
        outputChatBox(""..getResourceName(source)..": script disabilitato!", root, 255, 0, 0)
    end
end)

addCommandHandler ("explode",
function (player, command, number, times)
    local x, y, z = getElementPosition(player)
    if not times then
        createExplosion(x, y, z, number, player)
    else
        if tonumber(times) <= 100 then
            outputChatBox("Esplosioni generate: "..times.."")
            for i=0, times do
                createExplosion(x, y, z-1, number, player)
            end
        else
            outputChatBox("Non puoi generare più di 100 esplosioni!", player, 255, 0, 0)
        end
    end
end)

addCommandHandler("sv", 
function (player, command, value)
    local x, y, z = getElementPosition(player)
    local idFromName = getVehicleModelFromName(value)
    
    if tonumber(value) then
        if vehicle == false then
            outputChatBox(""..value.." non è un ID di un veicolo!", player ,255, 0, 0)
            outputChatBox("Usage: /sv [id]")
            return
        else
            warpPedIntoVehicle(player, createVehicle(value, x, y+5, z))
        end
    else
        if idFromName == false then
            outputChatBox(""..value.." non è un nome di un veicolo!", player ,255, 0, 0)
            outputChatBox("Usage: /sv [id]")
            return
        else
            warpPedIntoVehicle(player, createVehicle(idFromName, x, y+5, z))
        end
    end

end)

addCommandHandler("hp",
function(player, command, value)

    if (tonumber(value) == nil) then
        setElementHealth(player, 200)
        return
    end
    setElementHealth(player, tonumber(value))
end)

addCommandHandler("armor",
function(player, command, value)
    if (tonumber(value) == nil) then
        setPedArmor(player, 200)
        return
    end
    setPedArmor(player, tonumber(value))
end)

addCommandHandler("money",
function( player, command, value )
    if (tonumber(value) == nil) then
        setPlayerMoney(player, 99999999)
        return
    end
    setPlayerMoney(player, tonumber(value))
end)

addCommandHandler("doping", 
function (thePlayer)

    for i=0, 230 do
        setPedStat(thePlayer, i, 1000)
    end

end)

addCommandHandler("respawn",
function (player)
    local x, y, z = getElementPosition(player)
    local r = getPedRotation(player)
    local skin = getElementModel(player)
    spawnPlayer(player, x, y, z, r, skin)
    fadeCamera ( player, true)
	setCameraTarget ( player, player )
end)

addEventHandler("onPlayerVehicleExit", root,
function (theVehicle)
    lastPlayerVehicle = theVehicle
end)

addCommandHandler("elv",
function(player)
    if isElement(lastPlayerVehicle) then
        warpPedIntoVehicle(player, lastPlayerVehicle)
    else
        outputChatBox("Non hai nessun veicolo!", player, 255, 0, 0)
        return
    end
end)

addCommandHandler("vehalpha",
function(player, command, value)
    if not value then
        outputChatBox("Usage: /vehalpha [value]", player, 255, 0, 0)
        return
    end
    setElementAlpha(getPedOccupiedVehicle(player), tonumber(value))
end)

function generateTrain(player, command, engine, trailer, num)
    LocoMotive = createVehicle ( tonumber(engine), getElementPosition(player) )
    setTimer(
        function()
            local trailers = {}
            for i=1, tonumber(num) do
                trailers[i] = createVehicle ( tonumber(trailer), getElementPosition(player))
                if i == 1 then
                    attachTrailerToVehicle ( LocoMotive, trailers[i] )
                else
                    attachTrailerToVehicle ( trailers[i-1], trailers[i] )
                end
            end
        end, 50, 1)
    warpPedIntoVehicle(player, LocoMotive)
end 
addCommandHandler("train", generateTrain)