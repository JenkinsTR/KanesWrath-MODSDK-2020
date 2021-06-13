


PoseName = "bindpose.pose" --                                       "


		
if (getFiles ("\\3dsmax5\\poses\\"+PoseName)).count != 0 then
	(
	PoseFile = openFile ("\\3dsmax5\\poses\\"+PoseName) mode:"r"

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

