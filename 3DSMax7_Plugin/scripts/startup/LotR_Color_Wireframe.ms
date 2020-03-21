

macroScript LotR_Color_Wireframe

	category:"Lord of the Rings Tools"
	toolTip:"Color Wireframe"
	icon:#("LotR",25)
(

		sel = getCurrentSelection()
		for n in sel do
			(
				r = random 0 255
				g = random 0 255
				b = random 0 255
				n.wirecolor = color r g b
			)
)