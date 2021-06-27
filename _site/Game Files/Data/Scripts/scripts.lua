--- define lua functions 
function NoOp(self, source)
end


function kill(self) -- Kill unit self.
	ExecuteAction("NAMED_KILL", self);
end

function RadiateUncontrollableFear( self )
	ObjectBroadcastEventToEnemies( self, "BeUncontrollablyAfraid", 350 )
end

function RadiateGateDamageFear(self)
	ObjectBroadcastEventToAllies(self, "BeAfraidOfGateDamaged", 200)
end

function OnNeutralGarrisonableBuildingCreated(self)
	ObjectHideSubObjectPermanently( self, "ARMOR", true )
end

function OnGDITechCenterCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_Boost", true )
	ObjectHideSubObjectPermanently( self, "UG_Mortar", true )
	ObjectHideSubObjectPermanently( self, "B_MortarRound_1", true )
	ObjectHideSubObjectPermanently( self, "UG_Rail", true )
	ObjectHideSubObjectPermanently( self, "UG_Scan", true )
	ObjectHideSubObjectPermanently( self, "UG_Adaptive", true )
	ObjectHideSubObjectPermanently( self, "UG_Adaptive01", true )
	ObjectHideSubObjectPermanently( self, "UG_Adaptive02", true )
	ObjectHideSubObjectPermanently( self, "UG_Adaptive04", true )	
end

function OnGDIMedicalBayCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_CompositeArmor", true )
	ObjectHideSubObjectPermanently( self, "UG_CompositeArmor02", true )
	ObjectHideSubObjectPermanently( self, "UG_GrenadeEMP", true )
	ObjectHideSubObjectPermanently( self, "UG_GrenadeEMP01", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector01", true )
	ObjectHideSubObjectPermanently( self, "UG_Injector", true )
	ObjectHideSubObjectPermanently( self, "UG_Armor", true )
end

function OnGDIAirfieldCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_Boost", true )
	ObjectHideSubObjectPermanently( self, "UG_Ceramic", true )
	ObjectHideSubObjectPermanently( self, "UG_Ceramic01", true )
	ObjectHideSubObjectPermanently( self, "UG_Hardpoints", true )
	ObjectHideSubObjectPermanently( self, "UG_Hardpoints01", true )
	ObjectHideSubObjectPermanently( self, "UG_Hardpoints02", true )
	ObjectHideSubObjectPermanently( self, "UG_Hardpoints03", true )
end


function OnGDIPowerPlantCreated(self)
	ObjectHideSubObjectPermanently( self, "Turbines", true )
	ObjectHideSubObjectPermanently( self, "TurbineGlows", true )
end

function OnGDICommandPostCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector01", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector02", true )
	ObjectHideSubObjectPermanently( self, "UG_StealthDetector03", true )
	ObjectHideSubObjectPermanently( self, "UG_Scan", true )
	ObjectHideSubObjectPermanently( self, "UG_Scan01", true )
	ObjectHideSubObjectPermanently( self, "UG_Scan02", true )
	ObjectHideSubObjectPermanently( self, "UG_APAmmo", true )
	ObjectHideSubObjectPermanently( self, "UG_APAmmo01", true )
	ObjectHideSubObjectPermanently( self, "UG_APAmmo02", true )
end

function OnGDIZoneTrooperCreated(self)
	ObjectHideSubObjectPermanently( self, "UGSCANNER", true )
	ObjectHideSubObjectPermanently( self, "UGJUMP", true )
	ObjectHideSubObjectPermanently( self, "UGINJECTOR", true )
end

function OnGDIPredatorCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAIL_01", true )
end

function OnGDIMammothCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAIL_01", true )
	ObjectHideSubObjectPermanently( self, "UGRAIL_02", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
end

function OnSteelTalonsMammothCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAIL_01", true )
	ObjectHideSubObjectPermanently( self, "UGRAIL_02", true )
	ObjectHideSubObjectPermanently( self, "UGRAILACCELERATOR_01", true )
	ObjectHideSubObjectPermanently( self, "UGRAILACCELERATOR_02", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
end

function OnGDIJuggernaughtCreated(self)
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_03", true )
	
end

function OnGDIWatchTowerCreated(self)
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )
	ObjectHideSubObjectPermanently( self, "UG_BASE", true )
	ObjectHideSubObjectPermanently( self, "B_UG_TURRET", true )
end

function OnGDIFirehawkCreated(self)
	-- bomb load by default.
	-- comment out to fix harpoint subobject issue ObjectGrantUpgrade( self, "Upgrade_SelectLoad_02" )
	-- commented out because this is done through animation scripts ObjectHideSubObjectPermanently( self, "Plane04", true )
	ObjectHideSubObjectPermanently( self, "UG_Hardpoints", true )
end

function OnGDIPitbullCreated(self)
	ObjectHideSubObjectPermanently( self, "MortorTube", true )
end

function OnGDIOrcaCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_PROBE", true )
	ObjectHideSubObjectPermanently( self, "UG_HARDPOINTS", true )
	ObjectHideSubObjectPermanently( self, "UG_EC", true )
end

function OnGDISniperSquadCreated(self)
	ObjectSetObjectStatus( self, "CAN_SPOT_FOR_BOMBARD" )
end

function OnGDIOrcaClipEmpty(self)
	ObjectHideSubObjectPermanently( self, "MISSILE01", true )
end

function OnGDIOrcaClipFull(self)
	ObjectHideSubObjectPermanently( self, "MISSILE01", false )
end

function OnGDIV35Ox_SummonedForVehicleCreated(self)
	ObjectHideSubObjectPermanently( self, "LOADREF", true )
end

function OnNODShredderCreated(self)

end

function OnNODRaiderTankCreated(self)
	ObjectHideSubObjectPermanently( self, "Gun_Upgrade", true )
	ObjectHideSubObjectPermanently( self, "Turret2_Gun", true )
	ObjectHideSubObjectPermanently( self, "Turret2", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )
	ObjectHideSubObjectPermanently( self, "DOZERBLADE", true )
end

function OnNODAvatarCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end

function OnNODAvatarGenericEvent(self, data)

	local str = tostring( data )

	if str == "upgrades_copied" then
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_VETERAN" );
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_ELITE" );
		ObjectRemoveUpgrade( self, "Upgrade_Veterancy_HEROIC" );
	end
end

function OnNODScorpionBuggyCreated(self)
	ObjectHideSubObjectPermanently( self, "EMP", true )
end

function OnNODVenomCreated(self)
	ObjectHideSubObjectPermanently( self, "SigGen", true )
end

function OnNODTechAssembleyPlantCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_EMP", true )
	ObjectHideSubObjectPermanently( self, "UG_Lasers", true )
	ObjectHideSubObjectPermanently( self, "UG_SigGen", true )
	ObjectHideSubObjectPermanently( self, "UG_DozerBlades", true )
	ObjectHideSubObjectPermanently( self, "SUPERCHARGEDPARTICALBEAM", true )
	ObjectHideSubObjectPermanently( self, "CHARGEDPARTICALBEAM_01", true )
	ObjectHideSubObjectPermanently( self, "CHARGEDPARTICALBEAM_02", true )
	ObjectHideSubObjectPermanently( self, "CHARGEDPARTICALBEAM_03", true )
	ObjectHideSubObjectPermanently( self, "TIBCOREMISSILER02", true )
	ObjectHideSubObjectPermanently( self, "TIBCOREMISSILER", true )
end

function OnNODSecretShrineCreated(self)
	ObjectHideSubObjectPermanently( self, "GLOWS", true )	
	ObjectHideSubObjectPermanently( self, "ConfUpgrd", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_01", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_02", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_03", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_04", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_05", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_06", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_07", true )
	ObjectHideSubObjectPermanently( self, "CYBERNETICLEGS_08", true )
	ObjectHideSubObjectPermanently( self, "BLACKDISCIPLES_GLOWS", true )
	ObjectHideSubObjectPermanently( self, "BLACKDISCIPLESUPGRD", true )
	ObjectHideSubObjectPermanently( self, "PURIFYINGFLAME01", true )
	ObjectHideSubObjectPermanently( self, "PURIFYINGFLAME02", true )
end

function OnNODHangarCreated(self)
	ObjectHideSubObjectPermanently( self, "DISRUPTIONPODS", true )
	ObjectHideSubObjectPermanently( self, "UG_SIGGEN", true )
	ObjectHideSubObjectPermanently( self, "UG_SIGGEN_02", true )
end

function OnNODOperationsCenterCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_DOZERBLADES", true )
	ObjectHideSubObjectPermanently( self, "UG_QUADTURRETS", true )
	ObjectHideSubObjectPermanently( self, "UG_SIGGEN", true )
end

function OnNODSecretShrinePowerOutage(self)	
	if ObjectHasUpgrade( self, "Upgrade_NODConfessorUpgrade" ) == 1 then
		ObjectHideSubObjectPermanently( self, "GLOWS", true )	
	end
end

function OnNODSecretShrinePowerRestored(self)		 
	if ObjectHasUpgrade( self, "Upgrade_NODConfessorUpgrade" ) == 1 then
		ObjectHideSubObjectPermanently( self, "GLOWS", false )	
	end
end

function onCreatedControlPointFunctions(self)
	ObjectHideSubObjectPermanently( self, "TB_CP_ALN", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_GDI", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_NOD", true )
	ObjectHideSubObjectPermanently( self, "LIGHTSF01", true )
	ObjectHideSubObjectPermanently( self, "100", false)
	ObjectHideSubObjectPermanently( self, "75", false)
	ObjectHideSubObjectPermanently( self, "50", false)
	ObjectHideSubObjectPermanently( self, "25", false )
end

function onBuildingPowerOutage(self)
	ObjectHideSubObjectPermanently( self, "LIGHTS", true )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS05", true )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS", true )
	ObjectHideSubObjectPermanently( self, "FXGLOWS", true )
	ObjectHideSubObjectPermanently( self, "FLASHINGLIGHTS", true )
	ObjectHideSubObjectPermanently( self, "MESH01", true )
	ObjectHideSubObjectPermanently( self, "POWERPLANTGLOWS", true )
	ObjectHideSubObjectPermanently( self, "LIGHTL", true )
	ObjectHideSubObjectPermanently( self, "LIGHTR", true )
	ObjectHideSubObjectPermanently( self, "LIGHTS1", true )
	ObjectHideSubObjectPermanently( self, "NBCHEMICALPTE1", true )
	ObjectHideSubObjectPermanently( self, "LINKS", true )
	ObjectHideSubObjectPermanently( self, "MESH28", true )
	ObjectHideSubObjectPermanently( self, "TURBINEGLOWS", true )
	ObjectHideSubObjectPermanently( self, "GLOWS", true )
end

function onBuildingPowerRestored(self)
	ObjectHideSubObjectPermanently( self, "LIGHTS", false )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS05", false )
	ObjectHideSubObjectPermanently( self, "FXLIGHTS", false )
	ObjectHideSubObjectPermanently( self, "FXGLOWS", false )
	ObjectHideSubObjectPermanently( self, "FLASHINGLIGHTS", false )
	ObjectHideSubObjectPermanently( self, "MESH01", false )
	ObjectHideSubObjectPermanently( self, "POWERPLANTGLOWS", false )
	ObjectHideSubObjectPermanently( self, "LIGHTL", false )
	ObjectHideSubObjectPermanently( self, "LIGHTR", false )
	ObjectHideSubObjectPermanently( self, "LIGHTS1", false )
	ObjectHideSubObjectPermanently( self, "NBCHEMICALPTE1", false )
	ObjectHideSubObjectPermanently( self, "LINKS", false )
	ObjectHideSubObjectPermanently( self, "MESH28", false )
	ObjectHideSubObjectPermanently( self, "TURBINEGLOWS", false )
	ObjectHideSubObjectPermanently( self, "GLOWS", false )
end







function OnNeutralGarrisonableBuildingGenericEvent(self,data)
end

function onCreatedGDIOrcaAirstrike(self)
	ObjectForbidPlayerCommands( self, true )
end

function onCreatedAlienMCVUnpacking(self)
	ObjectForbidPlayerCommands( self, true )
end

function GoIntoRampage(self)
	ObjectEnterRampageState(self)
		
	--Broadcast fear to surrounding unit(if we actually rampaged)
	if ObjectTestModelCondition(self, "WEAPONSET_RAMPAGE") then
		ObjectBroadcastEventToUnits(self, "BeAfraidOfRampage", 250)
	end
end

function MakeMeAlert(self)
	ObjectEnterAlertState(self)
end

function BecomeUncontrollablyAfraid(self, other)
	if not ObjectTestCanSufferFear(self) then
		return
	end

	ObjectEnterUncontrollableCowerState(self, other)
end

function BecomeAfraidOfRampage(self, other)
	if not ObjectTestCanSufferFear(self) then
		return
	end

	ObjectEnterCowerState(self, other)
end

function RadiateTerror(self, other)
	ObjectBroadcastEventToEnemies(self, "BeTerrified", 180)
end
	
function RadiateTerrorEx(self, other, terrorRange)
	ObjectBroadcastEventToEnemies(self, "BeTerrified", terrorRange)
end
	

function BecomeTerrified(self, other)
	ObjectEnterRunAwayPanicState(self, other)
end

function BecomeAfraidOfGateDamaged(self, other)
	if not ObjectTestCanSufferFear(self) then
		return
	end

	ObjectEnterCowerState(self,other)
end


function ChantForUnit(self) -- Used by units to broadcast the chant event to their own side.
	ObjectBroadcastEventToAllies(self, "BeginChanting", 9999)
end

function StopChantForUnit(self) -- Used by units to stop the chant event to their own side.
	ObjectBroadcastEventToAllies(self, "StopChanting", 9999)
end

function SpyMoving(self, other)
	print(ObjectDescription(self).." spying movement of "..ObjectDescription(other));
end

function OnGarrisonableCreated(self)
	ObjectHideSubObjectPermanently( self, "GARRISON01", true )
	ObjectHideSubObjectPermanently( self, "GARRISON02", true )
end

function OnRubbleDropshipCreated(self)
	ObjectHideSubObjectPermanently( self, "Loadref", true )
end

-- XPACK LUA FUNCTION DEFINITIONS

function OnTitanCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRail_01", true )
	ObjectHideSubObjectPermanently( self, "UGRail_Barrel", true )
	ObjectHideSubObjectPermanently( self, "MUZZLEFLASH_01", true )
	ObjectHideSubObjectPermanently( self, "UGRAILACCELERATOR_01", true )
	ObjectHideSubObjectPermanently( self, "UGRAILACCELERATOR_BARREL", true )
end

function OnAlienHexapodCreated(self)
	ObjectHideSubObjectPermanently( self, "AUTELEPORT_LR", true )
	ObjectHideSubObjectPermanently( self, "AUTELEPORT_LM", true )
	ObjectHideSubObjectPermanently( self, "AUTELEPORT_LF", true )	

	ObjectHideSubObjectPermanently( self, "AUSHOCKBASE_LR", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKBASE_LM", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKBASE_LF", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKTURRET_LR", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKTURRET_LM", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKTURRET_LF", true )

	ObjectHideSubObjectPermanently( self, "AUSTALKBASE_LR", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKBASE_LM", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKBASE_LF", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKTURRET_LR", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKTURRET_LM", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKTURRET_LF", true )	

	ObjectHideSubObjectPermanently( self, "AUPLASMABASE_LR", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMABASE_LM", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMABASE_LF", true )	
	ObjectHideSubObjectPermanently( self, "AUPLASMAGUN_LR", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMAGUN_LM", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMAGUN_LF", true )	
	
	ObjectHideSubObjectPermanently( self, "AUHEALTHBASE_LR", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHBASE_LM", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHBASE_LF", true )	
	ObjectHideSubObjectPermanently( self, "AUHEALTHTURRET_LR", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHTURRET_LM", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHTURRET_LF", true )	
	ObjectHideSubObjectPermanently( self, "FX_HEALTHRINGS_LR", true )
	ObjectHideSubObjectPermanently( self, "FX_HEALTHRINGS_LM", true )
	ObjectHideSubObjectPermanently( self, "FX_HEALTHRINGS_LF", true )	

	ObjectHideSubObjectPermanently( self, "AUTELEPORT_RR", true )
	ObjectHideSubObjectPermanently( self, "AUTELEPORT_RM", true )
	ObjectHideSubObjectPermanently( self, "AUTELEPORT_RF", true )	

	ObjectHideSubObjectPermanently( self, "AUSHOCKBASE_RR", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKBASE_RM", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKBASE_RF", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKTURRET_RR", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKTURRET_RM", true )
	ObjectHideSubObjectPermanently( self, "AUSHOCKTURRET_RF", true )
	
	ObjectHideSubObjectPermanently( self, "AUSTALKBASE_RR", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKBASE_RM", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKBASE_RF", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKTURRET_RR", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKTURRET_RM", true )
	ObjectHideSubObjectPermanently( self, "AUSTALKTURRET_RF", true )	

	ObjectHideSubObjectPermanently( self, "AUPLASMABASE_RR", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMABASE_RM", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMABASE_RF", true )	
	ObjectHideSubObjectPermanently( self, "AUPLASMAGUN_RR", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMAGUN_RM", true )
	ObjectHideSubObjectPermanently( self, "AUPLASMAGUN_RF", true )	
	
	ObjectHideSubObjectPermanently( self, "AUHEALTHBASE_RR", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHBASE_RM", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHBASE_RF", true )	
	ObjectHideSubObjectPermanently( self, "AUHEALTHTURRET_RR", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHTURRET_RM", true )
	ObjectHideSubObjectPermanently( self, "AUHEALTHTURRET_RF", true )	
	ObjectHideSubObjectPermanently( self, "FX_HEALTHRINGS_RR", true )
	ObjectHideSubObjectPermanently( self, "FX_HEALTHRINGS_RM", true )
	ObjectHideSubObjectPermanently( self, "FX_HEALTHRINGS_RF", true )	
end

function OnGDIMARVCreated(self)
	ObjectHideSubObjectPermanently( self, "GN_Base_TreadLR", true )
	ObjectHideSubObjectPermanently( self, "GN_Base_TreadLF", true )
	ObjectHideSubObjectPermanently( self, "GN_Base_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "GN_Base_TreadRF", true )	
	ObjectHideSubObjectPermanently( self, "GN_Turret_TreadLR", true )	
	ObjectHideSubObjectPermanently( self, "GN_Turret_TreadLF", true )	
	ObjectHideSubObjectPermanently( self, "GN_Turret_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "GN_Turret_TreadRF", true )	
	
	ObjectHideSubObjectPermanently( self, "EN_Base_TreadLR", true )
	ObjectHideSubObjectPermanently( self, "EN_Base_TreadLF", true )
	ObjectHideSubObjectPermanently( self, "EN_Base_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "EN_Base_TreadRF", true )	
	ObjectHideSubObjectPermanently( self, "EN_Turret_TreadLR", true )	
	ObjectHideSubObjectPermanently( self, "EN_Turret_TreadLF", true )	
	ObjectHideSubObjectPermanently( self, "EN_Turret_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "EN_Turret_TreadRF", true )	
	
	ObjectHideSubObjectPermanently( self, "ZT_Base_TreadLR", true )
	ObjectHideSubObjectPermanently( self, "ZT_Base_TreadLF", true )
	ObjectHideSubObjectPermanently( self, "ZT_Base_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "ZT_Base_TreadRF", true )	
	ObjectHideSubObjectPermanently( self, "ZT_Turret_TreadLR", true )	
	ObjectHideSubObjectPermanently( self, "ZT_Turret_TreadLF", true )	
	ObjectHideSubObjectPermanently( self, "ZT_TURRETRR", true )	
	ObjectHideSubObjectPermanently( self, "ZT_Turret_TreadRF", true )	
	
	ObjectHideSubObjectPermanently( self, "MS_Base_TreadLR", true )
	ObjectHideSubObjectPermanently( self, "MS_Base_TreadLF", true )
	ObjectHideSubObjectPermanently( self, "MS_Base_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "MS_Base_TreadRF", true )	
	ObjectHideSubObjectPermanently( self, "MS_Turret_TreadLR", true )	
	ObjectHideSubObjectPermanently( self, "MS_Turret_TreadLF", true )	
	ObjectHideSubObjectPermanently( self, "MS_Turret_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "MS_Turret_TreadRF", true )	
	
	ObjectHideSubObjectPermanently( self, "RM_Base_TreadLR", true )
	ObjectHideSubObjectPermanently( self, "RM_Base_TreadLF", true )
	ObjectHideSubObjectPermanently( self, "RM_Base_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "RM_Base_TreadRF", true )	
	ObjectHideSubObjectPermanently( self, "RM_Turret_TreadLR", true )	
	ObjectHideSubObjectPermanently( self, "RM_Turret_TreadLF", true )	
	ObjectHideSubObjectPermanently( self, "RM_Turret_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "RM_Turret_TreadRF", true )
	
	ObjectHideSubObjectPermanently( self, "ST_Base_TreadLR", true )
	ObjectHideSubObjectPermanently( self, "ST_Base_TreadLF", true )
	ObjectHideSubObjectPermanently( self, "ST_Base_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "ST_Base_TreadRF", true )	
	ObjectHideSubObjectPermanently( self, "ST_Turret_TreadLR", true )	
	ObjectHideSubObjectPermanently( self, "ST_Turret_TreadLF", true )	
	ObjectHideSubObjectPermanently( self, "ST_Turret_TreadRR", true )	
	ObjectHideSubObjectPermanently( self, "ST_Turret_TreadRF", true )
	ObjectHideSubObjectPermanently( self, "ST_LASERLR", true )	
	ObjectHideSubObjectPermanently( self, "ST_LASERLF", true )		
	ObjectHideSubObjectPermanently( self, "ST_LASERRR", true )		
	ObjectHideSubObjectPermanently( self, "ST_LASERRF", true )		
	
end

function OnNODMetaUnitCreated(self)
	ObjectHideSubObjectPermanently( self, "B_FTR", true )
	ObjectHideSubObjectPermanently( self, "FTR", true )
	ObjectHideSubObjectPermanently( self, "FX_FTpilotflameR", true )
	ObjectHideSubObjectPermanently( self, "B_FTL", true )
	ObjectHideSubObjectPermanently( self, "FTL", true )	
	ObjectHideSubObjectPermanently( self, "FX_FTpilotflameL", true )	
	ObjectHideSubObjectPermanently( self, "HvyMGL", true )
	ObjectHideSubObjectPermanently( self, "HvyMGBarrelL", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_01", true )	
	ObjectHideSubObjectPermanently( self, "HvyMGR", true )
	ObjectHideSubObjectPermanently( self, "HvyMGBarrelR", true )
	ObjectHideSubObjectPermanently( self, "MuzzleFlash_02", true )	
	ObjectHideSubObjectPermanently( self, "RocketPodL", true )
	ObjectHideSubObjectPermanently( self, "RocketPodR", true )	
	ObjectHideSubObjectPermanently( self, "ModuleR", true )
	ObjectHideSubObjectPermanently( self, "ModuleBeacontR", true )
	ObjectHideSubObjectPermanently( self, "ModuleLightR", true )	
	ObjectHideSubObjectPermanently( self, "ModuleL", true )	
	ObjectHideSubObjectPermanently( self, "ModuleBeaconL", true )
	ObjectHideSubObjectPermanently( self, "ModuleLightL", true )	
end

function OnAlienMechapedeCreated(self)
	ObjectHideSubObjectPermanently( self, "TIBERIUM_SPRAY_MODULE", true )
	ObjectHideSubObjectPermanently( self, "SHARD_MODULE", true )
	ObjectHideSubObjectPermanently( self, "PLASMA_DISC_MODULE", true )
	ObjectHideSubObjectPermanently( self, "DISINTEGRATOR_MODULE", true )	
end

function OnAlienPACCreated(self)
	ObjectHideSubObjectPermanently( self, "TravEng01", true )
	ObjectHideSubObjectPermanently( self, "TravEng02", true )
end

function OnAlienDevastatorCreated(self)
	ObjectHideSubObjectPermanently( self, "TravEng01", true )
	ObjectHideSubObjectPermanently( self, "TravEng02", true )
end

function OnGDIGrenadeSoldierCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_STRAPS", true )
	ObjectHideSubObjectPermanently( self, "UG_GRENADEEMP_PROJECTILE", true )
end

function OnGDIGuardianCannonCreated(self)
	ObjectHideSubObjectPermanently( self, "UGRAILMAIN", true )
	ObjectHideSubObjectPermanently( self, "UG_RAILBARREL2", true )
	ObjectHideSubObjectPermanently( self, "UG_RAILBARREL1", true )
end

function OnAlienPhotonCannonCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_SHARD", true )
	ObjectHideSubObjectPermanently( self, "UG_SHARDWEAPON", true )
end

function OnAlienPMBatteryCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_SHARD", true )
	ObjectHideSubObjectPermanently( self, "UG_SHARDWEAPON", true )
end

function OnNODShadowSquadBeaconCreated(self)
	ObjectSetObjectStatus( self, "CAN_SPOT_FOR_BOMBARD" )
end

function OnAlienSeekerTankCreated(self)
	ObjectHideSubObjectPermanently( self, "AUSHARDWEAPON_C_G", true )
	ObjectHideSubObjectPermanently( self, "UG_SHARDWEAPON", true )
end


--function OnImprovedCyborgCreated(self)
--	ObjectHideSubObjectPermanently( self, "WEAPON_PARTICLEBM_UPGRADED", true )
--end

function OnBunkerTruckCreated(self)
	ObjectHideSubObjectPermanently( self, "DOZERBLADE", true )
end

function OnCyborgCreated(self)
	ObjectHideSubObjectPermanently( self, "WEAPON_PARTICLEBM", true )
end


function OnWolverineCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_Weapon01", true )
	ObjectHideSubObjectPermanently( self, "UG_Weapon02", true )
	ObjectHideSubObjectPermanently( self, "UG_Ammo", true )
end

function OnStalkerCreated(self)
	ObjectHideSubObjectPermanently( self, "AUStalker_C_B", true )
	ObjectHideSubObjectPermanently( self, "AUStalker_Gun", true )
end

function OnGunshipCreated(self)
	ObjectHideSubObjectPermanently( self, "FXWEAPON01", true )
	ObjectHideSubObjectPermanently( self, "FXWEAPON02", true )
	ObjectHideSubObjectPermanently( self, "FXWEAPON03", true )
	ObjectHideSubObjectPermanently( self, "FXWEAPON04", true )
end


function OnAAScoutCreated(self)
	ObjectHideSubObjectPermanently( self, "FXMUZZLEFLASH01", true )
	ObjectHideSubObjectPermanently( self, "FXMUZZLEFLASH02", true )
	ObjectHideSubObjectPermanently( self, "FXMUZZLEFLASH03", true )
	ObjectHideSubObjectPermanently( self, "FXMUZZLEFLASH04", true )
end

function OnMobileArtilleryCreated(self)
	ObjectHideSubObjectPermanently( self, "MUZZLEFLASH_01", true )
	--ObjectHideSubObjectPermanently( self, "TREDS", true )
end

function OnAABatteryCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_TUNGSTENBASE", true )
	ObjectHideSubObjectPermanently( self, "UG_TUNGSTENAMMO", true )
	ObjectHideSubObjectPermanently( self, "UG_TUNGSTENGUN", true )
	ObjectHideSubObjectPermanently( self, "UGTAmNewSkin", true )
	ObjectHideSubObjectPermanently( self, "UGTungNewSkin", true )
end

function OnNODRocketBunkerSpawnCreated(self)
	ObjectHideSubObjectPermanently( self, "TIBCOREMISSILE", true )
	ObjectHideSubObjectPermanently( self, "HOSE", true )
end

function OnCombatEngineerCreated(self)
	ObjectHideSubObjectPermanently( self, "MUZZLEFLASH", true )
	ObjectHideSubObjectPermanently( self, "LASER", true )
end

function OnZOCOMOrcaCreated(self)
	ObjectHideSubObjectPermanently( self, "UG_PROBE", true )
	ObjectHideSubObjectPermanently( self, "UG_HARDPOINTS", true )
	ObjectHideSubObjectPermanently( self, "MISSILE01", true )
	--ObjectHideSubObjectPermanently( self, "UG_EC", true )
end

function OnGDIAPCCreated(self)
	ObjectHideSubObjectPermanently( self, "APC_UGAB", true )
	ObjectHideSubObjectPermanently( self, "APC_UGTURRET", true )
	ObjectHideSubObjectPermanently( self, "TURRET_PITCH", false )
end

function OnReaperTripodCreated(self)
	ObjectHideSubObjectPermanently( self, "AU_RPRTRIPOD_UPGR01", true )
end

function OnReaper17DevourerCreated(self)
	ObjectHideSubObjectPermanently( self, "AU_DEVOURER_UPGR01", true )
end

function OnAlienMotherShipCreated(self)
	ObjectSetObjectStatus( self, "AIRBORNE_TARGET" )
end

function OnBlackHandCustomWarmechCreated(self)
	ObjectHideSubObjectPermanently( self, "NUBEAM", true )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", true )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", true )
end
