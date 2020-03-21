<?xml version="1.0" encoding="utf-8" ?>
<AssetDefinition xmlns="uri:thundermods.net:SAGE:WrathEdXML:AssetDefinition">

	<Asset
		id="StringAndHashType">
		<Entry
			id="Hash"
			AssetType="SageUnsignedInt"
			IsAttribute="true" />
		<Entry
			id="Text"
			AssetType="String"
			IsAttribute="true" />
	</Asset>

	<GameAsset
		id="StringHashTable"
		TypeHash="3959342059">
		<EntryInheritance
			id="base"
			AssetType="BaseAssetType" />
		<Entry
			id="Unknown0"
			AssetType="SageUnsignedInt"
			IsAttribute="true" />
		<EntryList
			id="StringAndHash"
			AssetType="StringAndHashType"
			MinLength="0"
			MaxLength="0" />
	</GameAsset>

</AssetDefinition>