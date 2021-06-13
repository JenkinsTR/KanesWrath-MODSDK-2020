macroScript Pose_Recorder

	category:"Lord of the Rings Tools"
	toolTip:"Pose Recorder"
	icon:#("Lotr",1)
(

-- This script will record the rotation and translation of the selected objects
-- and put that into a file named ?.pose in the 3dsmax/scripts directory
-- Then it will read a script file named "Base_Pose_Script.ms" and replace the
-- file name that the "Base_Pose_Script.ms" reads with ?.pos
-- Then it will open the new script for editing so that the contents can easily be
-- draged and dropped to the tab shelf in max which will create a button that will
-- read the .pose file and apply that pose to the objects in the scene

-- written by Sean O'Hara


-- Script Functions

fn CheckObjectNames =
	(
		-- check for spaces in the names of the objects

		selectedobjs = (selection as array)
		badnames = for s in selectedobjs 
			where ((findString s.name " ") != undefined ) collect s
		-- print badnames
		
		if (badnames[1] != nil) then
			(
			for bad in badnames do print bad.name
			Return (False)
			)
			else
			(
			-- print "good to go"
			Return (True)
			)
	)


fn FixObjectNames =
		(
		selectedobjs = (selection as array)
		for d in selectedobjs do
			(
			global objname = d.name
			if ((findString objname " ") != undefined ) do
				(
						newtempstring = ""
						tempstring = filterString objname  " "
						for z = 1 to ((tempstring.count) - 1) do
							(
							newtempstring = (newtempstring  + tempstring[z] + "_")
							)
						newtempstring = newtempstring + tempstring[tempstring.count]
						print newtempstring 
						objname = newtempstring
				)
			if (objname != d.name) do d.name = objname
		 	)
		)


fn WritePoseFile Name  =
		(
		-- check to see if the pose directory already exists
		if 	((getDirectories "\\3dsmax7\\poses\\").count < 1) then makeDir "\\3dsmax7\\poses\\" 
	
		-- make a .pose file
		
		selectedobjs = (selection as array)
		FileName = "\\3dsmax7\\poses\\"+Name.text+".pose"
		if ((getFiles FileName).count == 0) then
			(
			print FileName
			PoseFile = createFile FileName
			)
			else
			(
			PoseFile = openFile FileName mode:"wt"
			)
		for d in selectedobjs do
			(
			print d.name
			temprotstring = "in coordsys world $" + d.name + ".rotation.controller.value = " + (d.rotation.controller.value as string)	
			print temprotstring to:PoseFile
			tempposstring = "in coordsys world $" + d.name + ".pos.controller.value = " + (d.pos.controller.value as string)	
			print tempposstring to:PoseFile
			)

		-- find the targets and times for link_contrain controllers

		t = currentTime
		for d in selectedobjs do
			(
			if ((d.controller as string) == "Controller:Link_Constraint") then 
				(
				if ((d.controller.getNumTargets()) > 0) then
					(
					print d.name
					targetcount = d.controller.getNumTargets()
					newtargetname = ""
					
					-- find the target for the current frame
					for x = 1 to targetcount do
						(
						if ((d.controller.getFrameNo x) <= t) then 
							(
							newtarget = (d.controller.getNode x) 
							
							-- handles the case of the target being the "World"
							if ((newtarget as string)== "undefined") then 
								(
								newtargetname = "world"
								)
								else
								(
								newtargetname = newtarget.name
								)
							)
						)
						
					-- write the .pose file
					if (newtargetname == "world") then
						(
						print ("$" + d.name + ".controller.addWorld frameNo:currentTime ") to:PoseFile
						print ("$" + d.name + ".transform = " + (d.transform as string)) to:PoseFile
						)
						else
						(
						print ("$" + d.name + ".controller.addTarget $" + newtargetname + " currentTime ") to:PoseFile
						print ("$" + d.name + ".transform = " + (d.transform as string)) to:PoseFile
						)
					)
				)
			)
			
		close PoseFile

		-- make a script file that loads the pose file
		
		NewFileName = Name.text+".pose"+"\" -- "
		
		-- padd the filename with comments
		
		strlength = NewFileName.count
		print strlength 
		if (strlength < 56) do
			for z = 1 to (56 - strlength ) do (append NewFileName " ")

		-- replace the new "*.pose" file in the script
		
		FileName = "\\3dsmax7\\scripts\\Base_Pose_Script.ms"
		ScriptFile = openFile FileName mode:"r+"
		skipToString ScriptFile "= "
		x = filePos ScriptFile 
		seek ScriptFile (x)
		print NewFileName to:ScriptFile 
		close ScriptFile 
		
		edit "\\3dsmax7\\scripts\\Base_Pose_Script.ms"   
		)

-- Script User Interface

rollout PoseFileName "Pose Name"
	(
	label warning01 ""
	label warning02 "Please type the name of the pose "
	label warning04 "that you would like to create"
	edittext PoseName fieldWidth:200 align:#center
	label warning07 ""
	label warning08 "to stop press Cancel"
	label warning09 ""
	button cancel "Cancel"
	on PoseName entered text do
		(
		WritePoseFile(PoseName)
		DestroyDialog PoseFileName 
		)
	on cancel pressed do
		(
		DestroyDialog PoseFileName 
		)
	)
	
rollout FixNames "Fix Spaces in Object Name"
	(
	label warning01 ""
	label warning02 "ERROR: Spaces in Object Names"
	label warning03 ""
	label warning04 "Found object(s) with spaces in the name(s)"
	label warning06 "Fix it/them or stop recording the pose"
	label warning07 ""
	button ok "Fix"
	label warning08 ""
	button cancel "Cancel"
	on ok pressed do
		(
		if ((selectedobjs = (selection as array)) != nil ) then
			(
			FixObjectNames()
			DestroyDialog FixNames 
			CreateDialog PoseFileName 400 200
			)
			else
			(
			)
		)
	on cancel pressed do
		(
		DestroyDialog FixNames 
		)
	)
	

rollout NothingSelected "Nothing Selected"
	(
	label warning01 ""
	label warning02 "ERROR: Nothing is Selected"
	label warning03 ""
	label warning04 "Please select the objects that you would "
	label warning05 "like to record then run this script again."
	label warning06 ""
	button ok "OK"
	on ok pressed do
		(
		DestroyDialog NothingSelected 
		)
	)
	
		
-- Script Main Loop

if ((selectedobjs = (selection as array)).count > 0 ) then
	(
	if (CheckObjectNames() == True) then 
		(
		CreateDialog PoseFileName 400 200
		)
	else 
		(
		CreateDialog FixNames 400 200
		)
	)
else
	(
	CreateDialog NothingSelected 400 150
	)
)
