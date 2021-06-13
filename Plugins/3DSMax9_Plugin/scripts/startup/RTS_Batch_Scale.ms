macroScript RTS_Batch_Scale

	category:"RTS Tools"
	toolTip:"Batch Scale"
	icon:#("RTS",4)
(


fn ScaleAllTheObjects scale_me =
(
	scale_this_much = [scale_me , scale_me ,scale_me ]
-- get animation time range of (everything must be scaled at time 0)
	tempanimstart = animationRange.start
	tempanimend = animationRange.end
	tempanimnow = currentTime
	animationRange = interval 0 tempanimend
	max time start
	
-- find parents of all objects
	max unhide all
	allobjects = $*
	topnodes = for obj in allobjects 
		where (obj.parent == undefined) collect obj
		select topnodes
		
-- scale the nodes by 80%
	for obj in topnodes do
		(
		--print obj.scale
		--print obj.pos	

		-- removed for link constraint problem
		--obj.scale = (obj.scale * [0.8,0.8,0.8])
		

			if ((obj.controller as string) == "Controller:Link_Constraint") then 
				(
				--print ("link constraint " + (obj.name  as string))
				if ((obj.controller.getNumTargets()) > 0) then
					(
					if ((obj.controller.getFrameNo 1) <= 0) then
						(
						newtarget = (obj.controller.getNode 1) 
						if ((newtarget as string)== "undefined") then 
								(
								
								obj.scale = (obj.scale * scale_this_much)
								
								-- object is linked constrained to the world
								print ("link constraint to world" + (obj.name  as string))
							
								if (obj.pos.isAnimated == False) then
									(
									obj.pos = (obj.pos * scale_this_much)
									)
									else
									(
									numobjkeys = (numKeys obj.pos.controller)
									for k=1 to numobjkeys do 
										(
										oldkey =  (at time (getKeyTime obj.pos.controller k) obj.pos.controller.value)
										print oldkey
										newkey = (oldkey * scale_this_much)
										print newkey
										at time (getKeyTime obj.pos.controller k) animate on obj.pos.controller.value = newkey
										)
									)
								)
								else
								(
								print ("link constraint to another object" + (obj.name  as string))
								-- object is linked constrained to another object... don't scale the keyframes
								--obj.pos = (obj.pos * [0.8,0.8,0.8])
								)
						) 
					)
				)
				else
				(
				obj.scale = (obj.scale * scale_this_much)
				-- object is not link constrained at all check to see if objects is animated then scale the keyframes or scale the object		
				if (obj.pos.isAnimated == False) then
					(
					obj.pos = (obj.pos * scale_this_much)
					)
					else
					(
					numobjkeys = (numKeys obj.pos.controller)
					for k=1 to numobjkeys do 
						(
						oldkey =  (at time (getKeyTime obj.pos.controller k) obj.pos.controller.value)
						print oldkey
						newkey = (oldkey * scale_this_much)
						print newkey
						at time (getKeyTime obj.pos.controller k) animate on obj.pos.controller.value = newkey
						)
					)

				)

		)
		
-- reset animation time range
	max time end
	animationRange = interval tempanimstart tempanimend	
	sliderTime = tempanimnow
	
)



rollout stuff "Batch Scale"
(
label lbl04 ""
checkbox SubDir "Export Sub-directories"
label lbl07 ""
spinner scaleamount "Scale %" range:[1,200,80] type:#float align:#center
label lbl08 ""
button OK "OK" width:50 align:#center

on OK pressed do
	(
	--this_much = [(scaleamount.value/100),(scaleamount.value/100),(scaleamount.value/100)]
	this_much = (scaleamount.value/100)
	if 	(SubDir.checked == TRUE ) then
		(
		DestroyDialog stuff	
		-- this will export all the sub directories
		-- the user will have to choose a max file in the
		-- main directory but it will not export any of the
		-- max files in that directory
	
		directory = getSavePath()
	
		if directory == undefined then
			(
			print "operation canceled"
			)
			else
			(
			fileext = "\*.max"
			
			temp = directory+fileext
			
			directories = getDirectories (directory+"\*")
			print directories[2]
			n=0
			for d in directories do
				(
				n=n+1
				temp = (getFilenamePath directories[n])+fileext
				print temp
		
				files = getFiles temp
				
				for f in files do 
					(
					loadMaxFile f
					print f
					ScaleAllTheObjects(this_much)
					max file save
					)
				)
				
			temp = directory+fileext
			files = getFiles temp
			for f in files do 
				(
				loadMaxFile f
				print f
				ScaleAllTheObjects(this_much)
				max file save
				
				)
			)
		)
		else
			(
			DestroyDialog stuff
			directory = getSavePath()
			
			if directory == undefined then
				(
				print "operation canceled"
				)
				else
				(
				fileext = "\*.max"
				temp = directory+fileext
				files = getFiles temp
				for f in files do 
					(
					loadMaxFile f
					print f
					ScaleAllTheObjects(this_much)
					max file save	
					)
				)
			)
		
	)
)


Doit = queryBox "WARNING: This script will scale all the files in a directory. Please check your work when the script finishes. Do you want to Continue ?"
if Doit == True Then CreateDialog stuff width:200 height:130

)

