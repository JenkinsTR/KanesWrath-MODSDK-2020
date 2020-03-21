macroScript W3DMatToDX9NormaMap

	category:"Lord of the Rings Tools"
	toolTip:"W3DMatToDX9NormaMap"
	icon:#("LotR",13)
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
function getNewMat matType = 
(
    --find an unused material index in the editor
    local matIdx = FindUnusedMatIndex()

    --create a new Max standard material
    try
    (
        meditMaterials[matIdx] = execute ( matType + "()" )
    )
    catch
    (
        return 1
    )

    --get the material
    local mat = meditMaterials[matIdx]

    return mat
)
function getW3DMatTexPath w3dMat obj = 
(
    --only get pass 1's stage 0 diffuse map
    local idx = 0

    local difMap = wwGetTexture w3dMat idx
    if (difMap != undefined) then
    (
        return difMap
    )
    else
    (
        if (quietMode == 0) then
            MessageBox ("Object: " + obj.name + " has a material with no texture, skipping.")
        else
            print ("Object: " + obj.name + " has a material with no texture, skipping.")

        return 1
    )
)
function setMaxTexMapPath maxMat texPath =
(
	
    --create a new bitmap
--    map = Bitmaptexture()
    map = Bitmap

    --set the bitmap's texture
--    map.filename = texPath
	map= openBitMap texpath

    --set the material's texture
--    maxMat.seteffectbitmap(1) map
    maxMat.seteffectbitmap(1) map

)
function setMaxNormalMapPath maxMat texPath =
(
    --create a new bitmap
    map = Bitmap
    --set the bitmap's texture
	temp = texPath as string
	c = (temp.count)-3
	nrmtexpath = replace temp c 0 "_NRM" 
	print nrmtexpath 

    map= openBitMap nrmtexpath

    --set the material's texture
    maxMat.seteffectbitmap(2)  map
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
function doMatCheck matClass obj =
(
    --can we get a material?
    try
    (
        local mat = obj.material
    )
    catch
    (
        return 1
    )

    --is it undefined?
    if (mat == undefined) then
    (
        --object has no material
        if (quietMode == 0) then
        (
            MessageBox ("Object: " + obj.name + " has NO material, skipping.")
        )
        else
        (
            print ("Object: " + obj.name + " does not have any Material, skipping.")
        )

        return 1
    )

    --is it the correct class?
    else if (classof mat != matClass) then
    (
        --object is not a standard max material
        if (quietMode == 0) then
        (
            MessageBox ("Object: " + obj.name + " is not of class " + (matClass as string) + ", skipping.")
        )
        else
        (
            print ("Object: " + obj.name + " is not of class " + (matClass as string) + ", skipping.")
        )
        return 1
    )
    
    --it's the right type of material, return it
    else
        return mat
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
function doW3DMatToMaxMat obj = 
(
    --returns the material only if it matches the class passed in
    local w3dMat = doMatCheck W3D obj
    if (w3dMat == 1) then 
        return 1

    --get the w3d material texture path
    local texPath = getW3DMatTexPath w3dMat obj
    if (texPath == 1) then 
        return 1

	-- failed to find _NRM texture 
	temp = texPath as string
	c = (temp.count)-3
	nrmtexpath = replace temp c 0 "_NRM" 
	-- getFiles texPath
	if ((getfiles nrmtexpath).count == 0) then
		return 1

    --if we get here we have a w3d material with a diffuse texture
    --save the name
    matName = obj.material.name

    --get the objects assigned to the material
    local objList = getObjsWithMat w3dMat

    --create a new Max material
    local maxMat = getNewMat "DirectX_9_Shader"
	maxMat.effectfile = "C:\projects\cnc\cnc3\production\Run\Shaders\NormalMapped.fx"
    if (maxMat == 1) then
        return 1

    --set other material properties of the new dx9 material
	maxMat.SpecularColor = (color 51 51 51 0)
	maxMat.specularexponent = 80.0
	maxMat.technique = 2

    --assign the diffuse texture to the dx9 material
    setMaxTexMapPath maxMat texPath
	
    --assign the normal texture to the dx9 material
    setMaxNormalMapPath maxMat texPath

    --keep the same material name
    maxMat.name = matName + "MAX"

    --assign the material to the correct objects
    for obj in objList do obj.material = maxMat

    --turn on the display of the maps
--    showTextureMap maxMat true
)

--********************************************
--                GLOBALS
--********************************************
--turn this on when using this script in batch
quietMode = 0

--global scope to collect errors across multiple max files
MaxMatErrors = #()

--***************************************************************************************
--                BEGIN MAIN
--***************************************************************************************
(
    --collect errors 
    local MaxMatErrors = #()

    --add Time Stamp
    local sysTime = getTime()
    append MaxMatErrors sysTime

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
            local result = doW3DMatToMaxMat obj
            if (result == 1) then
            (
                --something went wrong in the conversion
                local errMsg = ("FAILED! Object: " + obj.name + " with material: " + ((obj.material) as string) + "     was NOT converted.")
                append MaxMatErrors errMsg
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
                writeToFile MaxMatErrors msgCaption
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
) 