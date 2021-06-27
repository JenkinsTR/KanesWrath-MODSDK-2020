<?xml version="1.0" encoding="utf-8" ?>
<AssetDefinition xmlns="uri:thundermods.net:SAGE:WrathEdXML:AssetDefinition">

	<Asset
		id="UnknownPlayerClassTemplateAsset1">
		<Entry
			id="Unknown1"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown2"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown3"
			AssetType="SageReal"
			IsAttribute="true" />
		<Entry
			id="Unknown4"
			AssetType="SageReal"
			IsAttribute="true" />
	</Asset>

	<Asset
		id="UnknownPlayerClassTemplateAsset2a">
		<Entry
			id="Unknown1"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown2"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown3"
			AssetType="SageInt"
			IsAttribute="true" />
	</Asset>

	<Asset
		id="UnknownPlayerClassTemplateAsset2">
		<EntryList
			id="Unknown1"
			AssetType="UnknownPlayerClassTemplateAsset2a"
			MinLength="0"
			MaxLength="0" />
		<EntryList
			id="Unknown2AvailablePower"
			AssetType="SpecialPowerTemplateWeakRef"
			MinLength="0"
			MaxLength="0" />
	</Asset>

	<GameAsset
		id="PlayerClassTemplate"
		TypeHash="3930811130">
		<Entry
			id="Name"
			AssetType="String"
			IsAttribute="true" />
		<Entry
			id="Unknown1UISlot"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Side"
			AssetType="FactionType"
			IsAttribute="true" />
		<EntryWeakReference
			id="PlayerThechDependency"
			AssetType="PlayerTechDependencyGroup"
			IsAttribute="true" />
		<Entry
			id="Unknown4"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown5"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown6"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown7"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown8"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown9"
			AssetType="SageInt"
			IsAttribute="true" />
		<EntryRelocation
			id="PlayerThreatTracker"
			AssetType="PlayerThreatTrackerTemplateRef" />
		<EntryList
			id="Unknown11"
			AssetType="UnknownPlayerClassTemplateAsset1"
			MinLength="0"
			MaxLength="0" />
		<Entry
			id="Unknown13"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown14"
			AssetType="SageInt"
			IsAttribute="true" />
		<EntryList
			id="Unknown15InitialObject"
			AssetType="BaseAssetWeakRef"
			MinLength="0"
			MaxLength="0" />
		<EntryList
			id="Unknown16AvailableUpgrade"
			AssetType="UpgradeTemplateWeakRef"
			MinLength="0"
			MaxLength="0" />
		<Entry
			id="Unknown18"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown19"
			AssetType="SageInt"
			IsAttribute="true" />
		<EntryList
			id="Unknown20InitialUpgrade"
			AssetType="UpgradeTemplateWeakRef"
			MinLength="0"
			MaxLength="0" />
		<Entry
			id="Unknown21"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown22"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown23"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown24"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown25"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown26"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown27"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown28"
			AssetType="SageInt"
			IsAttribute="true" />
		<Entry
			id="Unknown29"
			AssetType="SageInt"
			IsAttribute="true" />
		<EntryRelocation
			id="Unknown30SupportPowers"
			AssetType="UnknownPlayerClassTemplateAsset2" />
		<Entry
			id="Unknown31RequiresPower"
			AssetType="SageBool"
			IsAttribute="true" />
		<Entry
			id="fill"
			AssetType="Byte"
			IsVoid="true" />
	</GameAsset>

</AssetDefinition>