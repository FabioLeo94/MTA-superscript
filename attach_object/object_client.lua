--TASTI
--MOVING ON AXIS
--SCRIVERE ALLA STESSA MANIERA O CREA BUG SU SALVATAGGIO POSIZIONE OGGETTI
actionKeys = {
    ["arrow_u"] = "arrow_u",
    ["arrow_d"] = "arrow_d",
    ["arrow_l"] = "arrow_l",
    ["arrow_r"] = "arrow_r",
    ["num_0"] = "num_0",
    ["num_1"] = "num_1",
    ["num_2"] = "num_2",
    ["num_3"] = "num_3",
    ["num_4"] = "num_4",
    ["num_5"] = "num_5",
    ["num_6"] = "num_6",
    ["num_8"] = "num_8",
    ["num_9"] = "num_9",
    ["num_add"] = "num_add",
    ["num_sub"] = "num_sub",
}

--ROTATION
ruotaDestra = "num_6"
ruotaSinistra = "num_4"

--SCALE
scalaInc = "num_9"
scaleDec = "num_3"


--VARIABILI GLOBALI
isEditing = false
windowVisible = false

--FUNZIONI
-- TODO: caricamento modelli da xml
-- local xmlFiles = { ["objectID"] = getResourceConfig("objects.xml") }
-- local optionsNode = xmlNodeGetChildren(xmlNodeGetChildren(xmlNodeGetChildren(xmlFiles.objectID)[8])[1])
-- outputDebugString("optionsNode: "..inspect(xmlFindChild(xmlFiles.objectID, "group", 8)))

objectIds = {
    {2607, "POLCE_DESK2", "Disattivato"},
    {2008, "officedesk1", "Disattivato"},
    {1281, "parktable1", "Disattivato"},
    {1727, "mrk_seating2b", "Disattivato"},
    {2356, "police_OFF_CHAIR", "Disattivato"},
    {1594, "chairsntable", "Disattivato"},
    {1714, "kb_swivelchair1", "Disattivato"},
    {2165, "MED_OFFICE_DESK_1", "Disattivato"},
    {2009, "officedesk2l", "Disattivato"},
    {1280, "parkbench1", "Disattivato"},
    {1368, "CJ_BLOCKER_BENCH", "Disattivato"},
    {1518, "DYN_TV_2", "Disattivato"},
    {1514, "DYN_FF_TILL", "Disattivato"},
    {2238, "CJ_LAVA_LAMP", "Disattivato"},
    {2226, "LOW_HI_FI_3", "Disattivato"},
    {2627, "gym_treadmill", "Disattivato"},
    {2770, "CJ_CB_BIN", "Disattivato"},
    {2903, "kmb_parachute", "Disattivato"},
    {2919, "kmb_holdall", "Disattivato"},
    {3031, "wong_dish", "Disattivato"},
    {3042, "ct_vent", "Disattivato"},
    {3039, "ct_stall1", "Disattivato"},
    {3350, "torino_mic", "Disattivato"},
    {11245, "sfsefirehseflag", "Disattivato"},
    {11470, "des_bigbull", "Disattivato"},
    {14446, "Smokes_bed", "Disattivato"},
    {14532, "tv_stand_driv", "Disattivato"},
    {14604, "tv_stand_bike", "Disattivato"},
    {18070, "GAP_COUNTER", "Disattivato"},
    {16776, "des_cockbody", "Disattivato"},
    {642, "kb_canopy_test", "Disattivato"},
    {1211, "fire_hydrant", "Disattivato"},
    {1340, "chillidogcart", "Disattivato"},
    {1341, "icescart_prop", "Disattivato"},
    {1342, "noodlecart_prop", "Disattivato"},
    {1346, "CJ_PHONE_KIOSK2", "Disattivato"},
    {1363, "CJ_PHONE_KIOSK", "Disattivato"},
    {1366, "CJ_FIREHYDRANT", "Disattivato"},
    {1367, "CJ_POSTBOX", "Disattivato"},
    {1478, "DYN_post_box", "Disattivato"},
    {1570, "CJ_NOODLE_3", "Disattivato"},
    {1571, "CJ_NOODLE_1", "Disattivato"},
    {2600, "CJ_VIEW_TELE", "Disattivato"},
    {16442, "desn2_stripsigs1", "Disattivato"},
    {6865, "steerskull", "Disattivato"},
    {16778, "des_ufosign", "Disattivato"},
    {16779, "ufo_light02", "Disattivato"},
    {16780, "ufo_light03", "Disattivato"},
    {3534, "trdlamp01", "Disattivato"},
    {3267, "mil_samsite", "Disattivato"},
    {1243, "bouy", "Disattivato"},
    {1558, "CJ_CARDBRD_PICKUP", "Disattivato"},
    {1369, "CJ_WHEELCHAIR1", "Disattivato"},
    {3092, "dead_tied_cop", "Disattivato"},
    {1572, "CJ_AIR_TROLLY", "Disattivato"},
    {1349, "CJ_SHTROLLY", "Disattivato"},
    {917, "FRUITCRATE1", "Disattivato"},
    {1458, "DYN_CART", "Disattivato"},
}

