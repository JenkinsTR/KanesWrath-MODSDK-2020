macroScript LotR_FractureObject

	category:"Lord of the Rings Tools"
	toolTip:"Fracture Object"
	icon:#("LotR",16)
(


-- BREAKS OBJECTS INTO ELEMENTS

fn explodeElements obj =
(
	local objArr
	if (classOf obj==Editable_Mesh) OR (classOf obj==Editable_Poly) then
	(
		objArr=#(obj)
		local objName=obj.name
		local geuf
		local cnt=0
		if classOf obj==Editable_Mesh then convertTo obj Editable_Poly
		while (geuf=polyop.getElementsUsingFace obj 1 as array).count < (polyop.getNumFaces obj) do
		(
			polyop.detachFaces obj (polyop.getElementsUsingFace obj 1) asNode: true	name: "Fragment_01" delete: true
			polyop.collapseDeadStructs obj
			append objArr objects[objects.count]
		)
		select objArr
	)	
)



-- THIS SCRIPT WILL FRACTURE AN OBJECT INTO A SPECIFIED NUMBER OF PIECES

fn FractureObject obj NumPieces Thickness =
(
	tempobject = (selection as array)
	selectedobj = getNodeByName (tempobject[1].name) exact:true 
	copyobj = copy $
	select copyobj
	max hide selection
	select selectedobj 
	
	part_expl = (parray emitter:$ viewtype:2 speed:0 particletype:2 fragmentmethod:1 fragchunkminimum:NumPieces fragment_thicnkness:0.0)
	part_expl.Fragment_Thickness = Thickness
	part_expl.seed = (random 1 9999)
	explMesher = (mesher pick:part_expl radius:50 name:"Fragment_01")
	convertToMesh explMesher
	explodeElements explMesher 
	delete part_expl
	
	
	-- MATCH FACES WITH OTHER OBJECTS
	
	SameFaces = #()
	FragFaces = #()
	select selectedobj
	convertToMesh selectedobj
	
	max select invert
	otherobjs = (selection as array)
	select selectedobj 
	
	
	
	for obj in otherobjs do 
	(
		convertToMesh obj
		SameFaces = #()
		FragFaces = #()
		for n=1 to (meshop.getNumFaces $) do
		(
			tempface = (meshop.getFaceCenter $ (n))*100
			tempfacex = (tempface.x as integer)
			tempfacey = (tempface.y as integer)
			tempfacez = (tempface.z as integer)
			for i=1 to (meshop.getNumFaces obj) do
			(
				compface = (meshop.getFaceCenter obj (i))*100
				compfacex = (compface.x as integer)
				compfacey = (compface.y as integer)
				compfacez = (compface.z as integer)
				--print tempface
				--print compface
				if (compfacex == tempfacex) then
				(
					--print "x"
					if (compfacey == tempfacey) then
					(
						--print "y"
						if (compfacez == tempfacez) then 
						(
							--print "z"
							append SameFaces n
							append FragFaces i
						)
					)
				)
			)
		)
		
		print SameFaces
		print FragFaces
		print "new obj"
	
		-- DETACH FACES FROM SELECTED OBJ
		newmesh = meshop.detachFaces $ SameFaces delete:true asMesh:true
		update $
		Frac = Editable_mesh()h
		Frac.name = (uniqueName "Frac_")
		Frac.transform = $.transform
		Frac.mesh = newmesh 
		Frac.material = selectedobj.material
		update Frac
		
		-- DELETE FACES FROM FRAGMENT
		meshop.deleteFaces obj FragFaces delIsoVerts:true
		obj.material = selectedobj.material
		
	)
	
	print otherobjs
	print selectedobj
	
	-- DELETE THE ORIGINAL "EMPTY OBJECT"
	select selectedobj 
	actionMan.executeAction 0 "40020"  -- Edit: Delete Objects
	delete 
)



rollout stuff "Find Large Polygons"
(
label lbl01 ""
label lbl02 "This script will break"
label lbl03 "the selected object"
label lbl04 "into a specified number"
label lbl05 "of pieces"
spinner NumberOfPieces "Pieces" range:[1,100,10] type:#integer align:#center
spinner amountOfThickness "Thickness" range:[0,100,4] type:#float align:#center


label lbl07 ""

button OK "OK" width:50 align:#center

on OK pressed do
	(
			DestroyDialog stuff
			tempobj = getCurrentSelection()
			if (tempobj.count == 1) then
			(
			max hide inv
			FractureObject tempobj[1] NumberOfPieces.value amountOfThickness.value
			)
			else
			(
			messagebox "ERROR: Only 1 object can be selected"
			)
	)
)

CreateDialog stuff width:200 height:200

)

