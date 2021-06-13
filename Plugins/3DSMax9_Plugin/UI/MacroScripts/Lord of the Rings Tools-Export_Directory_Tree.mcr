macroScript Export_Directory_Tree
	category:"Lord of the Rings Tools"
	buttonText:"Export Directory Tree"
	toolTip:"Export all MAX files in a folder and all its sub-folders"
	icon:#("SchematicView", 2)
(
	local count = exportDirectoryTree()
	print (count as string + " files exported")
	if count > 0 then
		resetMaxFile #noPrompt
)
