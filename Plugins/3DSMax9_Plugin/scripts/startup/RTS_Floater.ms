
macroScript RTSToolsFloater

	category:"RTS Tools"
	toolTip:"RTS Tools Floater"
	icon:#("RTS",6)
(

rollout RTSFloater "RTS"
	(
	
	bitmap RTSbmp filename:"c:\3dsmax5\scripts\RTS.jpg"

	group "Saved Viewport Layouts"
		(
		button SVL1 "Layout 1"
		button SVL2 "Layout 2"
		button SVL3 "Layout 3"
		button SVL4 "Layout 4"
		button SVLR "Record Current"
		)
		on SVL1 pressed do
			(
			macros.run "RTS Tools" "View_Layout_Reader_1"
			)
		on SVL2 pressed do
			(
			macros.run "RTS Tools" "View_Layout_Reader_2"
			)
		on SVL3 pressed do
			(
			macros.run "RTS Tools" "View_Layout_Reader_3"
			)
		on SVL4 pressed do
			(
			macros.run "RTS Tools" "View_Layout_Reader_4"
			)
		on SVLR pressed do
			(
			macros.run "RTS Tools" "View_Layout_Recorder"
			)

	group "Add Controller List"
		(
		button b_one "Add"
		)
	group "Batch Object Merge"
		(
		button b_two "Merge"
		)
	group "Record Pose"
		(
		button b_three "Record"
		button b_four "Read"
		)
	group "Aligner"
		(
		button b_five "Align"
		)
	group "Animate Building"
		(
		button b_six "Animate"
		)
	group "Texture Animation Grid"
		(
		button b_seven "Build Grid"
		)
	group "Batch W3D Exporter"
		(
		button b_eight "Export"
		)
	group "Skinning"
		(
		button b_nine "W3D to Skin"
		button b_ten "Skin to W3D"
		)
		
		on b_one pressed do
			(
			macros.run "RTS Tools" "Add_PR_List_Controller"
			)
		on b_two pressed do
			(
			macros.run "RTS Tools" "Object_Merge"
			)
		on b_three pressed do
			(
			macros.run "RTS Tools" "Pose_Recorder"
			)
		on b_four pressed do
			(
			macros.run "RTS Tools" "Pose_Reader"
			)
		on b_five pressed do
			(
			macros.run "RTS Tools" "Aligner"
			)
		on b_six pressed do
			(
			macros.run "RTS Tools" "LorR_Anim_Building"
			)
		on b_seven pressed do
			(
			macros.run "RTS Tools" "RTS_Texture_Animation_Grid"
			)
		on b_eight pressed do
			(
			macros.run "RTS Tools" "RTS_Batch_Export"
			)
		on b_nine pressed do
			(
			macros.run "RTS Tools" "RTS_W3D2Skin"
			)
		on b_ten pressed do
			(
			macros.run "RTS Tools" "RTS_Skin2W3D"
			)

	)
	
NewFloater = newRolloutFloater "RTS Tools" 150 400
addRollout RTSFloater NewFloater
cui.RegisterDialogBar NewFloater style: #(#cui_dock_vert, #cui_floatable, #cui_handles)

)

