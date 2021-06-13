
macroScript Replace_Dummys_with_Boxes

	category:"Lord of the Rings Tools"
	toolTip:"Replace Dummys with Boxes"
	buttontext:"Replace Dummys"
(

-- This script will make a box object that is at the same position and scale
-- as each of the dummys objects in the scene
-- written by Sean O'Hara
	
--clearSelection
olddummys = for s in $* 
	where (classof s == Dummy) collect s
--selectMore olddummys

	for n = 1 to olddummys.count do
		(
		temppos = olddummys[n].position
		temprot = olddummys[n].rotation
		tempbmin = olddummys[n].min.x
		tempbmax = olddummys[n].max.x
		tempbscale = (tempbmax - tempbmin)
		newdummy = Box lengthsegs:1 widthsegs:1 heightsegs:1 length:tempbscale  width:tempbscale height:tempbscale mapCoords:off transform:(matrix3 [1,0,0] [0,0,1] [0,-1,0] [0, 0 ,0]) isSelected:on
		newdummy.pivot.y = -1*(tempbscale/2)
		newdummy.rotation = temprot
		newdummy.pos = temppos
		newdummy.name = "Dummy_Replacement_Box_" + (n as string)
		)

)			