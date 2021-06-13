macroScript Object_Merge

	category:"Lord of the Rings Tools"
	toolTip:"Batch Object Merge"
	icon:#("LotR",5)
(


-----------------

filepathname = getOpenFileName types:"3ds max(*.max)"
fileext = "*.max"
fname = getFilenameFile filepathname 
dirpath = getFilenamePath filepathname
mergefilename = dirpath+"TempMerge.max"

allfiles = getFiles (dirpath+fname+"*.max")

-----------------

for x = 1 to allfiles.count do
	(
	currentfilepathname = allfiles[x]
	currentfname = getFilenameFile currentfilepathname 
	currentdirpath = getFilenamePath currentfilepathname 
	if (currentfname != fname ) then
		(
	
	loadMaxFile mergefilename 

-- get animation time range of tempmerge.max (everything must be linked at time 0)
	tempanimstart = animationRange.start
	tempanimend = animationRange.end
	tempanimnow = currentTime
	animationRange = interval 0 tempanimend
	max time start

	clearSelection
	newobjs = for objs in $* 
		where (getUserPropBuffer objs) == "new" collect objs
	selectMore newobjs

-- get parents of new bones
	newparents = #()
	for n in newobjs do
		(
		if (n.parent != undefined) then
			(
			append newparents n.parent.name
			)
			else
			(
			append newparents ""
			)
		)

-- get position of new bones
	newpos = for n in newobjs
		where (n.name !="") collect n.transform

-- get name <string> for new bones
	newnames = for n in newobjs 
		where (n.name !="") collect n.name

-- set animation time range
	max time end
	animationRange = interval tempanimstart tempanimend	
	sliderTime = tempanimnow

	loadMaxFile currentfilepathname 

-- get animation time range of new file (everything must be linked at time 0)
	tempanimstart = animationRange.start
	tempanimend = animationRange.end
	tempanimnow = currentTime
	animationRange = interval 0 tempanimend
	max time start



	
-- merge in new objects	
	mergeMAXFile mergefilename newnames #select

	print "arrays"
	print newobjs
	print newparents
	print newpos
	print newnames


--rebuild newobjs nodes from names <string>
	for n = 1 to newnames.count do
		(
		tempnewobjs = for d in $*
			where (d.name == newnames[n]) collect d
		print tempnewobjs 
		insertItem tempnewobjs newobjs n
		deleteItem newobjs (n+1)
		--join newobjs tempnewobjs 
		)
	print newobjs


-- reposition all the new objects
	for n = 1 to newobjs.count do
		(
		newobjs[n].transform = newpos[n]
		)

-- link new objects to old parents
	for n = 1 to newobjs.count do
		(
		if (newparents[n] != "") then
			(
			-- find the parent node by the "name" <string>
			tempparents = for c in $*
				where (c.name == newparents[n]) collect c
			newobjs[n].parent = tempparents[1] 
			)
		)




-- temporary crap		
--$ArrowNock.controller.addTarget $B_Crsbow 0
--environmentMap = undefined



-- set animation time range of new file
	max time end
	animationRange = interval tempanimstart tempanimend	
	sliderTime = tempanimnow

-- save the file
	savemaxfile currentfilepathname 
		)
	)
)










