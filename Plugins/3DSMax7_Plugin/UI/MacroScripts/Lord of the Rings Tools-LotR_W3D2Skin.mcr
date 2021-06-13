macroScript LotR_W3D2Skin

	category:"Lord of the Rings Tools"
	toolTip:"W3D2Skin"
	icon:#("LotR",9)
(

function getWWSkinMod obj = 
(

    local WWSkinMod = #()

    --find the WWSkin Modifier
    modArray = obj.modifiers
    for i = 1 to modArray.count do
    (
        if( ((classof modArray[i]) as string) == "WWSkin" ) then
        (
            append WWSkinMod modArray[i]
        )
    )

    if WWSkinMod.count > 1 then
    (
        MessageBox "This object has two skins! This is NOT allowed!!"
        return 0
    )
    else if ((WWSkinMod.count < 1) or (WWSkinMod[1] == undefined)) then
    (
        MessageBox "This object has no wwSkin! This is NOT allowed!!"
        return 0
    )
    else
        return WWSkinMod[1]
)

function getWWSkinSpaceWarp = 
(
    local WWSkinSpaceWarpArray = #()

    --find the WWSkinSpaceWarp
    for obj in objects do
    (
        if( ((classof obj) as string) == "WWSkinSpaceWarp" ) then
        (
            append WWSkinSpaceWarpArray obj
            break
        )
    )

    return WWSkinSpaceWarpArray
)

function getNodeFromName name = 
(
    node = execute ( "$'" + (name as string) + "'")
    return node
)
function getNodesFromNames nameArray = 
(
    local nodeArray = #()
    for item in nameArray do
    (
        node = execute ( "$'" + (item as string) + "'")
        append nodeArray node
    )
    return nodeArray
)
function cleanBoneList boneArray =
(
    --remove all duplicates
    local newArray = #()
    for item in boneArray do
    (
        if (item as string) != "undefined" then
        (
            append newArray item
        )
    )

    return newArray
)
function removeWWSkin obj = 
(
    max modify mode
    for objMod in obj.modifiers do
    (
        if ( (classof objMod) == WWSkin ) then
        (
            select obj
            deleteModifier obj objMod
        )
    )
)
function addBonesToSkin skinMod boneList = 
(
    for boneNode in boneList do
    (
        --0 means do not redraw
        skinOps.addBone skinMod boneNode 0 
    )
    --now we can refresh
    redrawViews()
)
function skinVert obj boneNode boneWeight vert = 
(
    skinOps.setVertexWeights skinMod vert boneNode boneWeight
)
function prepareBoneList boneNameList = 
(
    local cleanedList  = cleanBoneList boneNameList
    local sortedList   = sort cleanedList
    local boneNodeList = getNodesFromNames sortedList

    return boneNodeList
)
function getBoneIndex boneName boneList = 
(
    i = 1
    for item in boneList do
    (
        if ((stricmp (boneName as string) item.name) == 0) then 
            return i

        i += 1
    )
    return undefined
)
function collapseMaxStack obj = 
(
    local objClass = classof obj
    if ((objClass != Editable_mesh) and (objClass != Editable_Poly)) then
    (
        MessageBox (obj.name + " is not an editable poly or mesh! Failed! Got class: " + objClass as string)
        return 0
    )

    --ask user about the conversion
    local bOutput = queryBox "This will collapse all of the converted object's stacks! Do you wish to continue?"
    if bOutPut == true then
    (
        --collapse the stack
        convertTo obj objClass
    )
    else
    (
        MessageBox ("Operation aborted by user.")
        return 0
    )
)
function doWWSkinToMaxSkin obj = 
(
    --make sure it has WWSKin
    local resultS = getWWSkinMod obj
    if (resultS == undefined or resultS == 0) then
        return 0

    local askResult = collapseMaxStack obj
    if (askResult == 0) then
        return 0

    --get the data
    local boneOneNames = wwGetBoneNames obj 1
    local boneTwoNames = wwGetBoneNames obj 2
    local boneOneWeights = wwGetBoneWeights obj 1
    local boneTwoWeights = wwGetBoneWeights obj 2
    local boneNameList = wwGetBoneList obj

    local boneList = prepareBoneList boneNameList


    --remove WWSkin
    removeWWSkin obj

    --add a Max skin modifier
    local skinMod = skin()
    addmodifier obj skinMod

    --limit influence to 2 bones
    skinMod.bone_Limit = 2

    --add the bones to the Max skin
    addBonesToSkin skinMod boneList

    max modify mode
    redrawViews()

    --set weights for vertices
    for i = 1 to obj.verts.count do
    (

        boneIdxOne = undefined
        boneIdxTwo = undefined

        skinOps.unNormalizeVertex skinMod i false 


        try
            boneIdxOne = getBoneIndex boneOneNames[i] boneList
        catch()

        try
            boneIdxTwo = getBoneIndex boneTwoNames[i] boneList  
        catch()

        if (boneIdxOne != undefined) then
            skinOps.setVertexWeights skinMod i boneIdxOne 1.0

        if (boneIdxTwo != undefined) then    
            skinOps.setVertexWeights skinMod i boneIdxTwo (boneTwoWeights[i] * 0.01)

    )

)

(
    local result = 1
    inLoop = 0
    local sel = for item in selection collect item

    for obj in sel do
    (
        result = doWWSkinToMaxSkin obj
        inLoop = 1

        if result == 0 then
            MessageBox (obj.name + " failed to convert!")
        else
            print "Finished!"
    )
    if inLoop == 0 then
        MessageBox ("No objects selected! Operation Failed!")  
)

)
