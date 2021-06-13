
macroScript Clean_Material_Editor

	category:"Lord of the Rings Tools"
	toolTip:"Clean Material Editor"
	icon:#("LotR",5)
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