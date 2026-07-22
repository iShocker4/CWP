class CW_Rifle_M110_Ex extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // Runtime balance tuning disabled while adjusting FOV and mesh position.
    // class'CWP_BalanceTuning'.static.ApplyM110(self);
}

/*
simulated function float GetUpgradedAfflictionPower(EAfflictionType AfflictionType, float InPower, optional int FireMode = INDEX_NONE, optional int UpgradeIndex = INDEX_NONE)
{
    return class'CWP_BalanceTuning'.static.GetM110AfflictionPower(AfflictionType, super.GetUpgradedAfflictionPower(AfflictionType, InPower, FireMode, UpgradeIndex));
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
    InventorySize=6
    WeaponSelectTexture=Texture2D'WEP_M110_TEX.M110_UI'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Sharpshooter'


    // 2D scene capture
    begin object name="SceneCapture2DComponent0"
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5000000
    end object


    ScopedSensitivityMod=8.0000000
    ScopeLenseMICTemplate=MaterialInstanceConstant'wep_1p_m110_mat.M110_SCOPE'

    // FOV
    MeshFOV=70.0000000
    MeshIronSightFOV=52.0000000
    PlayerIronSightFOV=70.0000000
    IronSightMeshFOVCompensationScale=1.5000000

    // Depth of field
    DOF_BlendInSpeed=3.0000000
    DOF_FG_FocalRadius=0.0000000
    DOF_FG_MaxNearBlurSize=3.5000000

    // Content
    PackageKey="M110_SASS"
    FirstPersonMeshName="WEP_1P_M110_MESH.Wep_1stP_m110_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_AR15_9mm_ANIM.Wep_1stP_AR15_9mm_Anim"
    PickupMeshName="WEP_3P_M110_MESH.Wep_m110_Pickup"
    AttachmentArchetypeName="WEP_M110_ARCH.Wep_m110_3P"
    MuzzleFlashTemplateName="WEP_M110_ARCH.Wep_AR15_9MM_MuzzleFlash"

    // Ammo
    MagazineCapacity=20
    SpareAmmoCapacity=240
    InitialSpareMags=6

    // Zooming / Position
    PlayerViewOffset=(X=9.0000000,Y=10.0000000,Z=-4.0000000)
    IronSightPosition=(X=3.0000000,Y=0.0525000,Z=-0.0350000)

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

    // DEFAULT_FIREMODE (0) - Single
    FiringStatesArray(0)=WeaponSingleFiring
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
    WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_M14EBR'
    InstantHitDamage(0)=100.0000000 //110
    InstantHitDamageTypes(0)=class'CWP.KFDT_Ballistic_M110'
    FireInterval(0)=0.2500000 //0.18
    PenetrationPower(0)=3.0000000
    Spread(0)=0.0010000
    FireOffset=(X=30.0000000,Y=4.5000000,Z=-4.0000000)

    // ALTFIRE_FIREMODE (1)
    FiringStatesArray(1)=WeaponSingleFiring
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None
    InstantHitDamageTypes(1)=class'KFGame.KFDT_Ballistic'
    FireInterval(1)=1.0000000

    // BASH_FIREMODE (3)
    InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Bludgeon_AR15'
    InstantHitDamage(3)=240.0000000

    // Fire effects
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_MP7.Play_MP7_Fire_1P_Single')
    WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_MedicSMG.Play_SA_MedicSMG_Handling_DryFire'

    // Custom animations
    FireSightedAnims(0)=Shoot_Iron
    FireSightedAnims(1)=Shoot_Iron2
    FireSightedAnims(2)=Shoot_Iron3

    // Attachments
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true

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

    // Upgrade path
    WeaponUpgrades.Empty

    // Miscellaneous
    SceneCapture=SceneCapture2DComponent0
    Components[0]=SceneCapture2DComponent0
}
