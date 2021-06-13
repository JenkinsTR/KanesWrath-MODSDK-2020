macroScript LotR_Contact_Points

	category:"Lord of the Rings Tools"
	toolTip:"Contact Points"
	icon:#("LotR",19)
(



CreateObject = yesNoCancelBox "Pressing YES will create the Contact Points Object \nPressing NO will print out the contact points\nPressing Cancel will do nothing"

if (CreateObject == #yes) then
	(
	ConPoints= #([0,0,0])
	Box lengthsegs:1 widthsegs:1 heightsegs:1 length:10 width:10 height:10 mapCoords:on pos:[0,0,0] isSelected:on
	modPanel.addModToSelection (Edit_Mesh ()) ui:on
	convertTo $ TriMeshGeometry
	$.name = "Contact_Points"
	setNumVerts $ 0
	setNumVerts $ 8
	$.verts[1].position= [0,0,0]
	$.verts[2].position= [0,200,0]
	$.verts[3].position= [0,0,200]
	$.verts[4].position= [0,200,200]
	$.verts[5].position= [200,0,0]
	$.verts[6].position= [200,200,0]
	$.verts[7].position= [200,0,200]
	$.verts[8].position= [200,200,200]
	convertTo $ TriMeshGeometry
	)
if (CreateObject == #no) then
	(
	ConPoints= #([0,0,0])
	select $Contact_Points
	if ($.name == "Contact_Points") then
		(
		if ((getNumVerts $) == 8) then
			(		
			ConPoints[1]= $.verts[1].position
			ConPoints[2]= $.verts[7].position
			ConPoints[3]= $.verts[6].position
			ConPoints[4]= $.verts[4].position
			ConPoints[5]= $.verts[3].position
			ConPoints[6]= $.verts[5].position
			ConPoints[7]= $.verts[8].position
			ConPoints[8]= $.verts[2].position
			
			temp = "\n\n\n\n"
			
			for n = 1 to 8 do
				(
					temp = temp + "\n<ContactPoint>\n" + "     <Pos x= \"" + (ConPoints[n].x as string) + "\" y = \"" + (ConPoints[n].y as string) + "\" z = \"" + (ConPoints[n].z as string) + "\" />" + "\n</ContactPoint>" 
				)
			
			temp = temp + "\n\n\n\n"
			print temp
			messageBox "SUCCESSFUL: Please copy the text from the MAXScript Listener"
			)
			else
			(
			messageBox ( "ERROR: " + $.name + " is not the Correct Mesh \nPlease select the object named: \nContact_Points ")
			)
		)
		else
		(
		messageBox ( "ERROR: " + $.name + " is not the Correct Mesh \nPlease select the object named: \nContact_Points ")
		)
	clearSelection()	
	)

)
