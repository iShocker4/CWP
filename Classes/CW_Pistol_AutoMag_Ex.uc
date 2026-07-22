class CW_Pistol_AutoMag_Ex extends KFWeap_PistolBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var private float LastSingleFireTime;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // Runtime balance tuning disabled while adjusting FOV and mesh position.
    // class'CWP_BalanceTuning'.static.ApplyAutoMag(self);
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
    InventorySize=4 //2
    GroupPriority=25.0000000
    AmmoPickupScale=2.0000000

    // Content
    PackageKey="AutoMag"
    FirstPersonMeshName="WEP_1P_AutoMag_MESH.Wep_1stP_AutoMag_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_Deagle_ANIM.Wep_1st_Deagle_Anim"
    PickupMeshName="WEP_3P_AutoMag_MESH.Wep_AutoMag_Pickup"
    AttachmentArchetypeName="WEP_AutoMag_ARCH.Wep_AutoMag_3P"
    MuzzleFlashTemplateName="WEP_Deagle_ARCH.Wep_Deagle_MuzzleFlash"
    WeaponSelectTexture=Texture2D'wep_ui_automag_tex.automag_ui'

    // Ammo
    MagazineCapacity=9
    SpareAmmoCapacity=273
    InitialSpareMags=5
    bCanBeReloaded=true
    bReloadFromMagazine=true

    // Zooming / Position
    MeshIronSightFOV=77.0000000
    PlayerIronSightFOV=77.0000000
    IronSightPosition=(X=11.0000000,Y=0.0000000,Z=0.0000000)
    PlayerViewOffset=(X=14.0000000,Y=10.0000000,Z=-4.0000000)
    FireOffset=(X=20.0000000,Y=4.0000000,Z=-3.0000000)

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

    // DEFAULT_FIREMODE
    PenetrationPower(DEFAULT_FIREMODE)=4.0000000
    FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
    WeaponProjectiles(DEFAULT_FIREMODE)=class'KFGameContent.KFProj_Bullet_Pistol50AE'
    FireInterval(DEFAULT_FIREMODE)=0.2000000
    Spread(DEFAULT_FIREMODE)=0.0100000
    InstantHitDamage(DEFAULT_FIREMODE)=127.0000000 //140
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_AutoMag'
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit

    // ALTFIRE_FIREMODE
    FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
    FireInterval(ALTFIRE_FIREMODE)=1.0000000
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFGame.KFDT_Ballistic'
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

    // BASH_FIREMODE
    InstantHitDamage(BASH_FIREMODE)=220.0000000
    InstantHitDamageTypes(BASH_FIREMODE)=class'KFGameContent.KFDT_Bludgeon_Deagle'

    // Fire Effects
    WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
    WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'

    // Custom animations
    FireSightedAnims(0)=Shoot_Iron
    FireSightedAnims(1)=Shoot_Iron2
    FireSightedAnims(2)=Shoot_Iron3

    // Attachments
    bHasIronSights=true

    // Perk / Class
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Gunslinger'
    AssociatedPerkClasses(1)=class'KFGame.KFPerk_Sharpshooter'
    DualClass=class'CWP.CW_Pistol_DualAutoMag_Ex'

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
}
