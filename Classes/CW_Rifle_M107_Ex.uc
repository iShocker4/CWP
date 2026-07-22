class CW_Rifle_M107_Ex extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);
/* 
simulated event PostBeginPlay()
{
    super.PostBeginPlay();
     Runtime balance tuning disabled while adjusting FOV and mesh position.
     class'CWP_BalanceTuning'.static.ApplyM107(self);
}
*/

/*
simulated function float GetUpgradedAfflictionPower(EAfflictionType AfflictionType, float InPower, optional int FireMode = INDEX_NONE, optional int UpgradeIndex = INDEX_NONE)
{
    return class'CWP_BalanceTuning'.static.GetM107AfflictionPower(AfflictionType, super.GetUpgradedAfflictionPower(AfflictionType, InPower, FireMode, UpgradeIndex));
}
*/

/* 
simulated function int GetModifiedDamage(byte FireModeNum, optional vector RayDir)
{
    local int ModifiedDamage;
    local KFPerk_Sharpshooter SharpPerk;

    ModifiedDamage = super.GetModifiedDamage(FireModeNum, RayDir);

    if (FireModeNum == DEFAULT_FIREMODE)
    {
        SharpPerk = KFPerk_Sharpshooter(GetPerk());
        if (SharpPerk != none && SharpPerk.IsZTKnockdownActive())
        {
            ModifiedDamage = FCeil(ModifiedDamage * 1.2000000); // +20% เมื่อ Assassin active
        }
    }

    return ModifiedDamage;
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
    InventorySize=10
    GroupPriority=75.0000000
    WeaponSelectTexture=Texture2D'wep_ui_m107_tex.UI_m107'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Sharpshooter'


    // 2D scene capture
    begin object name="SceneCapture2DComponent0"
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5000000
    end object


    ScopedSensitivityMod=8.0000000
    ScopeLenseMICTemplate=MaterialInstanceConstant'wep_1p_m107_mat.WEP_1P_M107_Scope_MAT'
    ScopeMICIndex=1

    // FOV
    MeshFOV=55.0000000
    MeshIronSightFOV=27.0000000
    PlayerIronSightFOV=70.0000000

    // Depth of field
    DOF_BlendInSpeed=3.0000000
    DOF_FG_FocalRadius=0.0000000
    DOF_FG_MaxNearBlurSize=3.5000000

    // Content
    PackageKey="M107"
    FirstPersonMeshName="WEP_1P_M107_MESH.Wep_1stP_M107_Rig"
    FirstPersonAnimSetNames(0)="WEP_1P_M14EBR_ANIM.Wep_1stP_M14_EBR_Anim"
    PickupMeshName="WEP_3P_M107_MESH.Wep_M107_Pickup"
    AttachmentArchetypeName="WEP_M107_ARCH.Wep_M107_3P"
    MuzzleFlashTemplateName="WEP_M107_ARCH.Wep_M107_MuzzleFlash"

    // Ammo
    MagazineCapacity=10
    SpareAmmoCapacity=90
    InitialSpareMags=3

    // Zooming / Position
    PlayerViewOffset=(X=22.0000000,Y=11.5000000,Z=-4.0000000)
    IronSightPosition=(X=10.0000000,Y=-0.0700000,Z=-0.1250000)

    // AI warning system
    bWarnAIWhenAiming=true
    AimWarningDelay=(X=0.4000000,Y=0.8000000)

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

    // DEFAULT_FIREMODE (DEFAULT_FIREMODE) - Single
    FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
    WeaponProjectiles(DEFAULT_FIREMODE)=class'KFGameContent.KFProj_Bullet_M99'
    InstantHitDamage(DEFAULT_FIREMODE)=300.0000000 //650
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_M107'
    FireInterval(DEFAULT_FIREMODE)=0.4000000 //1.0
    PenetrationPower(DEFAULT_FIREMODE)=8.0000000
    Spread(DEFAULT_FIREMODE)=0.0001000
    FireOffset=(X=30.0000000,Y=3.0000000,Z=-2.5000000)

    // ALTFIRE_FIREMODE (ALTFIRE_FIREMODE)
    FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFGame.KFDT_Ballistic'
    FireInterval(ALTFIRE_FIREMODE)=1.0000000

    // BASH_FIREMODE (3)
    InstantHitDamageTypes(BASH_FIREMODE)=class'KFGameContent.KFDT_Bludgeon_M14EBR'
    InstantHitDamage(BASH_FIREMODE)=120.0000000

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M99.Play_WEP_M99_Fire_3P_Single', FirstPersonCue=AkEvent'WW_WEP_M99.Play_WEP_M99_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_M99.Play_WEP_M99_DryFire'

    // Custom animations
    FireSightedAnims(0)=Shoot_Iron
    FireSightedAnims(1)=Shoot_Iron2
    FireSightedAnims(2)=Shoot_Iron3

    // Attachments
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Heavy_Recoil'

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
