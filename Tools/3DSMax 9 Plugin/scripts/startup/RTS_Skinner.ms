macroScript RTS_Skinner

	category:"RTS Tools"
	toolTip:"Skinner"
	icon:#("RTS",4)
(


fn Skinner scale_me piv =
(
max modify mode
scale_this_much = [scale_me , scale_me ,scale_me ]

sel = getCurrentSelection()
-- create copies of the selected objects as bones

for n in sel do
	(
-- center the pivot point
	if (piv == 1) then 
		(
		n.pivot = n.center 
		)
-- copy the object
	temp = copy n
-- scale the copies by 80 %
	temp.scale = scale_this_much
-- rename the objects
	temp.name = "Bone_" + n.name
	)

NewSkin = Box lengthsegs:1 widthsegs:1 heightsegs:1 length:10 width:10 height:10 mapCoords:on pos:[0,0,0] isSelected:on 
addModifier NewSkin (Edit_Mesh ())
collapseStack NewSkin
--convertTo NewSkin TriMeshGeometry 
NewSkin.name = "NewSkin" 
NewSkin.material = sel[1].material 
objnames = #()
objverts = #()

for n in sel do
	(
	append objnames ("Bone_" + (n.name as string))
	append objverts ((getnumverts NewSkin)+1-8) -- subtract 8 for the verts that will be deleted later
	meshop.attach NewSkin n condenseMat:true deleteSourceNode:false
	append objverts ((getnumverts $NewSkin)-8) -- subtract 8 for the verts that will be deleted later
	)
print objverts

select NewSkin.verts[#{1..8}] 
meshop.deleteverts NewSkin (getVertSelection NewSkin)


addModifier NewSkin (Skin())

NewSkin.modifiers[#Skin].bone_Limit = 1

-- build bone object list
clearSelection()
for n in objnames do
	(
	temp = "selectMore $" + n
	execute temp
	)
NewBones = getCurrentSelection()
print objverts 
print NewBones

-- add NewBones
select NewSkin
for n in NewBones do
	(
	skinOps.addbone NewSkin.modifiers[#Skin] n 1
	wwSetExportGeoFlag n false
	)

-- weight verts to new bones

for n = 1 to NewBones.count do
	(
--	skinOps.SelectBone NewSkin.modifiers[#Skin] n
	for x = (objverts[(n*2)-1]) to (objverts[n*2]) do
		(
		-- DON'T KNOW WHY THE SELECTION NEEDS TO BE CLEARED
		clearSelection()
		select NewSkin
	--	print x
	--	print n
		skinOps.SetVertexWeights NewSkin.modifiers[#Skin] (x as integer) (n as integer) 1.0
		)
	)

NewSkin.modifiers[#Skin].always_deform = off
wwSetShadowFlag $NewSkin true

macros.run "RTS Tools" "RTS_Skin2W3D"

--delete original objects
select sel
max delete

)
rollout stuff "Skinner"
(
label lbl01 ""
spinner scaleamount "Scale Bones %" range:[1,200,80] type:#float align:#center
label lbl02 ""
checkbox Center_Piviots "Center Piviots on Bones" checked:true
label lbl03 ""
button OK "OK" width:50 align:#center

on OK pressed do
	(
	this_much = (scaleamount.value/100)
	print Center_Piviots.checked
			DestroyDialog stuff
			if ( Center_Piviots.checked == true) then 
				(
				Skinner this_much 1
				)
				else
				(
				Skinner this_much 0
				)
	)
)

CreateDialog stuff width:200 height:130

)
