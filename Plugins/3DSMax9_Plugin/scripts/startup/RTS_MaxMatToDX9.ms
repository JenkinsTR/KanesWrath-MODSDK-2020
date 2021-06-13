
macroScript RTS_MaxMatToDx9

	category:"RTS Tools"
	toolTip:"Max Material to DX9 Generic Object"
	icon:#("RTS",20)
(

	function CleanMaterials =
	(
		-- Clear all Materials in Editor
		for n = 1 to 24 do
			(
			meditMaterials[n]=standard()
			)
		
		-- Replace Materials with only the ones used in the scene
		c=1	
		
		for m in sceneMaterials do
			(
			meditMaterials[c]=m
			c=c+1
			)
	)

	CleanMaterials()
	sel = getCurrentSelection()
	c=1
	for n in sel do
	(
		selMat = n.material
	
		--create a new Max material
	    maxMat = meditMaterials[c] = DirectX_9_Shader ()
		maxMat.effectfile = "C:\projects\cnc\cnc3\production\Run\Shaders\3DSMax\ObjectsGeneric.fx"
		maxMat.name = (n.name) as string
		c=c+1
		
		if ( selMat.diffuseMap != undefined) then
			(
			if ( selMat.bumpMap != undefined) then
				(
				if ( selMat.specularMap!= undefined) then
					(
					maxMat.seteffectbitmap(1)  selMat.diffuseMap.bitmap
					maxMat.seteffectbitmap(2)  selMat.bumpMap.normal_map.bitmap
					maxMat.seteffectbitmap(3)  selMat.specularMap.bitmap
					n.material = maxMat
					)
					else
					(
					temp = "ERROR: Specular Bitmap is missing on " + (n.name as string)
					messageBox temp
					)
				)
				else
				(
				temp = "ERROR: Normal Bitmap is missing on " + (n.name as string)
				messageBox temp
				)
			)
			else
			(
			temp = "ERROR: Diffuse Bitmap is missing on " + (n.name as string)
			messageBox temp
			)
	)
	
)