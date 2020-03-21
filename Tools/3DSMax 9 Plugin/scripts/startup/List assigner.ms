macroScript ListAssigner
	category:"DragAndDrop"
	toolTip:"Automate List Rotation Controller"
(
	$.rotation.controller = rotation_list ()
	$.rotation.controller.Available.controller = bezier_rotation ()
	lst = $.rotation.controller
	lst.SetActive 2
)
