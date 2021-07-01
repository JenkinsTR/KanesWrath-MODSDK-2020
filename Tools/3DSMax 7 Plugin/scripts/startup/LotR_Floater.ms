
macroScript LotrToolsFloater

	category:"Lord of the Rings Tools"
	toolTip:"Lotr Tools Floater"
	icon:#("LotR",6)
(

rollout LotrFloater "Lord of the Rings"
	(
	
	bitmap lotrbmp filename:"c:\3dsmax5\scripts\lotr.jpg"

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
			macros.run "Lord of the Rings Tools" "View_Layout_Reader_1"
			)
		on SVL2 pressed do
			(
			macros.run "Lord of the Rings Tools" "View_Layout_Reader_2"
			)
		on SVL3 pressed do
			(
			macros.run "Lord of the Rings Tools" "View_Layout_Reader_3"
			)
		on SVL4 pressed do
			(
			macros.run "Lord of the Rings Tools" "View_Layout_Reader_4"
			)
		on SVLR pressed do
			(
			macros.run "Lord of the Rings Tools" "View_Layout_Recorder"
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
			macros.run "Lord of the Rings Tools" "Add_PR_List_Controller"
			)
		on b_two pressed do
			(
			macros.run "Lord of the Rings Tools" "Object_Merge"
			)
		on b_three pressed do
			(
			macros.run "Lord of the Rings Tools" "Pose_Recorder"
			)
		on b_four pressed do
			(
			macros.run "Lord of the Rings Tools" "Pose_Reader"
			)
		on b_five pressed do
			(
			macros.run "Lord of the Rings Tools" "Aligner"
			)
		on b_six pressed do
			(
			macros.run "Lord of the Rings Tools" "LorR_Anim_Building"
			)
		on b_seven pressed do
			(
			macros.run "Lord of the Rings Tools" "LotR_Texture_Animation_Grid"
			)
		on b_eight pressed do
			(
			macros.run "Lord of the Rings Tools" "LotR_Batch_Export"
			)
		on b_nine pressed do
			(
			macros.run "Lord of the Rings Tools" "LotR_W3D2Skin"
			)
		on b_ten pressed do
			(
			macros.run "Lord of the Rings Tools" "LotR_Skin2W3D"
			)

	)
	
NewFloater = newRolloutFloater "LotR Tools" 150 400
addRollout LotrFloater NewFloater
cui.RegisterDialogBar NewFloater style: #(#cui_dock_vert, #cui_floatable, #cui_handles)

)

