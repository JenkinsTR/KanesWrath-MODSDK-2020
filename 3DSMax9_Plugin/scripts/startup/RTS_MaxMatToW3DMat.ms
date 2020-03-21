macroScript MaxMat_to_W3dMat

	category:"RTS Tools"
	toolTip:"MaxMat2W3d"
	icon:#("RTS",12)
(
function FindUnusedMatIndex =
(
    for i = 1 to 24 do --there are 24 material slots
    (
        matExists = findItem sceneMaterials (getMeditMaterial i)
        if matExists == 0 then --we have found an unused slot to write our material
        (		
            return i
        )
    )
    return i --overwrite the last slot if all are used
)
function getNewW3DMat = 
(
    --find an unused material index in the editor
    local matIdx = FindUnusedMatIndex()

    --create a new W3D material
    meditMaterials[matIdx] = W3D ()

    --get the material
    local mat = meditMaterials[matIdx]

    return mat
)
function getMaxMatTexPath maxMat obj = 
(
    local difMap = maxMat.diffuseMap
    if (difMap != undefined) then
    (
        local difMapPath = maxMat.diffuseMap.bitmap
        if (difMapPath != undefined) then
        (
            --strip out the "BitMap:"
            difMapPath = substring (difMapPath as string) 8 -1

            return difMapPath
        )
    )
    else
    (
        if (quietMode == 0) then
            MessageBox ("Object: " + obj.name + " has a material with no texture, skipping.")
        else
            print ("Object: " + obj.name + " has a material with no texture, skipping.")

        return 0
    )
)
function setW3DTexMapPath W3DMat texPath =
(
    --we will only have one diffuse map
    idx = 0

    wwSetTexture W3DMat texPath idx
)
function getObjsWithMat mat = 
(
    local objList = #()
    for obj in objects do
    (
        if (obj.material == mat) then
        append objList obj
    )
    return objList
)
function turnOnW3DMatStage W3DMat pass stage = 
(
    if ((classof W3DMat as string == "W3D") and (stage == 0 or stage == 1)) then
        wwSetStageFlag W3DMat pass stage on
    else
        if (quietMode == 0) then
            MessageBox ("Failed to turn on Texture Stage " + (stage as string) + ", Exiting...")
        else
            print ("Failed to turn on Texture Stage " + (stage as string) + ", Exiting...")
)
function turnOnW3DMatDisplay W3DMat pass stage = 
(
    if ((classof W3DMat as string == "W3D") and (stage == 0 or stage == 1)) then
        wwSetDisplayFlag W3DMat pass stage on
    else
        if (quietMode == 0) then
            MessageBox ("Failed to turn on Display Flag for Stage " + (stage as string) + ", Exiting...")
        else
            print ("Failed to turn on Display Flag for Stage " + (stage as string) + ", Exiting...")
)
function writeToFile data msgCaption = 
(
    local filePath = getSaveFileName caption: msgCaption
    local file     = createFile filePath

    if (data[1] != undefined) then
    (
        for i = 1 to data.count do
        (
            format ((data[i] as string) + "\n") to: file
        )
    )
    close file
)
function closeMatEditor = 
(
    local bMatEditOpen = false
    local bMatEditCurOpen = MatEditor.isOpen()
    if (bMatEditCurOpen == true) then
    (
        MatEditor.Close()
        bMatEditOpen = true
    )
    return bMatEditOpen 
)
function maxMatOpacityCheck maxMat = 
(
    if (classof maxMat == Standardmaterial) then
    (
        local bHasOpacity = false
        if (maxMat.opacityMap != undefined) then
            bHasOpacity = true
        return bHasOpacity
    )
    else
    (
        print ("Should be a Max Material, got: " + ((classof maxMat) as string))
        MessageBox "This shouldn't happen, tell your tools provider NOW!!!"
    )
)
function doMaxToW3DMatCheck maxMat obj =
(
    if (maxMat == undefined) then
    (
        --object has no material
        if (quietMode == 0) then
        (
            MessageBox ("Object: " + obj.name + " has NO material, skipping.")
        )
        else
        (
            print ("Object: " + obj.name + " does not have a Standard Max Material, skipping.")
        )

        return 0
    )
    else if (classof maxMat != Standardmaterial) then
    (
        --object is not a standard max material
        if (quietMode == 0) then
        (
            MessageBox ("Object: " + obj.name + " does not have a Standard Max Material, skipping.")
        )
        else
        (
            print ("Object: " + obj.name + " does not have a Standard Max Material, skipping.")
        )
        return 0
    )    
)
function setW3DOpacity W3DMat passNum bVal = 
(
    --set the blend mode to Alpha Test
    wwSetAlphaTestFlag W3DMat passNum true
)
function newW3DMatCheck W3DMat = 
(
    if (W3DMat == undefined) then
    (
        --wow, this would be really bad if we ever get in here!
        --a missing plugin, out of memory, something terrible...
        if (quietMode == 0) then
        (
            MessageBox ("Make sure you have the W3D tools installed! See your tools provider!!")
            MessageBox ("Failed to create W3D Material for object " + obj.name)
        )
        else
        (
            print ("Make sure you have the W3D tools installed! See your tools provider!!")
            print ("Failed to create W3D Material for object " + obj.name)
        )
        return 0
    )
    return 1
)
function getTime = 
(
    --get the milliseconds
    local milliTime = timeStamp()

    --get the seconds
    local seconds = milliTime * 0.001

    --get the minutes
    local minutes = seconds / 60

    --get the hours
    local hours = minutes / 60

    --get the hours to output
    local timeLeftInHours = hours
    local outputHours     = timeLeftInHours as integer
    local remainingHours  = hours - outputHours

    --get the minutes to output
    local timeLeftInMinutes = remainingHours * 60
    local outputMinutes     = timeLeftInMinutes as integer
    local remainingMinutes  = timeLeftInMinutes - outputMinutes

    --get the seconds to output
    local timeLeftInSeconds = remainingMinutes * 60
    local outputSeconds     = timeLeftInSeconds as integer

    local  timeString = (outputHours as string + ":" + outputMinutes as string + ":" + outputSeconds as string)
    return timeString
)
function doMaxMatToW3DMat obj = 
(
    maxMat = obj.material

    --error check the material
    local checkResult = doMaxToW3DMatCheck maxMat obj
    if (checkResult == 0) then 
        return 0

    --get the max material texture path
    local texPath = getMaxMatTexPath maxMat obj
    if (texPath == 0) then 
        return 0

    --if we get here we have a max material with a diffuse texture
    --save the name
    maxMatName = obj.material.name

    --check to see if there is also an opacity map
    local bHasOpacity = maxMatOpacityCheck maxMat

    --get the objects assigned to the material
    local objList = getObjsWithMat maxMat

    --create a new W3D material
    local W3DMat = getNewW3DMat()

    --make sure it was created
    local newW3DResult = newW3DMatCheck W3DMat
    if (newW3DResult == 0) then
        return 0

    --assign the diffuse texture to the W3D material
    setW3DTexMapPath W3DMat texPath

    --keep the same material name
    W3DMat.name = maxMatName

    --assign the material to the correct objects
    for obj in objList do obj.material = W3DMat

    --since a max material only has one diffuse texture
    --we can only convert the first stage of the first pass
    --in the W3D material
    local passNum  = 0
    local stageNum = 0

    --handle the opacity
    if (bHasOpacity == true ) then
        setW3DOpacity W3DMat 0 true

    --turn on the first stage flag to enable the texture
    turnOnW3DMatStage W3DMat passNum stageNum

    --turn on the first display flag for the texture
    turnOnW3DMatDisplay W3DMat passNum stageNum
)

--********************************************
--                GLOBALS
--********************************************
--turn this on when using this script in batch
quietMode = 0

--global scope to collect errors across multiple max files
W3DMatErrors = #()

--***************************************************************************************
--                BEGIN MAIN
--***************************************************************************************
(
    --collect errors 
    local W3DMatErrors = #()

    --add Time Stamp
    local sysTime = getTime()
    append W3DMatErrors sysTime

    --we need to close the material editor, remember if it was open
    --it's a cheap way to refresh
    local bMatEditOpen = closeMatEditor()

    --loop through the objects passed in
    local sel = for item in selection collect item
    if (sel[1] != undefined) then
    (
        for obj in sel do
        (
            --do conversion
            local result = doMaxMatToW3DMat obj
            if (result == 0) then
            (
                --something went wrong in the conversion
                local errMsg = ("FAILED! Object: " + obj.name + " with material: " + ((obj.material) as string) + "     was NOT converted.")
                append W3DMatErrors errMsg
                print errMsg
            )
            else
            (
                --converted successfully
                print ("Successfully converted material: " + obj.material.name + "  for object: " + obj.name)
            )
        )
        if quietMode == 1 then
        (
            --ask user if they want to save the errors
            local bOutput = queryBox "Save the output errors to a text file?"
            if bOutPut == true then
            (
                --save errors to a text file
                local msgCaption = "Save the output errors."
                writeToFile W3DMatErrors msgCaption
            )
        )
        --open the material editor if it was open before this script 
        if (bMatEditOpen == true) then
            MatEditor.Open()
    )
    --no objects were passed in, bail
    else
        if (quietMode == 0) then
            MessageBox ("No ojects were selected!")
        else
            print ("No ojects were selected!")
)
)