attachedIds = {}
attachedPos = {}


GUIEditor = {
    edit = {},
    button = {},
    window = {},
    label = {},
    gridlist = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.window[1] = guiCreateWindow(25, 222, 475, 399, "Attach object [F5]", false)
        guiWindowSetSizable(GUIEditor.window[1], false)

        GUIEditor.button[1] = guiCreateButton(285, 365, 171, 24, "Chiudi", false, GUIEditor.window[1])
        GUIEditor.label[1] = guiCreateLabel(17, 242, 202, 74, "", false, GUIEditor.window[1])
        guiLabelSetHorizontalAlign(GUIEditor.label[1], "left", true)
        GUIEditor.gridlist[1] = guiCreateGridList(10, 25, 451, 191, false, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "ID", 0.3)
        guiGridListAddColumn(GUIEditor.gridlist[1], "Object Name", 0.3)
        guiGridListAddColumn(GUIEditor.gridlist[1], "Current State", 0.3)
        GUIEditor.edit[1] = guiCreateEdit(275, 335, 58, 20, "0", false, GUIEditor.window[1])
        GUIEditor.edit[2] = guiCreateEdit(336, 335, 58, 20, "0", false, GUIEditor.window[1])
        GUIEditor.edit[3] = guiCreateEdit(398, 335, 58, 20, "0", false, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(279, 311, 16, 18, "X", false, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(343, 311, 16, 18, "Y", false, GUIEditor.window[1])
        GUIEditor.label[4] = guiCreateLabel(404, 311, 16, 18, "Z", false, GUIEditor.window[1])
        GUIEditor.label[5] = guiCreateLabel(233, 226, 224, 18, "Object position relative to Player position", false, GUIEditor.window[1])
        GUIEditor.edit[4] = guiCreateEdit(275, 281, 58, 20, "0", false, GUIEditor.window[1])
        GUIEditor.edit[5] = guiCreateEdit(336, 281, 58, 20, "0", false, GUIEditor.window[1])
        GUIEditor.edit[6] = guiCreateEdit(398, 281, 58, 20, "0", false, GUIEditor.window[1])
        GUIEditor.label[6] = guiCreateLabel(279, 263, 37, 18, "X ang", false, GUIEditor.window[1])
        GUIEditor.label[7] = guiCreateLabel(343, 263, 37, 18, "Y ang", false, GUIEditor.window[1])
        GUIEditor.label[8] = guiCreateLabel(404, 263, 37, 18, "Z ang", false, GUIEditor.window[1])    

        for i=1, #objectIds do
            guiGridListAddRow(GUIEditor.gridlist[1], objectIds[i][1], objectIds[i][2], objectIds[i][3])
        end

        guiSetVisible(GUIEditor.window[1], false)
        addEventHandler("onClientGUIDoubleClick", GUIEditor.gridlist[1], spawnObject, false)
        addEventHandler("onClientGUIClick", GUIEditor.gridlist[1], updatePosTable, false)
        addEventHandler("onClientGUIClick", GUIEditor.button[1], closeWindow, false)
        addEventHandler("onClientGUIChanged", GUIEditor.edit[1], updatePosX, false)
        addEventHandler("onClientGUIChanged", GUIEditor.edit[2], updatePosY, false)
        addEventHandler("onClientGUIChanged", GUIEditor.edit[3], updatePosZ, false)
        addEventHandler("onClientGUIChanged", GUIEditor.edit[4], updateRotX, false)
        addEventHandler("onClientGUIChanged", GUIEditor.edit[5], updateRotY, false)
        addEventHandler("onClientGUIChanged", GUIEditor.edit[6], updateRotZ, false)
        addEventHandler("onClientKey", root, editWithKey)
        addEventHandler("onClientKey", root, updateScale)
    end
)

function closeWindow()
    guiSetVisible(GUIEditor.window[1], false)
    showCursor(false)
    windowVisible = false
end

function updatePosTable(btn)
    if not btn == "left" then return end
    local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
    if guiGridListGetItemText(GUIEditor.gridlist[1], row, 3) == "Disattivato" then
        guiSetText(GUIEditor.edit[1], 0)
        guiSetText(GUIEditor.edit[2], 0)
        guiSetText(GUIEditor.edit[3], 0)
        guiSetText(GUIEditor.edit[4], 0)
        guiSetText(GUIEditor.edit[5], 0)
        guiSetText(GUIEditor.edit[6], 0)
        return
    end

    if row == -1 and col == -1 then return end
    local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)

    if attachedPos[tostring(itemID)] then
        guiSetText(GUIEditor.edit[1], attachedPos[tostring(itemID)][1])
        guiSetText(GUIEditor.edit[2], attachedPos[tostring(itemID)][2])
        guiSetText(GUIEditor.edit[3], attachedPos[tostring(itemID)][3])
        guiSetText(GUIEditor.edit[4], attachedPos[tostring(itemID)][4])
        guiSetText(GUIEditor.edit[5], attachedPos[tostring(itemID)][5])
        guiSetText(GUIEditor.edit[6], attachedPos[tostring(itemID)][6])
    end
end

function editWithKey(btn, press)
    if not windowVisible then return end
    if press then return end
    if not actionKeys[btn] then return end
    local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
    if guiGridListGetItemText(GUIEditor.gridlist[1], row, 3) == "Disattivato" then return end
    local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)

    if btn == actionKeys["arrow_r"] then
        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][1] = tonumber(attachedPos[tostring(itemID)][1]) + 0.1
        else
            attachedPos[tostring(itemID)][1] = tonumber(attachedPos[tostring(itemID)][1]) + 0.01
        end
    end

    if btn == actionKeys["arrow_l"] then
        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][1] = tonumber(attachedPos[tostring(itemID)][1]) - 0.1
        else
            attachedPos[tostring(itemID)][1] = tonumber(attachedPos[tostring(itemID)][1]) - 0.01
        end
    end

    if btn == actionKeys["arrow_u"] then
        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][2] = tonumber(attachedPos[tostring(itemID)][2]) + 0.1
        else
            attachedPos[tostring(itemID)][2] = tonumber(attachedPos[tostring(itemID)][2]) + 0.01
        end
    end

    if btn == actionKeys["arrow_d"] then
        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][2] = tonumber(attachedPos[tostring(itemID)][2]) - 0.1
        else
            attachedPos[tostring(itemID)][2] = tonumber(attachedPos[tostring(itemID)][2]) - 0.01
        end
    end

    if btn == actionKeys["num_8"] then
        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][3] = tonumber(attachedPos[tostring(itemID)][3]) + 0.1
        else
            attachedPos[tostring(itemID)][3] = tonumber(attachedPos[tostring(itemID)][3]) + 0.01
        end
    end

    if btn == actionKeys["num_2"] then
        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][3] = tonumber(attachedPos[tostring(itemID)][3]) - 0.1
        else
            attachedPos[tostring(itemID)][3] = tonumber(attachedPos[tostring(itemID)][3]) - 0.01
        end
    end

    if attachedPos[tostring(itemID)] then
        guiSetText(GUIEditor.edit[1], attachedPos[itemID][1])
        guiSetText(GUIEditor.edit[2], attachedPos[itemID][2])
        guiSetText(GUIEditor.edit[3], attachedPos[itemID][3])
        guiSetText(GUIEditor.edit[4], attachedPos[itemID][4])
        guiSetText(GUIEditor.edit[5], attachedPos[itemID][5])
        guiSetText(GUIEditor.edit[6], attachedPos[itemID][6])
        updatePos()
    else
        return
    end


