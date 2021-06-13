macroScript Pose_Reader

	category:"Lord of the Rings Tools"
	toolTip:"Pose Reader"
	icon:#("LotR",2)
(

-- This script will read a ?.pose file that is selected by the user
-- and apply that pose to the objects in the scene

-- written by Sean O'Hara

filepathname = getOpenFileName filename:"\\3dsmax7\\poses\\" types:"Pose File (*.pose)"

if (filepathname == undefined)then 
	(
	print "Error: no file selected"
	)
	else
	(
	fileext = "*.pose"
	directory = getFilenamePath filepathname
	PoseName = (filenameFromPath filepathname)
	-- PoseName = "2345678901234567890123456789012345678901234567890.pose"

	
	if (getFiles ("\\3dsmax7\\poses\\"+PoseName)).count != 0 then
		(
		PoseFile = openFile ("\\3dsmax7\\poses\\"+PoseName) mode:"r"
	
		animate on
		while ((eof PoseFile) != True) do
			(
			skipToString PoseFile "\""
			newline = readDelimitedString PoseFile "\""
		--	newline = readLine PoseFile -- too many " for this function
			print newline
	
			execute newline
			)
		animate off
		close PoseFile
		)
		else
		(
		rollout diag "Pose Name"
			(
			label warning01 ""
			label warning02 "WARNING!"
			label warning04 "Pose file was not found ! "
			edittext name text:PoseName
			label warning07 ""
			button ok "OK"
			on ok pressed do
				(
				DestroyDialog diag
				)
			)
		CreateDialog diag 300 150
		)	
	)

)