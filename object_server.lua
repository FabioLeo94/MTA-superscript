myObject = {}
objectPos = {}

function spawnObject(itemID, x, y, z, xr, yr, zr)
    local myObj = createObject(itemID, x, y, z, xr, yr, zr, true)
    myObject[tostring(itemID)] = myObj
    attachElements(myObj, source, 0 , 0 , 0)
    objectPos[tostring(myObj)] = {0, 0, 0}
end

function destroyObject(itemID)

    detachElements(myObject[tostring(itemID)])
    destroyElement(myObject[tostring(itemID)])
    myObject[tostring(itemID)] = nil

end

function editObjectPos(object, newPos)
    if tostring(getElementModel(myObject[tostring(object)])) == tostring(object) then
        objectPos[tostring(object)] = newPos
        setElementAttachedOffsets(myObject[tostring(object)], objectPos[tostring(object)][1], objectPos[tostring(object)][2], objectPos[tostring(object)][3], objectPos[tostring(object)][4], objectPos[tostring(object)][5], objectPos[tostring(object)][6])
    end
end

addEvent("destroingObject", true)
addEvent("creatingObject", true)
addEvent("editingObject", true)
addEventHandler("creatingObject", root, spawnObject)
addEventHandler("destroingObject", root, destroyObject)
addEventHandler("editingObject", root, editObjectPos)