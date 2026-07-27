//=============================================================================
// CW_Pistol_G18CEx
//=============================================================================
// An Glock 18 Pistol
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// Fernando Ferrando @ Saber Interactive
//=============================================================================

class CW_Pistol_G18CEx extends KFWeap_PistolBase;

simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Pistol_G18C');
}

// GetReloadRateScale — รีโหลดเร็วขึ้น 20% ถ้ายิงไม่หมดแม็ก (ยังมีกระสุนเหลือ), 10% ถ้ายิงหมดแม็ก
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
simulated function float GetReloadRateScale()
{
	if (AmmoCount[0] > 0)
	{
		return Super.GetReloadRateScale() * 0.8; // ไม่หมดแม็ก: เร็วขึ้น 20%
	}
	return Super.GetReloadRateScale() * 0.9; // หมดแม็ก: เร็วขึ้น 10%
}

defaultproperties
{
    // FOV [FFERRANDO NEEDS TO BE UPDATED TO G18]
	MeshFOV=96
	MeshIronSightFOV=55 //77
    PlayerIronSightFOV=77

	// Depth of field [FFERRANDO NEEDS TO BE UPDATED TO G18]
	DOF_FG_FocalRadius=40
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming/Position [FFERRANDO NEEDS TO BE UPDATED TO G18]
	PlayerViewOffset=(X=-15,Y=12,Z=-6)
	IronSightPosition=(X=0,Y=-0.12,Z=-0.1) //(X=-3,Y=-0.38,Z=-0.2)
	
	// Content [FFERRANDO NEEDS TO BE UPDATED TO G18]
	PackageKey="G18CEx"
	FirstPersonMeshName="WEP_1P_G18C_MESH.Wep_1stP_G18C_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_G18C_ANIM.WEP_1st_G18C_Anim"
	PickupMeshName="WEP_3P_G18C_MESH.Wep_G18C_Pickup"
	AttachmentArchetypeName="WEP_G18C_ARCH.Wep_G18C_3P"
	MuzzleFlashTemplateName="WEP_G18C_ARCH.Wep_G18C_MuzzleFlash"

	// Ammo
	MagazineCapacity[0]=33 //Magazine ammount
	SpareAmmoCapacity[0]=792 //spare ammo Ammount
	InitialSpareMags[0]=0 //starting spare magazines Ammount
	bCanBeReloaded=true
	bReloadFromMagazine=true

	bHasFireLastAnims=true
	BonesToLockOnEmpty=(RW_Bolt)

	// Recoil
	maxRecoilPitch=300 //220 //165 //150 //100
	minRecoilPitch=225 //165 //125 //112 //75
	maxRecoilYaw=34 //85, -60%
	minRecoilYaw=-34 //-85, -60%
	RecoilRate=0.045
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=100
	RecoilISMinYawLimit=65435
	RecoilISMaxPitchLimit=37
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=1.65
	WalkingRecoilModifier=1.1
	JoggingRecoilModifier=1.2

	// DEFAULT_FIREMODE
	FireOffset=(X=85,Y=12,Z=-7)
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring //FireMode Automatic
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_G18CEx'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_G18CEx' //DEFAULT & ALT MODE TYPE DAMAGE
	FireInterval(DEFAULT_FIREMODE)=+0.075 // 800 RPM //Single Default Firemode (Automatic) firerate
	Spread(DEFAULT_FIREMODE)=0.03
	InstantHitDamage(DEFAULT_FIREMODE)=40 //37, +3
	PenetrationPower(DEFAULT_FIREMODE)=0.0 //Default Firemode (Automatic) & Altfire Firemode (Single Fire) penetration
	PenetrationDamageReductionCurve(DEFAULT_FIREMODE)=(Points=((InVal=0.f,OutVal=0.f),(InVal=1.f, OutVal=1.f))) //Default Firemode (Automatic) & Altfire Firemode (Single Fire) penetration

	// ALT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring //FireMode single
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_G18cEx'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_G18cEx' //DEFAULT & ALT MODE TYPE DAMAGE
	FireInterval(ALTFIRE_FIREMODE)=+0.175 // 343 RPM //Single Altfire Firemode (Single Fire) firerate
	InstantHitDamage(ALTFIRE_FIREMODE)=40 //37, +3
	Spread(ALTFIRE_FIREMODE)=0.0125
	PenetrationPower(ALTFIRE_FIREMODE)=0.0 //Default Firemode (Automatic) & Altfire Firemode (Single Fire) penetration
	PenetrationDamageReductionCurve(ALTFIRE_FIREMODE)=(Points=((InVal=0.f,OutVal=0.f),(InVal=1.f, OutVal=1.f))) //Default Firemode (Automatic) & Altfire Firemode (Single Fire) penetration
    
	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_G18CEx' //BASH MODE TYPE DAMAGE
	InstantHitDamage(BASH_FIREMODE)=25 //BASH MODE DAMAGE
	PenetrationPower(BASH_FIREMODE)=0.0 //Default Firemode (Automatic) & Altfire Firemode (Single Fire) penetration
	PenetrationDamageReductionCurve(BASH_FIREMODE)=(Points=((InVal=0.f,OutVal=0.f),(InVal=1.f, OutVal=1.f))) //Default Firemode (Automatic) & Altfire Firemode (Single Fire) penetration

	//Sounds
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_3P_Loop', FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Auto_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_MedicDart.Play_WEP_SA_Medic_Dart_DryFire'

	// Advanced (High RPM) Fire Effects
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_3P_EndLoop', FirstPersonCue=AkEvent'WW_WEP_G18c.Play_WEP_G18c_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments [FFERRANDO NEEDS TO BE RECHECKED FOR G18]
	bHasIronSights=true
	bHasFlashlight=true

	// Perk / Class
	AssociatedPerkClasses(0)=class'KFPerk_Gunslinger' //Main Perk

	// Inventory / Grouping [FFERRANDO NEEDS TO BE RECHECKED FOR G18]
	InventoryGroup=IG_Secondary
	InventorySize=4 //Weight Ammount
	GroupPriority=100
	bCanThrow=true
	bDropOnDeath=true
	WeaponSelectTexture=Texture2D'wep_ui_g18c_tex.UI_WeaponSelect_g18c'
	bIsBackupWeapon=false

    // Dual class [FFERRANDO NEEDS TO BE UPDATED TO G18]
	DualClass=class'CW_Pistol_DualG18Ex' //Dual-wieldable yes

	// Custom animations
	IdleFidgetAnims=(Guncheck_v1, Guncheck_v2, Guncheck_v3)
	
//	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.125f), (Stat=EWUS_Damage1, Scale=1.125f), (Stat=EWUS_Weight, Add=1)))

}

