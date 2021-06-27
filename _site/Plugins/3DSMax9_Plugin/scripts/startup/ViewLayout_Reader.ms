


-- ****************************    Reads File 1





macroScript View_Layout_Reader_1

	category:"Lord of the Rings Tools"
	toolTip:"View Layout Reader 1"
	icon:#("LotR",8)
(

fn ViewFileReader_1 = 
	(

-- written by Sean O'Hara

	Name = "View_1"
--	filepathname = getOpenFileName filename:"\\3dsmax5\\scripts\\" types:"View File (*.view)"
--	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	
	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	

	if (filepathname == undefined)then 
		(
		print "Error: no file selected"
		)
		else
		(
		fileext = "*.view"
		directory = getFilenamePath filepathname
		ViewName = (filenameFromPath filepathname)
		-- ViewName = "2345678901234567890123456789012345678901234567890.View"
	
		
		if ((getFiles ("\\3dsmax5\\scripts\\" + ViewName)).count != 0) then
			(
			ViewFile = openFile ("\\3dsmax5\\scripts\\" + ViewName) mode:"r"
		
			while ((eof ViewFile) != True) do
				(
--				skipToString ViewFile "\""
--				newline = readDelimitedString ViewFile "\""
				newline = readLine ViewFile -- too many " for this function
				newline[1] = " "
				newline[(newline.count)] = " "
				execute newline
				)

			close ViewFile 
			)
			Else
			(
			rollout diag "View Name"
				(
				label warning01 ""
				label warning02 "WARNING!"
				label warning04 "View file was not found ! "
				edittext name text:ViewName
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

ViewFileReader_1 ()
)



-- ****************************    Reads File 2




macroScript View_Layout_Reader_2

	category:"Lord of the Rings Tools"
	toolTip:"View Layout Reader 2"
	icon:#("LotR",8)
(

fn ViewFileReader_2 = 
	(

-- written by Sean O'Hara

	Name = "View_2"
--	filepathname = getOpenFileName filename:"\\3dsmax5\\scripts\\" types:"View File (*.view)"
--	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	
	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	

	if (filepathname == undefined)then 
		(
		print "Error: no file selected"
		)
		else
		(
		fileext = "*.view"
		directory = getFilenamePath filepathname
		ViewName = (filenameFromPath filepathname)
		-- ViewName = "2345678901234567890123456789012345678901234567890.View"
	
		
		if ((getFiles ("\\3dsmax5\\scripts\\" + ViewName)).count != 0) then
			(
			ViewFile = openFile ("\\3dsmax5\\scripts\\" + ViewName) mode:"r"
		
			while ((eof ViewFile) != True) do
				(
			--	skipToString ViewFile "\""
			--	newline = readDelimitedString ViewFile "\""
				newline = readLine ViewFile -- too many " for this function
				newline[1] = " "
				newline[(newline.count)] = " "
				execute newline
				)

			close ViewFile 
			)
			Else
			(
			rollout diag "View Name"
				(
				label warning01 ""
				label warning02 "WARNING!"
				label warning04 "View file was not found ! "
				edittext name text:ViewName
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

ViewFileReader_2 ()
)


-- ****************************    Reads File 3


macroScript View_Layout_Reader_3

	category:"Lord of the Rings Tools"
	toolTip:"View Layout Reader 3"
	icon:#("LotR",8)
(

fn ViewFileReader_3 = 
	(

-- written by Sean O'Hara

	Name = "View_3"
--	filepathname = getOpenFileName filename:"\\3dsmax5\\scripts\\" types:"View File (*.view)"
--	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	
	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	

	if (filepathname == undefined)then 
		(
		print "Error: no file selected"
		)
		else
		(
		fileext = "*.view"
		directory = getFilenamePath filepathname
		ViewName = (filenameFromPath filepathname)
		-- ViewName = "2345678901234567890123456789012345678901234567890.View"
	
		
		if ((getFiles ("\\3dsmax5\\scripts\\" + ViewName)).count != 0) then
			(
			ViewFile = openFile ("\\3dsmax5\\scripts\\" + ViewName) mode:"r"
		
			while ((eof ViewFile) != True) do
				(
			--	skipToString ViewFile "\""
			--	newline = readDelimitedString ViewFile "\""
				newline = readLine ViewFile -- too many " for this function
				newline[1] = " "
				newline[(newline.count)] = " "
				execute newline
				)

			close ViewFile 
			)
			Else
			(
			rollout diag "View Name"
				(
				label warning01 ""
				label warning02 "WARNING!"
				label warning04 "View file was not found ! "
				edittext name text:ViewName
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

ViewFileReader_3 ()
)



-- ****************************    Reads File 4


macroScript View_Layout_Reader_4

	category:"Lord of the Rings Tools"
	toolTip:"View Layout Reader 4"
	icon:#("LotR",8)
(

fn ViewFileReader_4 = 
	(

-- written by Sean O'Hara

	Name = "View_4"
--	filepathname = getOpenFileName filename:"\\3dsmax5\\scripts\\" types:"View File (*.view)"
--	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	
	filepathname = "\\3dsmax5\\scripts\\" + Name + ".view"	

	if (filepathname == undefined)then 
		(
		print "Error: no file selected"
		)
		else
		(
		fileext = "*.view"
		directory = getFilenamePath filepathname
		ViewName = (filenameFromPath filepathname)
		-- ViewName = "2345678901234567890123456789012345678901234567890.View"
	
		
		if ((getFiles ("\\3dsmax5\\scripts\\" + ViewName)).count != 0) then
			(
			ViewFile = openFile ("\\3dsmax5\\scripts\\" + ViewName) mode:"r"
		
			while ((eof ViewFile) != True) do
				(
			--	skipToString ViewFile "\""
			--	newline = readDelimitedString ViewFile "\""
				newline = readLine ViewFile -- too many " for this function
				newline[1] = " "
				newline[(newline.count)] = " "
				execute newline
				)

			close ViewFile 
			)
			Else
			(
			rollout diag "View Name"
				(
				label warning01 ""
				label warning02 "WARNING!"
				label warning04 "View file was not found ! "
				edittext name text:ViewName
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

ViewFileReader_4 ()
)



