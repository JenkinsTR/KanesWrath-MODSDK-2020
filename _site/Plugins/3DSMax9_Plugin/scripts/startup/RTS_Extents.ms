

macroScript RTS_Extents

	category:"RTS Tools"
	toolTip:"Extents"
	icon:#("RTS",18)
(



sel = getCurrentSelection()
temp = "\n\n\n\n"
local int errorNum
errorNum = 0
for n in sel do
	(
		if ((n.baseObject as string) == "Box" ) then
			(
			if (n.rotation.x != 0) then 
				(
				print ("ERROR: " + (n.name as string) + " is rotated")
				errorNum = errorNum + 1 
				)
			if (n.rotation.y != 0) then
				(
				print ("ERROR: " + (n.name as string) + " is rotated")
				errorNum = errorNum + 1  
				)
			if (n.rotation.z != 0) then
				(
				print ("ERROR: " + (n.name as string) + " is rotated")
				errorNum = errorNum + 1 
				)
			)
	)
if (errorNum == 0) then
	(
	for n in sel do
		(
			if ((n.baseObject as string) == "Box" ) then
			(
			Major = (n.center.x - n.max.x) * -1
			Minor = (n.center.y - n.max.y) * -1
			Height = (n.center.z - n.max.z) * -2 
			OffX = n.center.x
			OffY = n.center.y
			OffZ = n.min.z
			temp = temp + "\n<Shape \n" + "     Type= \"BOX\"\n" + "     MajorRadius = \"" + (Major as string) + "\"\n     MinorRadius = \"" +  (Minor as string) + "\"\n     Height = \"" + (Height as string) + "\" >" 
			temp = temp + "\n" + "    <Offset\n" + "        x = \"" + (OffX as string) + "\"\n        y = \"" + (OffY as string) + "\"\n        z = \"" + (OffZ as string)  + "\" />" + "\n</Shape>"
			)
		)
	for n in sel do
		(
			if ((n.baseObject as string) == "Cylinder" ) then
			(
			Major = (n.center.x - n.max.x) * -1
			Minor = (n.center.x - n.max.x) * -1
			Height = (n.center.z - n.max.z) * -2 
			OffX = n.center.x
			OffY = n.center.y
			OffZ = n.min.z
			temp = temp + "\n<Shape \n" + "    Type= \"Cylinder\"\n" + "    MajorRadius = \"" + (Major as string) + "\"\n    MinorRadius = \"" +  (Minor as string) + "\"\n    Height = \"" + (Height as string) + "\" >"
			temp = temp + "\n" + "    <Offset\n" + "        x = \"" + (OffX as string) + "\"\n        y = \"" + (OffY as string) + "\"\n        z = \"" + (OffZ as string)  + "\" />" + "\n</Shape>" 
			)
		)
	
	temp = temp + "\n\n\n\n"
	print temp
	messageBox "SUCCESSFUL: Please copy the text from the MAXScript Listener"

	)
)