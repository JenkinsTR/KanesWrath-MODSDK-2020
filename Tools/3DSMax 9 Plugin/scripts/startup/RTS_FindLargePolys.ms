macroScript RTS_FindLargePolys

	category:"RTS Tools"
	toolTip:"Find Large Polygons"
	icon:#("RTS",14)
(

-- THIS SCRIPT WILL FIND ALL LARGE POLYGONS AND SELECT THEM FOR TESSELATION

fn FindLargePolys objects =
(
	objs = (selection as array)
	-- print objs
	for n in objs do 
	(

		xdist = n.max.x - n.min.x
		ydist = n.max.y - n.min.y
		zdist = n.max.z - n.min.z
		
		BigFaces = #()
		
		-- allselectedobjs = (selection as array)
		-- selectedobj = n
		select n
		modPanel.addModToSelection (Edit_Poly ()) ui:on
		
		for i=1 to (polyOp.getNumFaces n)  do
		(
			max modify mode
			shit = copy n name:"shit"
			select $shit
			subobjectLevel = 4
			$shit.modifiers[#Edit_Poly].SetSelection #Face #{}
		
			$shit.modifiers[#Edit_Poly].Select #Face #{1..(polyOp.getNumFaces n)}
			$shit.modifiers[#Edit_Poly].Select #Face #{i} select:off
			actionMan.executeAction 0 "40020"  -- Edit: Delete
			$shit.modifiers[#Edit_Poly].ButtonOp #DeleteFace	
		
			tempxdist = ($shit.max.x - $shit.min.x)*3
			tempydist = ($shit.max.y - $shit.min.y)*3
			tempzdist = ($shit.max.z - $shit.min.z)*3
			--print tempxdist
			--print tempydist
			--print tempzdist
			count = 0
			if (tempxdist > xdist) then 
				(
				count=count+1
				--print "X"
				)
			if (tempydist > ydist) then 
				(
				count=count+1
				--print "Y"
				)
			if (tempzdist > zdist) then
				(
				count=count+1
				--print "Z"
				)
			if (count >= 2) then
				(
				append BigFaces i
				)
				
			delete $shit
			select n	
		
		)
		
		-- print BigFaces
		select n 
		subobjectLevel = 4
		n.modifiers[#Edit_Poly].SetSelection #Face #{}
		for i=1 to BigFaces.count do 
		(
		n.modifiers[#Edit_Poly].Select #Face #{BigFaces[i]}	
		)
	)
)	

rollout stuff "Find Large Polygons"
(
label lbl01 ""
label lbl02 "This script will find"
label lbl03 "all the polygons that"
label lbl04 "are larger than 30%"
label lbl05 "of the total size of"
label lbl06 "the selected objects"
label lbl07 ""

button OK "OK" width:50 align:#center

on OK pressed do
	(
			DestroyDialog stuff
			FindLargePolys $
	)
)

CreateDialog stuff width:200 height:180

)

