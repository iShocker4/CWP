class CW_Rifle_M110_Ex extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    // Content assets
    PackageKey="M110_SASS"
    FirstPersonMeshName="WEP_1P_M110_MESH.Wep_1stP_m110_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_AR15_9mm_ANIM.Wep_1stP_AR15_9mm_Anim"
    PickupMeshName="WEP_3P_M110_MESH.Wep_m110_Pickup"
    AttachmentArchetypeName="WEP_M110_ARCH.Wep_m110_3P"
    MuzzleFlashTemplateName="WEP_M110_ARCH.Wep_AR15_9MM_MuzzleFlash"
    WeaponSelectTexture=Texture2D'WEP_M110_TEX.M110_UI'

    // Weapon behavior
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true

    // Inventory and trader sorting
    InventorySize=6

    // Ammo economy
    MagazineCapacity=20
    SpareAmmoCapacity=240
    InitialSpareMags=6

    // Sights and view offsets
    MeshFOV=70.0000000
    MeshIronSightFOV=52.0000000
    PlayerIronSightFOV=70.0000000
    IronSightPosition=(X=3.0000000,Y=0.0000000,Z=0.0000000)
    DOF_FG_FocalRadius=0.0000000
    PlayerViewOffset=(X=9.0000000,Y=10.0000000,Z=-4.0000000)
    IronSightMeshFOVCompensationScale=1.5000000
    FireOffset=(X=30.0000000,Y=4.5000000,Z=-4.0000000)
    DOF_BlendInSpeed=3.0000000
    DOF_FG_MaxNearBlurSize=3.5000000

    // Recoil
    maxRecoilPitch=350
    minRecoilPitch=280
    maxRecoilYaw=240
    minRecoilYaw=-240
    RecoilRate=0.0900000
    RecoilViewRotationScale=0.4000000
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=195
    RecoilISMinPitchLimit=65460

/*
    // Melee
    Begin Object Name=MeleeHelper_0
    end object
    MeleeAttackHelper=MeleeHelper_0
*/

    // Fire mode stats
    FireSightedAnims(0)=Shoot_Iron
    FireSightedAnims(1)=Shoot_Iron2
    FireSightedAnims(2)=Shoot_Iron3

    // DEFAULT_FIREMODE (0) - Single
    PenetrationPower(0)=3.0000000
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Single')
    WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Sharpshooter'
    FiringStatesArray(0)=WeaponSingleFiring
    WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_M14EBR'
    FireInterval(0)=0.1800000
    Spread(0)=0.0060000
    InstantHitDamage(0)=110.0000000
    InstantHitDamageTypes(0)=class'CWP.KFDT_Ballistic_M110'
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit

    // ALTFIRE_FIREMODE (1)
    FiringStatesArray(1)=WeaponSingleFiring
    FireInterval(1)=1.0000000
    InstantHitDamageTypes(1)=class'KFGame.KFDT_Ballistic'
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

    // BASH_FIREMODE (3)
    InstantHitDamage(3)=240.0000000
    InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Bludgeon_AR15'

    // Upgrade path
    WeaponUpgrades.Empty

/*
    // Components
    begin object name="SceneCapture2DComponent0"
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5000000
    end object
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
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'wep_1p_m110_mat.M110_SCOPE'
    ScopedSensitivityMod=8.0000000
    Components[0]=SceneCapture2DComponent0
}
