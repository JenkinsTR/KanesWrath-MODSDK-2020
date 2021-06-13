

macroScript LotR_Batch_ReNameObjects

	category:"Lord of the Rings Tools"
	toolTip:"Batch Batch Rename Objects"
	icon:#("LotR",4)
(

	CurName = "NOTAVALIDNAME"
	NewName = "NOTAVALIDNAME"

	rollout stuff "Export Sub-Directories?"
	(
	label lbl01""
	edittext Name01 "Current Name" fieldWidth:200 align:#center
	label lbl02""
	edittext Name02 "New Name" fieldWidth:200 align:#center
	label lbl03 ""
	button Go "Go" width:50 pos:[125,120]

	on Name01 entered text do
	(
	CurName = Name01.text	
	)
	
	on Name02 entered text do
	(
	NewName = Name02.text	
	)
	
	on Go pressed do
		(
		DestroyDialog stuff
		directory = getSavePath()
		
		if directory == undefined then
			(
			print "operation canceled"
			)
			else
			(
			fileext = "\*.max"
			temp = directory+fileext
			files = getFiles temp
			for f in files do 
				(
				loadMaxFile f
				
					allobjs = $*
					for n in allobjs do
						( 
							if (n.name == CurName ) then 
							(
							n.name = NewName
							print ("renamed object " + CurName + " to " + NewName)
							)
						)
					
				max file save
	
				)
			)
		)
	)
	
	Doit = queryBox "WARNING: This script will rename the objects in your files. Do you want to Continue ?"
	if Doit == True Then CreateDialog stuff width:300 height:160
	
	
	
)

