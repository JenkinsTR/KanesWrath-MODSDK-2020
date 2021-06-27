macroScript LorR_Anim_Building

	category:"Lord of the Rings Tools"
	toolTip:"Building Animator"
	icon:#("LotR",4)
(


if $1_A == null then
	(
	messageBox " Object 1_A is missing "
	)
	else
	(
	if $1_B == null then
		(
		messageBox " Object 1_B is missing "
		)
		else
		(
		if $1_C == null then
			(
			messageBox " Object 1_C is missing "
			)
			else
			(
			if $1_D == null then
				(
				messageBox " Object 1_D is missing "
				)
				else
				(

				-- set animation range
				tempanimstart = animationRange.start
				tempanimend = animationRange.end
				tempanimnow = currentTime

				animationRange = interval 0 1000
				max time start
			
				-- animate $1_A
				select $1_A
				
				a_dist = -1 *(($1_A.max.z - $1_A.min.z) + 2)
				b_dist = -1 *(($1_B.max.z - $1_B.min.z) + 2)
				c_dist = -1 *(($1_C.max.z - $1_C.min.z) + 2)
				d_dist = -1 *(($1_D.max.z - $1_D.min.z) + 2)
				
				animate on
				(
				at time 0
					$1_A.pos.z = a_dist
				at time 26
					$1_A.pos.z = a_dist
				at time 132
					$1_A.pos.z = 0
				at time 433
					$1_A.pos.z = 0
				at time 511
					$1_A.pos.z = a_dist
					
				at time 0
					$1_A.visibility = True
				at time 432
					$1_A.visibility = True
				at time 433
					$1_A.visibility = False
				)
				
				-- animate $1_B
				select $1_B
				animate on
				(
				at time 0
					$1_B.pos.z = b_dist
				at time 248
					$1_B.pos.z = b_dist
				at time 432
					$1_B.pos.z = 0
				at time 636
					$1_B.pos.z = 0
				at time 703
					$1_B.pos.z = b_dist
					
				at time 0
					$1_B.visibility = True
				at time 636
					$1_B.visibility = True
				at time 637
					$1_B.visibility = False
				)
				
				-- animate $1_C
				select $1_C
				animate on
				(
				at time 0
					$1_C.pos.z = c_dist
				at time 487
					$1_C.pos.z = c_dist
				at time 636
					$1_C.pos.z = 0
				at time 894
					$1_C.pos.z = 0
				at time 974
					$1_C.pos.z = c_dist
					
				at time 0
					$1_C.visibility = True
				at time 894
					$1_C.visibility = True
				at time 895
					$1_C.visibility = False
				)
				
				
				-- animate $1_D
				select $1_D
				animate on
				(
				at time 0
					$1_D.pos.z = d_dist
				at time 738
					$1_D.pos.z = d_dist
				at time 894
					$1_D.pos.z = 0
				)
				
				clearSelection()				
				
				
				)
			)
		)
	)


)
