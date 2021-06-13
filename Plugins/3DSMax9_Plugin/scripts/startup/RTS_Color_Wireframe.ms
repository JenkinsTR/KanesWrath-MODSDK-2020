

macroScript RTS_Color_Wireframe

	category:"RTS Tools"
	toolTip:"Color Wireframe"
	icon:#("RTS",25)
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