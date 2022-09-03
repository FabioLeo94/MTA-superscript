myObject = {}

function spawnObject(itemID, x, y, z, xr, yr, zr)
    local myObj = createObject(itemID, x, y, z, xr, yr, zr, true)
    myObject[tostring(itemID)] = myObj
    attachElements(myObj, source, 0 , 0 , 0)
end

function destroyObject(itemID)
    detachElements(myObject[tostring(itemID)])
    destroyElement(myObject[tostring(itemID)])
    myObject[tostring(itemID)] = nil
end

function editObjectPos(object, newPos)
    if tostring(getElementModel(myObject[tostring(object)])) == tostring(object) then
        setElementAttachedOffsets(myObject[tostring(object)], newPos[1], newPos[2], newPos[3], newPos[4], newPos[5], newPos[6])
    end
end

function scaleObject(object, newScale)
    if myObject[tostring(object)] then
        setObjectScale(myObject[tostring(object)], newScale)
    end
end

addEvent("destroingObject", true)
addEvent("creatingObject", true)
addEvent("editingObject", true)
addEvent("scalingObject", true)
addEventHandler("creatingObject", root, spawnObject)
addEventHandler("destroingObject", root, destroyObject)
addEventHandler("editingObject", root, editObjectPos)
addEventHandler("scalingObject", root, scaleObject)