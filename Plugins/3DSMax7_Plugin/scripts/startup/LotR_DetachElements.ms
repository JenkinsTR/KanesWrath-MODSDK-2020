macroScript LotR_DetachElements

	category:"Lord of the Rings Tools"
	toolTip:"Detach Elements"
	icon:#("LotR",15)
(


-- BREAKS OBJECTS INTO ELEMENTS


fn DetachElements selobjects =
(
	allselectedobjs = (selection as array)
				
	for obj in allselectedobjs do
	(
		fn explodeElements obj =
		(
			local objArr
			if (classOf obj==Editable_Mesh) OR (classOf obj==Editable_Poly) then
			(
				objArr=#(obj)
				local objName=obj.name
				local geuf
				local cnt=0
				local newName = objName + "_Frac_00"
				if classOf obj==Editable_Mesh then convertTo obj Editable_Poly
				while (geuf=polyop.getElementsUsingFace obj 1 as array).count < (polyop.getNumFaces obj) do
				(
					polyop.detachFaces obj (polyop.getElementsUsingFace obj 1) asNode: true	name: newName delete: true
					polyop.collapseDeadStructs obj
					append objArr objects[objects.count]
				)
				select objArr
			)	
		)
		
		objArr = explodeElements obj
	)
	
	-- change colors of objects
	
	allobjects = $*
	for x in allobjects do
		(
		x.wirecolor = [random 0 255,random 0 255,random 0 255]
		select x
		)
)
		

rollout stuff "Detach Elements"
(
label lbl01 ""
label lbl02 "This script will seperate"
label lbl03 "the selected objects"
label lbl04 "into thier elements"
label lbl05 ""

button OK "OK" width:50 align:#center

on OK pressed do
	(
			DestroyDialog stuff
			DetachElements $
	)
)

CreateDialog stuff width:200 height:130

)

