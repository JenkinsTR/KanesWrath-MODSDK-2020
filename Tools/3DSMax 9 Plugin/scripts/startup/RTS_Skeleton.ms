macroScript RTS_Skeleton

	category:"RTS Tools"
	toolTip:"Skeleton"
	icon:#("RTS",17)
(


fn Skinner scale_me piv =
(
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
-- parent the original object to the new bone
	n.parent = temp
	)


)
rollout stuff "Skeleton"
(
label lbl10 ""
label lbl11 "This script will create bones"
label lbl12 "from copies of the selected objects."
label lbl13 "Then it will link the original"
label lbl14 "objects to the new bones"
label lbl15 ""

label lbl01 ""
spinner scaleamount "Scale Bones %" range:[1,200,99] type:#float align:#center
label lbl02 ""
checkbox Center_Piviots "Center Piviots First" align:#center
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

CreateDialog stuff width:200 height:250

)
