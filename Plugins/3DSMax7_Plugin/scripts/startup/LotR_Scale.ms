macroScript LotR_Scale

	category:"Lord of the Rings Tools"
	toolTip:"Scale"
	icon:#("LotR",4)
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
	print topnodes
	
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



rollout stuff "Scale"
(
label lbl04 ""
spinner scaleamount "Scale %" range:[1,200,80] type:#float align:#center
label lbl08 ""
button OK "OK" width:50 align:#center

on OK pressed do
	(
	--this_much = [(scaleamount.value/100),(scaleamount.value/100),(scaleamount.value/100)]
	this_much = (scaleamount.value/100)

			DestroyDialog stuff
			ScaleAllTheObjects(this_much)
	)
)

CreateDialog stuff width:200 height:130

)

