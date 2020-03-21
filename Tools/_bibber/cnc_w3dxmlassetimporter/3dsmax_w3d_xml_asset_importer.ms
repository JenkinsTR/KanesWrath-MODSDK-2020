-- ----------------------------------------------------------------------------------- --
--                                                                                     --
--  3DS Max C&C W3D XML Asset Importer                                                 --
--    Version 1.1.0.3                                                                  --
--                                                                                     --
-- ----------------------------------------------------------------------------------- --
--                                                                                     --
--  Supports: Basic Meshes, Influenced Meshes, UVW Mapping, OBBoxes, Pivots, Materials --
--  Working on: wwSkin                                                                 --
--                                                                                     --
-- ----------------------------------------------------------------------------------- --
--                                                                                     --
--  Scripted by: Asuka- & Modified by: Bibber                                          --
--                                                                                     --
-- ----------------------------------------------------------------------------------- --



utility w3d_xml_asset_importer "W3D XML Asset Importer"
(
	-- Shader Search Paths --
	global shaderSearchPaths = #
	(
		"$maps\fx",
		"$maps\fx\ra3",
		"$maps\fx\cnc3"
	)
	
	-- Texture Search Paths --
	global textureSearchPaths = #
	(
		"$maps"
	)
	
	
	
	--------------------------------
	-- DO NOT EDIT ANYTHING BELOW --
	--------------------------------
	
	-- Global Variables --
	global shaderInitPath = "$maps\fx"
	global textureInitPath = "$maps"
	
	global captionShaderPath = "Select Shader Directory:"
	global captionTexturePath = "Select Texture Directory:"
	
	global captionImportSKN = "Select Model (W3DContainer):"
	global captionImportSKL = "Select Skeleton (W3DHierarchy):"
	global captionImportMesh = "Select Simple Mesh (W3DMesh):"
	global typesImport = "W3D XML Asset (*.W3X)|*.W3X|All Files (*.*)|*.*"
	
	global shaderPath = ""
	global texturePath = ""
	
	global w3dHierarchy
	global w3dCollisionBoxes = #()
	global w3dMeshs = #()
	global w3dContainer
	
	global maxPivots = #()
	global maxOBBoxes = #()
	global maxMeshes = #()
	global maxMaterials
	
	
	
	-- User Interface --
	group "Optional Settings"
	(
		edittext	editShaderPath		"Shaders:"					align:#left width:136
		button		buttonShaderPath	"Select Shader Directory"	align:#left width:136
		edittext	editTexturePath		"Textures:"					align:#left offset:[0, 5]
		button		buttonTexturePath	"Select Texture Directory"	align:#left width:136
		spinner		spinnerScale		"Scale Pivots by:"			align:#left width:126 range:[0.1, 5, 1] offset:[0, 5]
		spinner		spinnerMaterials	"Material Slots used:"		align:#left width:104 type:#integer range:[1, 24, 1]
	)
	
	group "Import"
	(
		button		buttonImportHierarchicalModel	"Import Hierarchical Model"	align:#left width:136
		button		buttonImportSkeleton			"Import Skeleton"			align:#left width:136
		button		buttonImportSimpleMesh			"Import Simple Mesh"		align:#left width:136
	)
	
	group "Advanced"
	(
		button		buttonToggleLinks	"Toggle Show Links"	align:#left width:136
	)
	
	group "Information"
	(
		listbox		missingShaders		"Missing Shaders:"	readOnly:true height:3
		listbox		missingTextures		"Missing Textures:"	readOnly:true offset:[0, 5] height:5
	)
	
	
	
	-- Structures --
	struct helperPivot
	(
		position,
		rotation
	)
	
	struct w3xPivot
	(
		name,
		parent,
		translation,
		rotation
	)
	
	struct w3xHierarchy
	(
		id,
		pivots = #()
	)
	
	struct w3xCollisionBox
	(
		center,
		extent
	)
	
	struct w3xShaderValue
	(
		name,
		value
	)
	
	struct w3xShader
	(
		shaderName,
		techniqueName,
		techniqueIndex,
		textures = #(),
		floats = #(),
		ints = #(),
		bools = #()
	)
	
	struct w3xMesh
	(
		id,
		hidden,
		castShadow,
		geometryType,
		sortLevel,
		vertices = #(),
		normals = #(),
		tangents = #(),
		binormals = #(),
		vertexColors = #(),
		texCoords = #(),
		boneInfluences = #(),
		shadeIndices = #(),
		triangles = #(),
		shader
	)
	
	struct w3xRenderObject
	(
		type,
		name,
		object
	)
	
	struct w3xSubObject
	(
		id,
		boneIndex,
		renderObject
	)
	
	struct w3xContainer
	(
		id,
		hierarchy,
		subObjects = #()
	)
	
	
	
	-- Functions --
	function addListItem list item =
	(
		local newItem = true
		
		if (list.items.count > 0) then
		(
			for i = 1 to list.items.count do
			(
				if ((list.items[i] as string) == item) then
				(
					newItem = false
				)
			)
		)
	
		if (newItem) then
		(
			list.items = append list.items (item)
		)
	)
	
	function getPivots pivotNum fileI tagEnd =
	(
		local pivotStart = filePos fileI
		skipToString fileI "Name"
		skipToString fileI "\""
		local name = readDelimitedString fileI "\""
		seek fileI pivotStart
		skipToString fileI "Parent"
		skipToString fileI "\""
		local parent = readDelimitedString fileI "\"" as integer
		
		skipToString fileI "<Translation"
		tStart = filePos fileI
		skipToString fileI "X"
		skipToString fileI "\""
		local x = readDelimitedString fileI "\"" as float
		seek fileI tStart
		skipToString fileI "Y"
		skipToString fileI "\""
		local y = readDelimitedString fileI "\"" as float
		seek fileI tStart
		skipToString fileI "Z"
		skipToString fileI "\""
		local z = readDelimitedString fileI "\"" as float
		local translation = point3 x y z

		seek fileI pivotStart
		skipToString fileI "<Rotation"
		rStart = filePos fileI
		skipToString fileI "X"
		skipToString fileI "\""
		x = readDelimitedString fileI "\"" as float
		seek fileI rStart
		skipToString fileI "Y"
		skipToString fileI "\""
		y = readDelimitedString fileI "\"" as float
		seek fileI rStart
		skipToString fileI "Z"
		skipToString fileI "\""
		z = readDelimitedString fileI "\"" as float
		seek fileI rStart
		skipToString fileI "W"
		skipToString fileI "\""
		local w = readDelimitedString fileI "\"" as float
		local rotation = quat x y z w
		w3dHierarchy.pivots[pivotNum] = w3xPivot name parent translation rotation

		pivotNum = pivotNum + 1
		
		if ((skipToString fileI "<Pivot" != undefined) and (filePos fileI < tagEnd)) then 
		(
			getPivots pivotNum fileI tagEnd
		)
	)
	
	function drawHierarchy p =
	(
		maxPivots[maxPivots.count + 1] = sphere name:w3dHierarchy.pivots[p].name radius:spinnerScale.value segs:4 renderable:false wirecolor:[0,128,0]
		wwSetExportBoneFlag maxPivots[maxPivots.count] true
		wwSetExportGeoFlag maxPivots[maxPivots.count] false
		wwSetShadowFlag maxPivots[maxPivots.count] false
		
		if (w3dHierarchy.pivots[p].parent > 0) then
		(
			maxPivots[maxPivots.count].parent = maxPivots[w3dHierarchy.pivots[p].parent]
		)
	)
	
	function buildHierarchy fileI =
	(
		maxPivots = #()
		w3dHierarchy = w3xHierarchy id:"none"
		
		seek fileI 0
		skipToString fileI "<W3DHierarchy"
		skipToString fileI "id"
		skipToString fileI "\""
		w3dHierarchy.id = readDelimitedString fileI "\""
		
		local fileP = filePos fileI
		skipToString fileI "</W3DHierarchy"
		local tagEnd = filePos fileI
		seek fileI fileP
		
		if ((skipToString fileI "<Pivot" != undefined) and (filePos fileI < tagEnd)) then 
		(
			getPivots 1 fileI tagEnd
		)
		
		if (w3dHierarchy.pivots.count > 1) then
		(
			for p = 2 to w3dHierarchy.pivots.count do (drawHierarchy p)
		)
	)
	
	function searchMaterialFile searchPath searchPaths searchFile defaultFile missingList =
	(
		local resultFile = ""
		local searchCheck = searchPath + "\\" + searchFile
		
		if ((searchPath != "") and (doesFileExist searchCheck)) then
		(
			resultFile = searchCheck
		)
		else
		(
			if (searchPaths.count > 0) then
			(
				for i = 1 to searchPaths.count do
				(
					if (resultFile == "") then
					(
						searchCheck = searchPaths[i] + "\\" + searchFile
						
						if (doesFileExist searchCheck) then
						(
							resultFile = searchCheck
						)
					)
				)
			)
		)
		
		if (resultFile == "") then
		(
			if (missingList != undefined) then
			(
				addListItem missingList searchFile
			)
			
			resultFile = defaultFile
		)
		
		return resultFile
	)
	
	function getShaderParams fileI meshEnd =
	(
		local shaderMaterial = DxMaterial technique:0
		local tagStart = filePos fileI
		
		if ((skipToString fileI "<FXShader" != undefined) and (filePos fileI < meshEnd)) then
		(
			tagStart = filePos fileI
			skipToString fileI "</FXShader"
			local shaderEnd = filePos fileI
			seek fileI tagStart
			
			skipToString fileI "ShaderName"
			skipToString fileI "\""
			local shaderFileName = readDelimitedString fileI "\""
			shaderMaterial.effectfile = searchMaterialFile shaderPath shaderSearchPaths shaderFileName "$maps\fx\default.fx" missingShaders
			seek fileI tagStart
			
			if ((skipToString fileI "TechniqueIndex" != undefined) and (filePos fileI < meshEnd)) then
			(
				skipToString fileI "\""
				shaderMaterial.technique = readDelimitedString fileI "\"" as Integer
			)
		
			seek fileI tagStart
		
			local shaderParams = getPropNames shaderMaterial
			local setting
			local tagEnd
			local textureFile
			
			while (filePos fileI < shaderEnd) do
			(
				fileP = filePos fileI
				setting = w3xShaderValue "none"
			
				if (skipToString fileI "<Texture" == undefined) then
				(
					seek fileI fileP
					if (skipToString fileI "<Float" == undefined) then
					(
						seek fileI fileP
						if (skipToString fileI "<Int" == undefined) then
						(
							seek fileI fileP
							if (skipToString fileI "<Bool" != undefined) then
							(
								fileP = filePos fileI
								skipToString fileI "</Bool"
								tagEnd = filePos fileI
								seek fileI fileP
								
								skipToString fileI "Name"
								skipToString fileI "\""
								setting.name = readDelimitedString fileI "\""
								skipToString fileI "<Value"
								skipToString fileI ">"
								setting.value = readDelimitedString fileI "<"
								
								if (setting.value == "true") then
								(
									setting.value = true
								)
								else
								(
									setting.value = false
								)

								for prop = 1 to shaderParams.count do
								(
									if ((shaderParams[prop] as string) == setting.name) then
									(
										
										setProperty shaderMaterial shaderParams[prop] setting.value
									)
								)
								
								seek fileI tagEnd
							)
						)
						else
						(
							fileP = filePos fileI
							skipToString fileI "</Int"
							tagEnd = filePos fileI
							seek fileI fileP
							
							skipToString fileI "Name"
							skipToString fileI "\""
							setting.name = readDelimitedString fileI "\""
							skipToString fileI "<Value"
							skipToString fileI ">"
							setting.value = readDelimitedString fileI "<" as integer
							
							for prop = 1 to shaderParams.count do
							(
								if ((shaderParams[prop] as string) == setting.name) then
								(
									setProperty shaderMaterial shaderParams[prop] setting.value
								)
							)
							
							seek fileI tagEnd
						)
					)
					else
					(
						fileP = filePos fileI
						skipToString fileI "</Float"
						tagEnd = filePos fileI
						seek fileI fileP
						
						skipToString fileI "Name"
						skipToString fileI "\""
						setting.name = readDelimitedString fileI "\""
						
						skipToString fileI "<Value"
						skipToString fileI ">"
						setting.value = #(readDelimitedString fileI "<" as float, 0, 0, 0)
						
						if ((skipToString fileI "<Value" == undefined) or (filePos fileI >= tagEnd)) then
						(
							for prop = 1 to shaderParams.count do
							(
								if ((shaderParams[prop] as string) == setting.name) then
								(
									setProperty shaderMaterial shaderParams[prop] setting.value[1]
								)
							)
						)
						else
						(
							skipToString fileI ">"
							setting.value[2] = readDelimitedString fileI "<" as float
							
							if ((skipToString fileI "<Value" != undefined) and (filePos fileI < tagEnd)) then
							(
								skipToString fileI ">"
								setting.value[3] = readDelimitedString fileI "<" as float
								
								if ((skipToString fileI "<Value" != undefined) and (filePos fileI < tagEnd)) then
								(
									skipToString fileI ">"
									setting.value[4] = readDelimitedString fileI "<" as float
								)
							)
						
							for prop = 1 to shaderParams.count do
							(
								if ((shaderParams[prop] as string) == setting.name) then
								(
									setProperty shaderMaterial shaderParams[prop] (point4 setting.value[1] setting.value[2] setting.value[3] setting.value[4])
								)
							)
						)
						
						seek fileI tagEnd
					)
				)
				else
				(
					fileP = filePos fileI
					skipToString fileI "</Texture"
					tagEnd = filePos fileI
					seek fileI fileP
				
					skipToString fileI "Name"
					skipToString fileI "\""
					setting.name = readDelimitedString fileI "\""
					skipToString fileI "<Value"
					skipToString fileI ">"
					setting.value = readDelimitedString fileI "<"
					textureFile = searchMaterialFile texturePath textureSearchPaths (setting.value + ".tga") "" undefined
					
					if (textureFile == "") then
					(
						textureFile = searchMaterialFile texturePath textureSearchPaths (setting.value + ".dds") "" missingTextures
					)
					
					if (textureFile != "") then
					(
						for prop = 1 to shaderParams.count do
						(
							if ((shaderParams[prop] as string) == setting.name) then
							(
								setProperty shaderMaterial shaderParams[prop] (openBitMap textureFile)
							)
						)
					)
					
					seek fileI tagEnd
				)
			)
			
			missingShaders.items = sort missingShaders.items
			missingTextures.items = sort missingTextures.items
		)
		
		if (maxMaterials <= 24) then
		(
			setMeditMaterial maxMaterials shaderMaterial
			maxMaterials = maxMaterials + 1
		)
	)
	
	function getVertices fileI meshEnd =
	(
		local verts = #()
		local tagStart = filePos fileI
		
		if ((skipToString fileI "<Vertices" != undefined) and (filePos fileI < meshEnd)) then
		(
			local x, y, z
			tagStart = filePos fileI
			skipToString fileI "</Vertices"
			local tagEnd = filePos fileI
			seek fileI tagStart
			local vStart
			
			while (((skipToString fileI "<V") != undefined) and (filePos fileI < tagEnd)) do
			(
				vStart = filePos fileI
				skipToString fileI "X"
				skipToString fileI "\""
				x = readDelimitedString fileI "\"" as float
				seek fileI vStart
				skipToString fileI "Y"
				skipToString fileI "\""
				y = readDelimitedString fileI "\"" as float
				seek fileI vStart
				skipToString fileI "Z"
				skipToString fileI "\""
				z = readDelimitedString fileI "\"" as float
				verts[verts.count + 1] = point3 x y z
			)
		)
		
		return verts
	)

	function getTexCoords fileI meshEnd =
	(
		local tverts = #()
		local tagStart = filePos fileI
		
		if ((skipToString fileI "<TexCoords" != undefined) and (filePos fileI < meshEnd)) then
		(
			local x, y
			tagStart = filePos fileI
			skipToString fileI "</TexCoords"
			local tagEnd = filePos fileI
			seek fileI tagStart
			local tStart
			
			while (((skipToString fileI "<T") != undefined) and (filePos fileI < tagEnd)) do
			(
				tStart = filePos fileI
				skipToString fileI "X"
				skipToString fileI "\""
				x = readDelimitedString fileI "\"" as float
				seek fileI tStart
				skipToString fileI "Y"
				skipToString fileI "\""
				y = readDelimitedString fileI "\"" as float
				tverts[tverts.count + 1] = point3 x y 0
			)
		)
		
		return tverts
	)

	function getBoneInfluences fileI meshEnd =
	(
		local binfluences = #()
		local tagStart = filePos fileI
		
		if ((skipToString fileI "<BoneInfluences" != undefined) and (filePos fileI < meshEnd)) then
		(
			local x, y
			tagStart = filePos fileI
			skipToString fileI "</BoneInfluences"
			local tagEnd = filePos fileI
			seek fileI tagStart
			local iStart
			
			while (((skipToString fileI "<I") != undefined) and (filePos fileI < tagEnd)) do
			(
				iStart = filePos fileI
				skipToString fileI "Bone"
				skipToString fileI "\""
				x = readDelimitedString fileI "\"" as float
				seek fileI iStart
				skipToString fileI "Weight"
				skipToString fileI "\""
				y = readDelimitedString fileI "\"" as float
				binfluences[binfluences.count + 1] = point2 x y
			)
		)
		
		return binfluences
	)

	function getFaces fileI meshEnd =
	(
		local faces = #()
		local tagStart = filePos fileI
		
		if ((skipToString fileI "<Triangles" != undefined) and (filePos fileI < meshEnd)) then
		(
			local x, y, z
			tagStart = filePos fileI
			skipToString fileI "</Triangles"
			local tagEnd = filePos fileI
			seek fileI tagStart
		
			while ((skipToString fileI "<T" != undefined) and (filePos fileI < tagEnd)) do
			(
				skipToString fileI "<V"
				skipToString fileI ">"
				x = readDelimitedString fileI "<" as integer
				skipToString fileI "<V"
				skipToString fileI ">"
				y = readDelimitedString fileI "<" as integer
				skipToString fileI "<V"
				skipToString fileI ">"
				z = readDelimitedString fileI "<" as integer
				faces[faces.count + 1] = point3 (1 + x) (1 + y) (1 + z)
			)
		)
		
		return faces
	)
	
	function buildMesh fileI meshName meshId =
	(
		seek fileI 0
		local processMesh = true
		
		if (meshName == "") then
		(
			skipToString fileI "<W3DMesh"
			skipToString fileI "id"
			skipToString fileI "\""
			meshName = readDelimitedString fileI "\""
		)
		else
		(
			do
			(
				if (skipToString fileI "<W3DMesh" == undefined) then
				(
					processMesh = false
				)
				else
				(
					skipToString fileI "id"
					skipToString fileI "\""
				)
			)
			while ((readDelimitedString fileI "\"" != meshName) and (processMesh))
		)
		
		if (processMesh) then
		(
			local tagStart = filePos fileI
			skipToString fileI "</W3DMesh"
			local tagEnd = filePos fileI
			
			seek fileI tagStart
			local castShadow = "false"
			
			if ((skipToString fileI "CastShadow" != undefined) and (filePos fileI < tagEnd)) then
			(
				skipToString fileI "\""
				castShadow = readDelimitedString fileI "\""
			)
			
			seek fileI tagStart
			local v = getVertices fileI tagEnd
			seek fileI tagStart
			local t = getTexCoords fileI tagEnd
			seek fileI tagStart
			local inf = getBoneInfluences fileI tagEnd
			seek fileI tagStart
			local f = getFaces fileI tagEnd
			
			if (inf.count > 0) then
			(
				local boneInfluence
				
				for i = 1 to inf.count do
				(
					boneInfluence = bone pos:[0, 0, 0]
					
					if ((inf[i].x > 0) and (isValidNode maxPivots[inf[i].x])) then
					(
						boneInfluence.parent = maxPivots[inf[i].x]
					)
					
					in coordsys parent boneInfluence.pos = v[i]
					v[i] = boneInfluence.pos
					delete boneInfluence
				)
			)
			
			if (meshId != "") then
			(
				meshName = meshId 
			)
			
			maxMeshes[maxMeshes.count + 1] = mesh name:meshName vertices:v tverts:t faces:f
			wwSetExportBoneFlag maxMeshes[maxMeshes.count] false
			wwSetExportGeoFlag maxMeshes[maxMeshes.count] true
			
			if (castShadow == "true") then
			(
				wwSetShadowFlag maxMeshes[maxMeshes.count] true
			)
			else
			(
				wwSetShadowFlag maxMeshes[maxMeshes.count] false
			)
			
			update maxMeshes[maxMeshes.count]
			
			if (t.count > 0) then
			(
				buildTVFaces maxMeshes[maxMeshes.count]
				for i = 1 to maxMeshes[maxMeshes.count].numfaces do (setTVFace maxMeshes[maxMeshes.count] i (getFace maxMeshes[maxMeshes.count] i))
			)
			
			seek fileI tagStart
			getShaderParams fileI tagEnd
			maxMeshes[maxMeshes.count].material = getMeditMaterial (maxMaterials - 1)
		)
	)
	
	function getRenderObject objectNum fileI =
	(
		if (w3dContainer.subObjects[objectNum].renderObject.type == "CollisionBox") then
		(
			seek fileI 0
			local processOBBox = true
			
			do
			(
				if (skipToString fileI "<W3DCollisionBox" == undefined) then
				(
					processOBBox = false
				)
				else
				(
					skipToString fileI "id"
					skipToString fileI "\""
				)
			)
			while ((readDelimitedString fileI "\"" != w3dContainer.subObjects[objectNum].renderObject.name) and (processOBBox))
			
			if (processOBBox) then
			(
				local tagStart = filePos fileI
				skipToString fileI "<Center"
				local cStart = filePos fileI
				skipToString fileI "X"
				skipToString fileI "\""
				local x = readDelimitedString fileI "\"" as float
				seek fileI cStart
				skipToString fileI "Y"
				skipToString fileI "\""
				local y = readDelimitedString fileI "\"" as float
				seek fileI cStart
				skipToString fileI "Z"
				skipToString fileI "\""
				local z = readDelimitedString fileI "\"" as float
				local center = point3 x y z
			
				seek fileI tagStart
				skipToString fileI "<Extent"
				local eStart = filePos fileI
				skipToString fileI "X"
				skipToString fileI "\""
				x = readDelimitedString fileI "\"" as float
				seek fileI eStart
				skipToString fileI "Y"
				skipToString fileI "\""
				y = readDelimitedString fileI "\"" as float
				seek fileI eStart
				skipToString fileI "Z"
				skipToString fileI "\""
				z = readDelimitedString fileI "\"" as float
				local extent = point3 x y z
			
				center.z = center.z - extent.z
				w3dContainer.subObjects[objectNum].renderObject.object = w3xCollisionBox center extent
				maxOBBoxes[maxOBBoxes.count + 1] = box name:w3dContainer.subObjects[objectNum].id pos:w3dContainer.subObjects[objectNum].renderObject.object.center xray:true wirecolor:[0,255,255]
				maxOBBoxes[maxOBBoxes.count].width = 2 * abs(w3dContainer.subObjects[objectNum].renderObject.object.extent.x)
				maxOBBoxes[maxOBBoxes.count].length = 2 * abs(w3dContainer.subObjects[objectNum].renderObject.object.extent.y)
				maxOBBoxes[maxOBBoxes.count].height = 2 * abs(w3dContainer.subObjects[objectNum].renderObject.object.extent.z)
				wwSetExportBoneFlag maxOBBoxes[maxOBBoxes.count] false
				wwSetExportGeoFlag maxOBBoxes[maxOBBoxes.count] true
				wwSetShadowFlag maxOBBoxes[maxOBBoxes.count] false
			
				if (w3dContainer.subObjects[objectNum].boneIndex > 0) then
				(
					in coordsys world maxOBBoxes[maxOBBoxes.count].pos = maxOBBoxes[maxOBBoxes.count].pos + maxPivots[w3dContainer.subObjects[objectNum].boneIndex].pos
					
					if (maxOBBoxes[maxOBBoxes.count].name == maxPivots[w3dContainer.subObjects[objectNum].boneIndex].name) then
					(
						maxOBBoxes[maxOBBoxes.count].parent = maxPivots[w3dContainer.subObjects[objectNum].boneIndex].parent
						wwSetExportBoneFlag maxOBBoxes[maxOBBoxes.count] true
						
						for i = 1 to maxPivots.count do
						(
							if (maxPivots[i].parent == maxPivots[w3dContainer.subObjects[objectNum].boneIndex]) then
							(
								maxPivots[i].parent = maxOBBoxes[maxOBBoxes.count]
							)
						)
						
						delete maxPivots[w3dContainer.subObjects[objectNum].boneIndex]
						maxPivots[w3dContainer.subObjects[objectNum].boneIndex] = maxOBBoxes[maxOBBoxes.count]
					)
					else
					(
						maxOBBoxes[maxOBBoxes.count].parent = maxPivots[w3dContainer.subObjects[objectNum].boneIndex]
					)
				)
			)
		)
		if (w3dContainer.subObjects[objectNum].renderObject.type == "Mesh") then
		(
			buildMesh fileI w3dContainer.subObjects[objectNum].renderObject.name w3dContainer.subObjects[objectNum].id
			
			if (w3dContainer.subObjects[objectNum].boneIndex > 0) then
			(
				in coordsys world maxMeshes[maxMeshes.count].pos = maxMeshes[maxMeshes.count].pos + maxPivots[w3dContainer.subObjects[objectNum].boneIndex].pos
				
				if (maxMeshes[maxMeshes.count].name == maxPivots[w3dContainer.subObjects[objectNum].boneIndex].name) then
				(
					maxMeshes[maxMeshes.count].parent = maxPivots[w3dContainer.subObjects[objectNum].boneIndex].parent
					wwSetExportBoneFlag maxMeshes[maxMeshes.count] true
					
					for i = 1 to maxPivots.count do
					(
						if (maxPivots[i].parent == maxPivots[w3dContainer.subObjects[objectNum].boneIndex]) then
						(
							maxPivots[i].parent = maxMeshes[maxMeshes.count]
						)
					)
					
					delete maxPivots[w3dContainer.subObjects[objectNum].boneIndex]
					maxPivots[w3dContainer.subObjects[objectNum].boneIndex] = maxMeshes[maxMeshes.count]
				)
				else
				(
					maxMeshes[maxMeshes.count].parent = maxPivots[w3dContainer.subObjects[objectNum].boneIndex]
				)
			)
		)
	)

	function getSubObjects objectNum fileI tagEnd =
	(
		local subStart = filePos fileI
		skipToString fileI "SubObjectID"
		skipToString fileI "\""
		local id = readDelimitedString fileI "\""
		seek fileI subStart
		skipToString fileI "BoneIndex"
		skipToString fileI "\""
		local boneIndex = readDelimitedString fileI "\"" as integer

		local renderObject = w3xRenderObject type:"none" name:"none"
		skipToString fileI "<RenderObject"
		skipToString fileI "<"
		renderObject.type = readDelimitedString fileI ">"
		renderObject.name = readDelimitedString fileI "<"
		w3dContainer.subObjects[objectNum] = w3xSubObject id boneIndex renderObject

		getRenderObject objectNum fileI
		seek fileI subStart

		objectNum = objectNum + 1
		if ((skipToString fileI "<SubObject" != undefined) and (filePos fileI < tagEnd)) then
		(
			getSubObjects objectNum fileI tagEnd
		)
	)

	function buildContainer fileI =
	(
		maxOBBoxes = #()
		maxMeshes = #()
		w3dContainer = w3xContainer id:"none" hierarchy:w3dHierarchy
		
		seek fileI 0
		skipToString fileI "<W3DContainer"
		skipToString fileI "id"
		skipToString fileI "\""
		w3dContainer.id = readDelimitedString fileI "\""
		
		local fileP = filePos fileI
		skipToString fileI "</W3DContainer"
		local tagEnd = filePos fileI
		seek fileI fileP
		
		if ((skipToString fileI "<SubObject" != undefined) and (filePos fileI < tagEnd)) then 
		(
			getSubObjects 1 fileI tagEnd
		)
	)

	function evaluateHierarchy test =
	(
		local i = maxPivots.count
		
		while (i > 0) do
		(
			move maxPivots[i] w3dHierarchy.pivots[i + 1].translation
			rotate maxPivots[i] w3dHierarchy.pivots[i + 1].rotation
			i = i - 1
		)
	)
	
	function getPaths fileSKNName =
	(
		if (editTexturePath.text == "") then
		(
			textureSearchPaths[textureSearchPaths.count + 1] = getFilenamePath fileSKNName
		)
		else
		(
			texturePath = editTexturePath.text
		)
		
		if (editShaderPath.text != "") then
		(
			shaderPath = editShaderPath.text
		)
	)
	
	
	
	-- Button Pressed Events --
	on buttonImportSkeleton pressed do
	(
		local fileSKL = getOpenFileName caption:captionImportSKL types:typesImport
		
		if fileSKL != undefined then
		(
			fileSKLInput = openFile fileSKL
			buildHierarchy fileSKLInput
			close fileSKLInput
			evaluateHierarchy true
			max views redraw
		)
	)
	
	on buttonImportHierarchicalModel pressed do
	(
		local fileSKL = getOpenFileName caption:captionImportSKL types:typesImport
		
		if (fileSKL != undefined) then
		(
			local fileSKN = getOpenFileName caption:captionImportSKN types:typesImport
			
			if (fileSKN != undefined) then
			(
				missingShaders.items = #()
				missingTextures.items = #()
				maxMaterials = spinnerMaterials.value
				
				fileSKLInput = openFile fileSKL
				
				buildHierarchy fileSKLInput
				close fileSKLInput
				evaluateHierarchy true
				
				fileSKNInput = openFile fileSKN
				getPaths fileSKN
				
				buildContainer fileSKNInput
				close fileSKNInput
				max views redraw
				spinnerMaterials.value = maxMaterials
			)
		)
	)

	on buttonImportSimpleMesh pressed do
	(
		local fileSKN = getOpenFileName caption:captionImportMesh types:typesImport
		
		if (fileSKN != undefined) then
		(
			maxMeshes = #()	
			missingShaders.items = #()
			missingTextures.items = #()
			maxMaterials = spinnerMaterials.value
			
			fileSKNInput = openFile fileSKN
			getPaths fileSKN
			
			buildMesh fileSKNInput "" ""
			close fileSKNInput
			max views redraw
			spinnerMaterials.value = maxMaterials
		)
	)

	on buttonTexturePath pressed do
	(
		local InitDir = textureInitPath
		
		if (editTexturePath.text != "") then
		(
			InitDir = editTexturePath.text
		)
		
		local CheckDir = getSavePath caption:captionTexturePath initialDir:InitDir
		
		if (CheckDir != undefined) then 
		(
			editTexturePath.text = CheckDir
		)
	)
	
	on buttonShaderPath pressed do
	(
		local InitDir = shaderInitPath
		
		if (editShaderPath.text != "") then
		(
			InitDir = editShaderPath.text
		)
		
		local CheckDir = getSavePath caption:captionShaderPath initialDir:InitDir
		
		if (CheckDir != undefined) then 
		(
			editShaderPath.text = CheckDir
		)
	)
	
	on buttonToggleLinks pressed do
	(
		if (maxPivots.count > 0) then
		(
			for i = 1 to maxPivots.count do
			(
				if (isValidNode maxPivots[i]) then
				(
					maxPivots[i].showLinks = not maxPivots[i].showLinks
				)
			)
		)
	)
)



-- ----------------------------------------------------------------------------------- --