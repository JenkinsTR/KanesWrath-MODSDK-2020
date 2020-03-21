macroScript Aligner

	category:"Lord of the Rings Tools"
	toolTip:"Aligner"
	icon:#("LotR",4)
(
	obj1 = selection[1]
	obj2 = pickObject()
	tempscale = obj1.scale
	obj1.transform = obj2.transform
	obj1.scale = tempscale
)
