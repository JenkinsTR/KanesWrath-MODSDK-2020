<?xml version="1.0" encoding="utf-8" ?>
<AssetDefinition xmlns="uri:thundermods.net:SAGE:WrathEdXML:AssetDefinition">

	<EnumAsset
		id="Bool">
		<Entry>true</Entry>
		<Entry>false</Entry>
	</EnumAsset>

	<Asset
		id="Parameter">
		<Entry
			id="name"
			AssetType="Identifier"
			IsAttribute="true" />
		<Entry
			id="type"
			AssetType="ParamType"
			IsAttribute="true" />
		<Entry
			id="const"
			AssetType="Bool"
			IsAttribute="true"
			Default="false" />
		<Entry
			id="modifier"
			AssetType="Modifier"
			IsAttribute="true"
			Default="" />
		<Entry
			id="defaultValue"
			AssetType="IdentifierOrNothing"
			IsAttribute="true"
			Default="" />
	</Asset>

	<Asset
		id="Function">

</AssetDefinition>