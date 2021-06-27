macroScript View_Layout_Recorder

	category:"Lord of the Rings Tools"
	toolTip:"View Layout Recorder"
	icon:#("Lotr",7)
(

-- written by Sean O'Hara


-- Script Functions

fn WriteViewLayoutFile Name  =
		(
	
		-- make a .view file
		
		selectedobjs = (selection as array)
		FileName = "\\3dsmax5\\scripts\\" + Name + ".view"
		if ((getFiles FileName).count == 0) then
			(
--			print FileName
			ViewFile = createFile FileName
			)
			else
			(
--			print FileName
			ViewFile = openFile FileName mode:"wt"
			)
			-- record current layout and views
			viewlayout = viewport.getLayout()
			viewnum = viewport.numViews
			viewact = viewport.activeViewport
			
			-- set layout
			print ("viewport.ResetAllViews()") to:ViewFile
			print ("viewport.setLayout #" + viewlayout) to:ViewFile
			
			-- set each viewport
			for x = 1 to viewnum do
				(
				viewport.activeViewport = x
				print ("viewport.activeViewport = " + (x as string)) to:ViewFile
				print ("viewport.setType #" + (viewport.getType() as string)) to:ViewFile
				print ("viewport.setGridVisibility "+ (x as string) + " " + ((viewport.GetGridVisibility x) as string)) to:ViewFile
				renmode = gw.getRndMode()
				for z = 1 to renmode.count do
					(
					if ((renmode[z] as string) == "illum") then 
						(
						-- viewport is smooth
						print "tempviewportsmooth = gw.getRndMode() ; if (tempviewportsmooth[1]  as string) != (#illum as string) then ( max wire smooth)" to:ViewFile
						)
						else
						(
						-- viewport is wireframe
						print "tempviewportsmooth = gw.getRndMode() ; if (tempviewportsmooth[1]  as string) == (#illum as string) then ( max wire smooth)" to:ViewFile
						)
					)
				)
				
		close ViewFile
			)
		

-- Script User Interface

rollout ViewFileName "Pose Name"
	(
	label warning01 ""
	label warning02 "Save the current view layout to:"
	label warning03 ""
	button view_one "Layout 1"
	button view_two "Layout 2"
	button view_three "Layout 3"
	button view_four "Layout 4"
	on view_one pressed do
		(
		WriteViewLayoutFile ("view_1")
		DestroyDialog ViewFileName 
		)
	on view_two pressed do
		(
		WriteViewLayoutFile ("view_2")
		DestroyDialog ViewFileName 
		)
	on view_three pressed do
		(
		WriteViewLayoutFile ("view_3")
		DestroyDialog ViewFileName 
		)
	on view_four pressed do
		(
		WriteViewLayoutFile ("view_4")
		DestroyDialog ViewFileName 
		)
	)	
		
-- Script Main Loop


CreateDialog ViewFileName 400 200


)
