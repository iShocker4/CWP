class CW_Pistol_DualAutoMag_Ex extends KFWeap_DualBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    // Content assets
    PackageKey="Dual_AutoMag"
    FirstPersonMeshName="WEP_1P_AutoMag_MESH.Wep_1stP_Dual_AutoMag_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_Dual_Deagle_ANIM.Wep_1stP_Dual_Deagle_Anim"
    PickupMeshName="WEP_3P_AutoMag_MESH.Wep_AutoMag_Pickup"
    AttachmentArchetypeName="WEP_AutoMag_ARCH.Wep_Dual_AutoMag_3P"
    MuzzleFlashTemplateName="WEP_Dual_Deagle_ARCH.Wep_Dual_Deagle_MuzzleFlash"
    WeaponSelectTexture=Texture2D'wep_ui_automag_tex.dualautomag_ui'

    // Weapon behavior
    SingleClass=class'CWP.CW_Pistol_AutoMag_Ex'
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    bHasFireLastAnims=true
    BonesToLockOnEmpty(0)=RW_Slide
    BonesToLockOnEmpty(1)=RW_Bullets1

    // Inventory and trader sorting
    InventorySize=4
    GroupPriority=45.0000000

    // Ammo economy
    MagazineCapacity=18
    SpareAmmoCapacity=266
    InitialSpareMags=2

    // Sights and view offsets
    MeshIronSightFOV=77.0000000
    PlayerIronSightFOV=77.0000000
    IronSightPosition=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
    QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
    DOF_FG_FocalRadius=38.0000000
    PlayerViewOffset=(X=9.0000000,Y=0.0000000,Z=-5.0000000)
    FireOffset=(X=17.0000000,Y=4.0000000,Z=-2.2500000)
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
    PenetrationPower(0)=4.0000000
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
    WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Gunslinger'
    FiringStatesArray(0)=WeaponSingleFiring
    WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_PistolDeagle'
    FireInterval(0)=0.1300000
    Spread(0)=0.0100000
    InstantHitDamage(0)=140.0000000
    InstantHitDamageTypes(0)=class'CWP.KFDT_Ballistic_AutoMag'
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit

    // ALTFIRE_FIREMODE (1)
    PenetrationPower(1)=4.0000000
    WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
    WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
    FiringStatesArray(1)=WeaponSingleFiring
    WeaponProjectiles(1)=class'KFGameContent.KFProj_Bullet_PistolDeagle'
    FireInterval(1)=0.1300000
    Spread(1)=0.0100000
    InstantHitDamage(1)=140.0000000
    InstantHitDamageTypes(1)=class'CWP.KFDT_Ballistic_AutoMag'
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit

    // BASH_FIREMODE (3)
    InstantHitDamage(3)=240.0000000
    InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Bludgeon_Deagle'


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
    BonesToLockOnEmpty_L(0)=LW_Slide
    BonesToLockOnEmpty_L(1)=LW_Bullets1
    LeftFireOffset=(X=17.0000000,Y=-4.0000000,Z=-2.2500000)
}
