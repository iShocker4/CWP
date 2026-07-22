class CW_Pistol_DualAutoMag_Ex extends KFWeap_DualBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // Runtime balance tuning disabled while adjusting FOV and mesh position.
    // class'CWP_BalanceTuning'.static.ApplyDualAutoMag(self);
}

/*
simulated function float GetUpgradedAfflictionPower(EAfflictionType AfflictionType, float InPower, optional int FireMode = INDEX_NONE, optional int UpgradeIndex = INDEX_NONE)
{
    return class'CWP_BalanceTuning'.static.GetAutoMagAfflictionPower(AfflictionType, super.GetUpgradedAfflictionPower(AfflictionType, InPower, FireMode, UpgradeIndex));
}
*/

/* 
simulated function BeginFire(byte FireModeNum)
{
    if (FireModeNum == DEFAULT_FIREMODE && (WorldInfo.TimeSeconds - LastSingleFireTime) < FireInterval[DEFAULT_FIREMODE])
    {
        return;
    }

    LastSingleFireTime = WorldInfo.TimeSeconds;
    super.BeginFire(FireModeNum);
}
*/

defaultproperties
{
    // Inventory / Grouping
    InventorySize=8 //4
    GroupPriority=45.0000000

    // Content
    PackageKey="Dual_AutoMag"
    FirstPersonMeshName="WEP_1P_AutoMag_MESH.Wep_1stP_Dual_AutoMag_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_Dual_Deagle_ANIM.Wep_1stP_Dual_Deagle_Anim"
    PickupMeshName="WEP_3P_AutoMag_MESH.Wep_AutoMag_Pickup"
    AttachmentArchetypeName="WEP_AutoMag_ARCH.Wep_Dual_AutoMag_3P"
    MuzzleFlashTemplateName="WEP_Dual_Deagle_ARCH.Wep_Dual_Deagle_MuzzleFlash"
    WeaponSelectTexture=Texture2D'wep_ui_automag_tex.dualautomag_ui'

    // Ammo
    MagazineCapacity=18
    SpareAmmoCapacity=266
    InitialSpareMags=2
    bCanBeReloaded=true
    bReloadFromMagazine=true

    // Zooming / Position
    MeshIronSightFOV=77.0000000
    PlayerIronSightFOV=77.0000000
    IronSightPosition=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    PlayerViewOffset=(X=9.0000000,Y=0.0000000,Z=-5.0000000)
    FireOffset=(X=17.0000000,Y=4.0000000,Z=-2.2500000)

    // Depth of field
    DOF_FG_FocalRadius=38.0000000
    DOF_FG_MaxNearBlurSize=3.5000000

    // Recoil
    maxRecoilPitch=700
    minRecoilPitch=650
    maxRecoilYaw=180
    minRecoilYaw=-180
    RecoilRate=0.0850000
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=1100
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485

/*
    // Melee
    Begin Object Name=MeleeHelper_0
    end object
    MeleeAttackHelper=MeleeHelper_0
*/

    // DEFAULT_FIREMODE (0)
    PenetrationPower(DEFAULT_FIREMODE)=4.0000000
    FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
    WeaponProjectiles(DEFAULT_FIREMODE)=class'KFGameContent.KFProj_Bullet_PistolDeagle'
    FireInterval(DEFAULT_FIREMODE)=0.1300000
    Spread(DEFAULT_FIREMODE)=0.0100000
    InstantHitDamage(DEFAULT_FIREMODE)=140.0000000
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_AutoMag'
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit

    // ALTFIRE_FIREMODE (1)
    PenetrationPower(ALTFIRE_FIREMODE)=4.0000000
    FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
    WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFGameContent.KFProj_Bullet_PistolDeagle'
    FireInterval(ALTFIRE_FIREMODE)=0.1300000
    Spread(ALTFIRE_FIREMODE)=0.0100000
    InstantHitDamage(ALTFIRE_FIREMODE)=140.0000000
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'CWP.KFDT_Ballistic_AutoMag'
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit

    // BASH_FIREMODE (3)
    InstantHitDamage(BASH_FIREMODE)=240.0000000
    InstantHitDamageTypes(BASH_FIREMODE)=class'KFGameContent.KFDT_Bludgeon_Deagle'

    // Fire Effects
    WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
    WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
    WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
    WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'

    // Attachments
    bHasIronSights=true

    // Perk / Class
    AssociatedPerkClasses(DEFAULT_FIREMODE)=class'KFGame.KFPerk_Gunslinger'
    SingleClass=class'CWP.CW_Pistol_AutoMag_Ex'

    // Upgrade path
    WeaponUpgrades.Empty

/*
    // Components
    begin object name="FirstPersonMesh"
        ReplacementPrimitive=none
    end object
    Mesh=FirstPersonMesh
    begin object name="StaticPickupComponent"
        ReplacementPrimitive=none
    end object
    DroppedPickupMesh=StaticPickupComponent
    PickupFactoryMesh=StaticPickupComponent
*/

    // Miscellaneous
    bHasFireLastAnims=true
    BonesToLockOnEmpty(0)=RW_Slide
    BonesToLockOnEmpty(1)=RW_Bullets1
    BonesToLockOnEmpty_L(0)=LW_Slide
    BonesToLockOnEmpty_L(1)=LW_Bullets1
    LeftFireOffset=(X=17.0000000,Y=-4.0000000,Z=-2.2500000)
}
