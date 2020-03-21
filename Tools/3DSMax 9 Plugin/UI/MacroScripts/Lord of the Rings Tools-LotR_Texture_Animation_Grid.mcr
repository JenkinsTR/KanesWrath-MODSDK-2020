macroScript LotR_Texture_Animation_Grid

	category:"Lord of the Rings Tools"
	toolTip:"Texture Animation Grid"
	icon:#("LotR",4)
(

rollout stuff "Texture Animation Grid"
(
label lbl01 ""
spinner xval "rows       " range:[2,10,4] scale:1 align:#center
spinner yval "columns " range:[2,10,4] scale:1 align:#center
label lbl02 ""
button ok "OK" width: 50 pos:[40,80]
button cancel "Cancel" width:50 pos:[110,80]

on ok pressed do
	(
	DestroyDialog stuff

	messageBox "This script will require you to select the first bitmap in a sequence.  The file names sequence must end in a 4 digit number (ie. dog0023.tga)"

	xmax = xval.value
	zmax = yval.value
	
	framenumber = 0
	framename = (0000 as string)
	file = getOpenFileName()
	filename = getFilenameFile file
	fileext = getFilenameType file
	filedir = getFilenamePath file
	num = ""
	
	-- get filename with no numbers at the end
	filenamenonum = ""
	for i=1 to (filename.count - 4) do filenamenonum = filenamenonum + filename[i]
	print filenamenonum 
	
	for i=0 to int (xmax*zmax) do 
		(
		num = (i as string)
		while (num.count <= 3) do num = "0" + num
		temp = filedir + filenamenonum + num + fileext
		--print temp
		if (doesFileExist temp) == False then print ("missing file " + num)
		)
	
	
	-- make opaque version
	
	for z=1 to zmax do
		(
		for x=1 to xmax do
			(
			framename = (framenumber as string)
			while (framename.count <= 3) do framename = "0" + framename
			b = Box name:("RGB"+(framename as string)) lengthsegs:1 widthsegs:1 heightsegs:1 length:100 width:100 height:100 mapCoords:on transform:(matrix3 [1,0,0] [0,0,1] [0,-1,0] [(x*100),0,(z*-100)]) isSelected:on
			meditMaterials[1] = Standardmaterial ()
			meditMaterials[1].diffuseMap = Bitmaptexture fileName: (filedir + filenamenonum + framename + fileext)
			meditMaterials[1].Diffuse = color 0 0 0
			meditMaterials[1].name = (filenamenonum + framename)
			$.material = meditMaterials[1]
			framenumber = framenumber + 1
			)
		)	
		
	max select all
	group $RGB* name:"RGB"
	max hide selection
	
	-- make alpha channel version
	
	framenumber = 0
	framename = (0000 as string)
	for z=1 to zmax do
		(
		for x=1 to xmax do
			(
			framename = (framenumber as string)
			while (framename.count <= 3) do framename = "0" + framename
			b = Box name:("Alpha"+(framename as string)) lengthsegs:1 widthsegs:1 heightsegs:1 length:100 width:100 height:100 mapCoords:on transform:(matrix3 [1,0,0] [0,0,1] [0,-1,0] [(x*100),0,(z*-100)]) isSelected:on
			meditMaterials[1] = Standardmaterial ()
			meditMaterials[1].diffuseMap = Bitmaptexture fileName: (filedir + filenamenonum + framename + fileext)
			meditMaterials[1].Diffuse = color 0 0 0
			meditMaterials[1].name = (filenamenonum + framename)
			meditMaterials[1].diffuseMap.rgbOutput = 1
			$.material = meditMaterials[1]
			framenumber = framenumber + 1
			)
		)	
		
	max select all
	group $Alpha* name:"Alpha"
	max unhide all
	)
on cancel pressed do
	(
	DestroyDialog stuff
	)
)
CreateDialog stuff width:200 height:130


)
