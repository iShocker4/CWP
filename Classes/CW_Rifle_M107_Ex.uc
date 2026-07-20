class CW_Rifle_M107_Ex extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

defaultproperties
{
    // Content assets
    PackageKey="M107"
    FirstPersonMeshName="WEP_1P_M107_MESH.Wep_1stP_M107_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_M14EBR_ANIM.Wep_1stP_M14_EBR_Anim"
    PickupMeshName="WEP_3P_M107_MESH.Wep_M107_Pickup"
    AttachmentArchetypeName="WEP_M107_ARCH.Wep_M107_3P"
    MuzzleFlashTemplateName="WEP_M107_ARCH.Wep_M107_MuzzleFlash"
    WeaponSelectTexture=Texture2D'wep_ui_m107_tex.UI_m107'
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

    // Weapon behavior
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true

    // Inventory and trader sorting
    InventorySize=12
    GroupPriority=75.0000000

    // Ammo economy
    MagazineCapacity=10
    SpareAmmoCapacity=70
    InitialSpareMags=3

    // Sights and view offsets
    MeshFOV=70.0000000
    MeshIronSightFOV=27.0000000
    PlayerIronSightFOV=70.0000000
    IronSightPosition=(X=0.0000000,Y=-0.0160000,Z=-0.0160000)
    DOF_FG_FocalRadius=0.0000000
    PlayerViewOffset=(X=15.0000000,Y=11.5000000,Z=-4.0000000)
    FireOffset=(X=30.0000000,Y=3.0000000,Z=-2.5000000)
    DOF_BlendInSpeed=3.0000000
    DOF_FG_MaxNearBlurSize=3.5000000

    // Recoil
    maxRecoilPitch=1100
    minRecoilPitch=850
    maxRecoilYaw=700
    minRecoilYaw=-500
    RecoilRate=0.0850000
    RecoilViewRotationScale=0.8000000
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=150
    RecoilISMinYawLimit=65385
    RecoilISMaxPitchLimit=375
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
    PenetrationPower(0)=8.0000000
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_M99.Play_WEP_M99_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_M99.Play_WEP_M99_Fire_1P_Single')
    WeaponDryFireSnd(0)=AkEvent'WW_WEP_M99.Play_WEP_M99_DryFire'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Sharpshooter'
    FiringStatesArray(0)=WeaponSingleFiring
    WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_M99'
    FireInterval(0)=1.0000000
    Spread(0)=0.0060000
    InstantHitDamage(0)=650.0000000
    InstantHitDamageTypes(0)=class'CWP.KFDT_Ballistic_M107'
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit

    // ALTFIRE_FIREMODE (1)
    FiringStatesArray(1)=WeaponSingleFiring
    FireInterval(1)=1.0000000
    InstantHitDamageTypes(1)=class'KFGame.KFDT_Ballistic'
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

    // BASH_FIREMODE (3)
    InstantHitDamage(3)=270.0000000
    InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Bludgeon_M14EBR'


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
    AimWarningDelay=(X=0.4000000,Y=0.8000000)
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'wep_1p_m107_mat.WEP_1P_M107_Scope_MAT'
    ScopedSensitivityMod=8.0000000
    ScopeMICIndex=1
    bWarnAIWhenAiming=true
    Components[0]=SceneCapture2DComponent0
}