end

function updateScale(btn, press)
    if not windowVisible then return end
    if not press then return end
    if not actionKeys[btn] then return end
    local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
    if row == -1 and col == -1 then return end
    local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)

    if guiGridListGetItemText(GUIEditor.gridlist[1], row, 3) == "Disattivato" then return end

    if not attachedPos[tostring(itemID)][7] then
        attachedPos[tostring(itemID)][7] = 1
    end

    outputDebugString(tostring(attachedPos[tostring(itemID)][7]))
    if btn == actionKeys["num_add"] then
        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][7] = tonumber(attachedPos[tostring(itemID)][7]) + 0.1
        else
            attachedPos[tostring(itemID)][7] = tonumber(attachedPos[tostring(itemID)][7]) + 0.01
        end
    end

    if btn == actionKeys["num_sub"] then

        if getKeyState("lshift") then
            attachedPos[tostring(itemID)][7] = tonumber(attachedPos[tostring(itemID)][7]) - 0.1
        else
            attachedPos[tostring(itemID)][7] = tonumber(attachedPos[tostring(itemID)][7]) - 0.01
        end
    end

    triggerServerEvent("scalingObject", localPlayer, itemID, attachedPos[tostring(itemID)][7])

end

function updatePosX()
    if not windowVisible then return end
        local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
        if row == -1 and col == -1 then return end
        local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)
        attachedPos[tostring(itemID)][1] = guiGetText(GUIEditor.edit[1])
        updatePos()
