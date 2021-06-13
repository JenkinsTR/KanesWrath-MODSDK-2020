macroScript LotR_Batch_Export

	category:"Lord of the Rings Tools"
	toolTip:"Batch Export"
	icon:#("LotR",4)
(



rollout stuff "Export Sub-Directories?"
(
label lbl04 ""
label lbl05 "Do you want to export all the"
label lbl06 "files in the sub-directories ?"
label lbl07 ""
button Yes "Yes" width:50 pos:[45,80]
button No "No" width:50 pos:[105,80]

on Yes pressed do
	(
	DestroyDialog stuff
	
	-- this will export all the sub directories
	-- the user will have to choose a max file in the
	-- main directory but it will not export any of the
	-- max files in that directory
	
	directory = getSavePath()
	
	if directory == undefined then
		(
		print "operation canceled"
		)
		else
		(
		fileext = "\*.max"
		
		temp = directory+fileext
		
		directories = getDirectories (directory+"\*")
		print directories[2]
		n=0
		for d in directories do
			(
			n=n+1
			temp = (getFilenamePath directories[n])+fileext
			print temp
	
			files = getFiles temp
			
			for f in files do 
				(
				loadMaxFile f
				print f
				tempfile = getFilenameFile f
				tempfile = (getFilenamePath f)+"\\"+tempfile+".w3x"
				ExportFile tempfile #noPrompt
				)
			)
			
		temp = directory+fileext
		files = getFiles temp
		for f in files do 
			(
			loadMaxFile f
			print f
			tempfile = getFilenameFile f
			tempfile = (getFilenamePath f)+"\\"+tempfile+".w3x"
			ExportFile tempfile #noPrompt
			)
		)
	)

on No pressed do
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
			print f
			tempfile = getFilenameFile f
			tempfile = directory+"\\"+tempfile+".w3x"
			ExportFile tempfile #noPrompt
			)
		)
	)
)

Doit = queryBox "WARNING: This script will export all the files in a directory as .w3x files. For each of the files, it will use the same export settings that were used the last time each file was exported. This could cause problems if a file has never been exported before. Please check your work when the script finishes. Do you want to Continue ?"
if Doit == True Then CreateDialog stuff width:200 height:120



)
