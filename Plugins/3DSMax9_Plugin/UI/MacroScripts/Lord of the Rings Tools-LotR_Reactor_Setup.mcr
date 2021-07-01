macroScript LotR_Reactor_Setup

	category:"Lord of the Rings Tools"
	toolTip:"Reactor Setup"
	icon:#("LotR",24)
(
	Box lengthsegs:1 widthsegs:1 heightsegs:1 length:250 width:250 height:-5 mapCoords:on pos:[-10.4762,6.01976,0] isSelected:on
	max move
	$.name = "Ground"
	RBCollection transform:(matrix3 [1,0,0] [0,0,1] [0,-1,0] [112.329,-3.72262e-006,85.1636]) isSelected:on
	clearSelection()
	select $Ground
	clearSelection()
) 