end

function updatePosY()
    if not windowVisible then return end
        local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
        if row == -1 and col == -1 then return end
        local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)
        attachedPos[tostring(itemID)][2] = guiGetText(GUIEditor.edit[2])
        updatePos()
end

function updatePosZ()
    if not windowVisible then return end
        local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
        if row == -1 and col == -1 then return end
        local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)
        attachedPos[tostring(itemID)][3] = guiGetText(GUIEditor.edit[3])
        updatePos()
end

function updateRotX()
    if not windowVisible then return end
        local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
        if row == -1 and col == -1 then return end
        local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)
        attachedPos[tostring(itemID)][4] = guiGetText(GUIEditor.edit[4])
        updatePos()
end

function updateRotY()
    if not windowVisible then return end
        local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
        if row == -1 and col == -1 then return end
        local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)
        attachedPos[tostring(itemID)][5] = guiGetText(GUIEditor.edit[5])
        updatePos()
end

function updateRotZ()
    if not windowVisible then return end
        local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
        if row == -1 and col == -1 then return end
        local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)
        attachedPos[tostring(itemID)][6] = guiGetText(GUIEditor.edit[6])
        updatePos()
end

function updatePos()
    if not windowVisible then return end
    local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
    local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)

    if guiGridListGetItemText(GUIEditor.gridlist[1], row, 3) == "Attivato" then
        local ox, oy, oz = guiGetText(GUIEditor.edit[1]), guiGetText(GUIEditor.edit[2]), guiGetText(GUIEditor.edit[3])
        local oxa, oya, oza = guiGetText(GUIEditor.edit[4]), guiGetText(GUIEditor.edit[5]), guiGetText(GUIEditor.edit[6])
        if tonumber(ox) and tonumber(oy) and tonumber(oz) and tonumber(oxa) and tonumber(oya) and tonumber(oza) then
            triggerServerEvent("editingObject", localPlayer, itemID, {ox, oy, oz, oxa, oya, oza})
        end
    end
end

addEventHandler("onClientRender", root, 
function()
    local x, y, z = getElementPosition ( localPlayer )
    local rx, ry, rz = getElementRotation ( localPlayer )

    guiSetText(GUIEditor.label[1], "Player Coord:\nX: "..x.."\nY: "..y.."\nZ: "..z.."")
end)

function openWindow(button, press)
    if button == "F5" then
        if press then
            if windowVisible then
                guiSetVisible(GUIEditor.window[1], false)
                showCursor(false)
                windowVisible = false
            else
                guiSetVisible(GUIEditor.window[1], true)
                guiBringToFront(GUIEditor.window[1])
                showCursor(true)
                windowVisible = true
            end
        end
    end
end
addEventHandler("onClientKey", root, openWindow)

function spawnObject (btn)
    if not windowVisible then return end
    if btn ~= 'left' then return false end
    local row, col = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
    if row == -1 then return false end
    local itemID = guiGridListGetItemText(GUIEditor.gridlist[1], row, 1)
    local x, y, z = getElementPosition(localPlayer)
    local xr, yr, zr = getElementRotation(localPlayer)
    
    for i=0, #objectIds do
        
        if guiGridListGetItemText(GUIEditor.gridlist[1], i, 1) == itemID then
            
            if guiGridListGetItemText(GUIEditor.gridlist[1], i, 3) == "Disattivato" then
                guiGridListSetItemText ( GUIEditor.gridlist[1], i, 3, "Attivato", false, false )
                attachedPos[tostring(itemID)] = {0, 0, 0, 0, 0, 0}
                triggerServerEvent("creatingObject", localPlayer, itemID, x, y, z, xr, yr, zr)
            else
                guiGridListSetItemText ( GUIEditor.gridlist[1], i, 3, "Disattivato", false, false )
                triggerServerEvent("destroingObject", localPlayer, itemID)
                attachedPos[tostring(itemID)] = nil
            end
        end

    end

end