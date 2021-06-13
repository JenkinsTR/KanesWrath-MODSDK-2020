macroScript Name_Reader

	category:"Lord of the Rings Tools"
	toolTip:"Name Reader"
	icon:#("LotR",2)
(

-- This script will read a ?.pose file that is selected by the user
-- and apply that pose to the objects in the scene

-- written by Sean O'Hara

filepathname = getOpenFileName filename:"\\3dsmax5\\poses\\" types:"Names File (*.name)"

if (filepathname == undefined)then 
	(
	print "Error: no file selected"
	)
	else
	(
	fileext = "*.name"
	directory = getFilenamePath filepathname
	OBJname = (filenameFromPath filepathname)
	
	if (getFiles ("\\3dsmax5\\poses\\"+OBJname)).count != 0 then
		(
		NameFile = openFile ("\\3dsmax5\\poses\\"+OBJname) mode:"r"

		while ((eof NameFile) != True) do
			(
			oldname = readLine NameFile
			newname = readline NameFile
			--print oldname 
			--print newname
			
			-- find the named object and rename it	
			tempname = for c in $*
				where (c.name == oldname) collect c
			print tempname
			if (tempname[1] != null) then
				(
				select tempname[1]
				tempname[1].name = newname 
 				)
				else print(oldname + " not found")
				
			)
				
		close NameFile
		)
		else
		(
		rollout diag "Name File"
			(
			label warning01 ""
			label warning02 "WARNING!"
			label warning04 "Pose file was not found ! "
			edittext name text:OBJname
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
