class CW_Pistol_AutoMag_Ex extends KFWeap_PistolBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    // Content assets
    PackageKey="AutoMag"
    FirstPersonMeshName="WEP_1P_AutoMag_MESH.Wep_1stP_AutoMag_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_Deagle_ANIM.Wep_1st_Deagle_Anim"
    PickupMeshName="WEP_3P_AutoMag_MESH.Wep_AutoMag_Pickup"
    AttachmentArchetypeName="WEP_AutoMag_ARCH.Wep_AutoMag_3P"
    MuzzleFlashTemplateName="WEP_Deagle_ARCH.Wep_Deagle_MuzzleFlash"
    WeaponSelectTexture=Texture2D'wep_ui_automag_tex.automag_ui'
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'

    // Weapon behavior
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    BonesToLockOnEmpty(0)=RW_Slide
    BonesToLockOnEmpty(1)=RW_Bullets1

    // Inventory and trader sorting
    InventorySize=2
    GroupPriority=25.0000000
    AmmoPickupScale=2.0000000

    // Ammo economy
    MagazineCapacity=7
    SpareAmmoCapacity=273
    InitialSpareMags=5

    // Sights and view offsets
    MeshIronSightFOV=77.0000000
    PlayerIronSightFOV=77.0000000
    IronSightPosition=(X=11.0000000,Y=0.0000000,Z=0.0000000)
    DOF_FG_FocalRadius=38.0000000
    PlayerViewOffset=(X=14.0000000,Y=10.0000000,Z=-4.0000000)
    FireOffset=(X=20.0000000,Y=4.0000000,Z=-3.0000000)
    DOF_FG_MaxNearBlurSize=3.5000000

    // Recoil
    maxRecoilPitch=450
    minRecoilPitch=400
    maxRecoilYaw=150
    minRecoilYaw=-150
    RecoilRate=0.0700000
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
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

    // Fire mode stats
    PenetrationPower(0)=4.0000000
    FireSightedAnims(0)=Shoot_Iron
    FireSightedAnims(1)=Shoot_Iron2
    FireSightedAnims(2)=Shoot_Iron3
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
    WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Gunslinger'
    AssociatedPerkClasses(1)=class'KFGame.KFPerk_Sharpshooter'
    FiringStatesArray(0)=WeaponSingleFiring
    FiringStatesArray(1)=WeaponSingleFiring
    WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_Pistol50AE'
    FireInterval(0)=0.2000000
    FireInterval(1)=1.0000000
    Spread(0)=0.0100000
    InstantHitDamage(0)=120.0000000
    InstantHitDamage(3)=220.0000000
    InstantHitDamageTypes(0)=class'CWP.KFDT_Ballistic_AutoMag'
    InstantHitDamageTypes(1)=class'KFGame.KFDT_Ballistic'
    InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Bludgeon_Deagle'
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None


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
}
