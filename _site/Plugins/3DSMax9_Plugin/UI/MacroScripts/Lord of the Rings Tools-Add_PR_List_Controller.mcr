macroScript Add_PR_List_Controller

	category:"Lord of the Rings Tools"
	toolTip:"Add Controller List"
	icon:#("LotR",3)
(

-- This script will add Position and Rotation List Controllers to the selected objects
-- and make the newly added controller the "active" controller

-- WARNING:  This script can damage the objects that are selected
-- when it is run.

-- written by Sean O'Hara

rollout diag "Add Controllers"
	(
	group "Position Controller"
		(
		label space01 ""
		checkbox addPosCon "Add Position Controller" checked:True align:#left
		radiobuttons PosCon labels:#("XYZ","Bezier","Noise") defaut:1
		)
	group "Rotation Controller"
		(
		label space02 ""
		checkbox addRotCon "Add Rotation Controller" checked:True align:#left
		radiobuttons RotCon labels:#("Smooth","Euler","Noise") defaut:1
		)
	group "WARNING"
		(
		label warning02 "WARNING"
		label warning03 "This script will create a controller list and add the"
		label warning04 "new controllers to the list and make them active"
		label space03 ""
		label warning05 "to continue press OK"
		button ok "OK"
		label warning08 "to stop press Cancel"
		button cancel "Cancel"
		label warning09 ""
		)
		
	on ok pressed do
		(
		if ((addPosCon.checked == False) and (addRotCon.checked == False)) then print"Error: no controllers were changed"

		selectedobjs = (selection as array)
		for d in selectedobjs do
			(
			if (addPosCon.checked == True) do
				(
				if (PosCon.state == 1) Then
					(
					if ((d.pos.controller as string) != "Controller:Position_List") then d.pos.controller = position_list ()
					d.pos.controller.Available.controller = Position_XYZ ()
					lastcon = d.pos.controller.getCount()
					d.pos.controller.SetActive lastcon 
					)
				if (PosCon.state == 2) Then
					(
					if ((d.pos.controller as string) != "Controller:Position_List") then d.pos.controller = position_list ()
					d.pos.controller.Available.controller = bezier_position ()
					lastcon = d.pos.controller.getCount()
					d.pos.controller.SetActive lastcon
					)
				if (PosCon.state == 3) Then
					(
					if ((d.pos.controller as string) != "Controller:Position_List") then d.pos.controller = position_list ()
					d.pos.controller.Available.controller = Noise_position ()
					lastcon = d.pos.controller.getCount()
					d.pos.controller.SetActive lastcon
					)
				)
			if (addRotCon.checked == True) do
				(
				if (RotCon.state == 1) then
					(
					if ((d.rotation.controller as string) != "Controller:Rotation_List") then d.rotation.controller = rotation_list ()
					d.rotation.controller.Available.controller = bezier_rotation ()
					lastcon = d.rotation.controller.getCount()
					d.rotation.controller.SetActive lastcon 
					)
				if (RotCon.state == 2) then
					(
					if ((d.rotation.controller as string) != "Controller:Rotation_List") then d.rotation.controller = rotation_list ()
					d.rotation.controller.Available.controller = Euler_XYZ ()
					lastcon = d.rotation.controller.getCount()
					d.rotation.controller.SetActive lastcon 
					)
				if (RotCon.state == 3) then
					(
					if ((d.rotation.controller as string) != "Controller:Rotation_List") then d.rotation.controller = rotation_list ()
					d.rotation.controller.Available.controller = Noise_rotation ()
					lastcon = d.rotation.controller.getCount()
					d.rotation.controller.SetActive lastcon 
					)
				)
			)
		DestroyDialog diag
		)
	on cancel pressed do
		(
		DestroyDialog diag
		)
	)


CreateDialog diag 400 375
)
