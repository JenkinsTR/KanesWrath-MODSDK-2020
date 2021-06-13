
macroScript Clean_Material_Editor

	category:"RTS Tools"
	toolTip:"Clean Material Editor"
	icon:#("RTS",5)
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