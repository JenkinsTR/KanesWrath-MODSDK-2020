

macroScript LotR_Skin2W3D

	category:"Lord of the Rings Tools"
	toolTip:"Skin2W3d"
	icon:#("LotR",10)
(
function getMaxSkinMod obj = 
(
    local MaxSkinMod = #()

    --find the Max Skin Modifier
    modArray = obj.modifiers
    for i = 1 to modArray.count do
    (
        if( ((classof modArray[i]) as string) == "Skin" ) then
        (
            append MaxSkinMod modArray[i]
        )
    )
    if MaxSkinMod.count > 1 then
    (
        MessageBox "This object has two max skins! This is NOT allowed!!"
        MaxSkinMod[1] = undefined
    )
    if MaxSkinMod.count < 1 then
    (
        MessageBox "This object has no max skin! This is NOT allowed!!"
        MaxSkinMod[1] = undefined
    )

    return MaxSkinMod[1]
)
function getBoneNodeFromIdx skinMod boneIdx = 
(
    boneNode = skinOps.GetBoneName skinMod boneIdx 0
    return boneNode
)
function getBoneNameFromIdx skinMod boneIdx = 
(
    boneName = skinOps.GetBoneName skinMod boneIdx 1
    return boneName
)
function getBoneList obj skinMod =
(
    local boneList = #()

    numBones = skinOps.GetNumberBones skinMod
    for i = 1 to numBones do
    (
        boneNode = getBoneNodeFromIdx skinMod i
        append boneList boneNode
    )

    return boneList
)
function doAllVertsHaveWeights obj skinMod =
(
            vertCount = obj.verts.count
    weightedVertCount = skinOps.GetNumberVertices skinMod

    if vertCount != weightedVertCount then    
        MessageBox "The object has UNWEIGHTED Vertices, this is NOT allowed!!"
)
function getBoneTabIdx skinMod vert boneIdx = 
(
    boneTabIdx = -1
    try
        boneTabIdx = skinOps.GetVertexWeightBoneID skinMod vert boneIdx
    catch()
    return boneTabIdx
)
function getBoneName skinMod vert boneIdx =
(
    boneName = "undefined"
    boneTabIdx = getBoneTabIdx skinMod vert boneIdx
    if boneTabIdx != -1 then
        boneName = getBoneNameFromIdx skinMod boneTabIdx
    
    return boneName
)
function getBoneWeight skinMod vert boneIdx = 
(
    boneWeight = 0
    try
        boneWeight = skinOps.GetVertexWeight skinMod vert boneIdx
    catch()

    return boneWeight
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
function doBoneTypeCheck boneList = 
(
    for boneItem in boneList do
    (
        if ( not((superclassof boneItem == GeometryClass) or (superclassof boneItem == helper)) ) then
        ( 
            MessageBox ("Bone " + (boneItem as string) + " is not a valid bone type. If this is incorrect see your tools provider!")
            MessageBox ("Bone is class: " + ((classof boneItem) as string) + " and superclass: " + ((superclassof boneItem) as string))
            return 0
        )
    )

    return 1
)
function doMaxSkinToWWSkin obj = 
(
    select obj
    max modify mode

    --get the skin modifier
    skinMod = getMaxSkinMod obj

    if skinMod == undefined then
        return 0

    --look for unweighted verts
    doAllVertsHaveWeights obj skinMod

    --limit the influences to 2 bones
    skinMod.bone_Limit = 2

    --get the bone list
    boneListNames = getBoneList obj skinMod
    boneList = getNodesFromNames boneListNames

    --check for valid bone types
    resultB = doBoneTypeCheck boneList
    if resultB == 0 then
        return 0

    local boneOneNames   = #()
    local boneTwoNames   = #()
    local boneOneWeights = #()
    local boneTwoWeights = #()


    for i = 1 to obj.verts.count do
    (

        --get index 1 bone names
        boneOneName = getBoneName skinMod i 1
        append boneOneNames boneOneName

        --get index 2 bone names
        boneTwoName = getBoneName skinMod i 2
        append boneTwoNames boneTwoName

        --get index 1 bone weights
        boneOneWeight = getBoneWeight skinMod i 1
        append boneOneWeights boneOneWeight

        --get index 2 bone weights
        boneTwoWeight = getBoneWeight skinMod i 2
        append boneTwoWeights boneTwoWeight
    )
    
    --change Names into Nodes
    boneOneNodes = getNodesFromNames boneOneNames
    boneTwoNodes = getNodesFromNames boneTwoNames

    --remove the max skin
    deleteModifier obj skinMod

    --reuse an old space warp
--    local wsm = findWWSpaceWarp()

    if (wsm == undefined) then
    (
        --make a new space warp
        wsm = WWSkinSpaceWarp pos:[0,0,-20] isSelected:off
    )

    --bind the skin
    bindSpaceWarp obj wsm

    --get the skin
    skinMod = wwGetSkinName obj

    --add the bones
    for i = 1 to boneList.count do
    (
        wwAddBone boneList[i] obj
    )

    --add the weights
    for i = 1 to obj.verts.count do
    (
        if boneOneNodes[i] != undefined then
            wwSetBoneWeight obj (i - 1) 1 boneOneNodes[i] ((boneOneWeights[i] * 100) as integer)
        if boneTwoNodes[i] != undefined then
            wwSetBoneWeight obj (i - 1) 2 boneTwoNodes[i] ((boneTwoWeights[i] * 100) as integer)
    )

    return 1
)

(
    local result = 1
    inLoop = 0
    local sel = for item in selection collect item

    for obj in sel do
    (
        result = doMaxSkinToWWSkin obj
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

