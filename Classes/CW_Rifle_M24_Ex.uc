class CW_Rifle_M24_Ex extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var float LastFireInterval;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // Runtime balance tuning disabled while adjusting FOV and mesh position.
    // class'CWP_BalanceTuning'.static.ApplyM24(self);
}

/*
simulated function float GetUpgradedAfflictionPower(EAfflictionType AfflictionType, float InPower, optional int FireMode = INDEX_NONE, optional int UpgradeIndex = INDEX_NONE)
{
    return class'CWP_BalanceTuning'.static.GetM24AfflictionPower(AfflictionType, super.GetUpgradedAfflictionPower(AfflictionType, InPower, FireMode, UpgradeIndex));
}
*/

static simulated event KFGFxObject_TraderItems.EFilterTypeUI GetTraderFilter()
{
    return 2;
}

simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float out_PenetrationVal, optional int ImpactNum)
{
    local KFPerk InstigatorPerk;

    InstigatorPerk = GetPerk();
    if (InstigatorPerk != none)
    {
        InstigatorPerk.UpdatePerkHeadShots(Impact, InstantHitDamageTypes[int(FiringMode)], ImpactNum);
    }
    super.ProcessInstantHitEx(FiringMode, Impact, NumHits, out_PenetrationVal, ImpactNum);
}

event RecieveClientImpact(byte FiringMode, const out ImpactInfo Impact, optional out float PenetrationValue, optional int ImpactNum)
{
    super(KFWeapon).RecieveClientImpact(FiringMode, Impact, PenetrationValue, ImpactNum);
}

simulated function SetIronSights(bool bNewIronSights)
{
    super(KFWeapon).SetIronSights(bNewIronSights);
}

simulated function bool ShouldOwnerWalk()
{
    return super(KFWeapon).ShouldOwnerWalk();
}

simulated function StartFire(byte FireModeNum)
{
    if ((FireModeNum == 0) && ShouldAutoReload(FireModeNum))
    {
        FireModeNum = 2;
    }
    if (FireModeNum == 2)
    {
        BeginFire(FireModeNum);
        return;
    }
    super(KFWeapon).StartFire(FireModeNum);
}

simulated function name GetReloadAnimName(bool bTacticalReload)
{
    local name ReloadAnimName;
    local int ReloadAnimAmmoCount;

    if (AmmoCount[0] > 0)
    {
        // The M24 animation set only provides partial-reload variants through _4.
        // Keep the six-round magazine, but use the closest available variant at 5.
        ReloadAnimAmmoCount = Min(AmmoCount[0], 4);
        ReloadAnimName = (bTacticalReload ? 'Reload_Half_Elite' : 'Reload_Half');
        ReloadAnimName = name((string(ReloadAnimName) $ string('_')) $ string(ReloadAnimAmmoCount));
        return ReloadAnimName;
    }
    else
    {
        return (bTacticalReload ? 'Reload_Empty_Elite' : 'Reload_Empty');
    }
}

simulated function float GetFireInterval(byte FireModeNum)
{
    if ((FireModeNum == 0) && AmmoCount[FireModeNum] == 0)
    {
        return LastFireInterval;
    }
    return super(Weapon).GetFireInterval(FireModeNum);
}

// GetReloadRateScale — เพิ่มความเร็วรีโหลด 15% จากค่าเดิม
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
simulated function float GetReloadRateScale()
{
    return Super.GetReloadRateScale() * 0.85;
}

static simulated function float CalculateTraderWeaponStatDamage()
{
    local float BaseDamage, DoTDamage;
    local Class<KFDamageType> DamageType;

    BaseDamage = default.InstantHitDamage[0];
    DamageType = Class<KFDamageType>(default.InstantHitDamageTypes[0]);
    if ((DamageType != none) && DamageType.default.DoT_Type != 0)
    {
        DoTDamage = (DamageType.default.DoT_Duration / DamageType.default.DoT_Interval) * (BaseDamage * DamageType.default.DoT_DamageScale);
    }
    return (BaseDamage * float(default.NumPellets[0])) + DoTDamage;
}

static simulated function float CalculateTraderWeaponStatFireRate()
{
    return 60.0000000 / default.FireInterval[0];
}

defaultproperties
{
    // Inventory / Grouping
    InventorySize=7
    GroupPriority=75.0000000
    WeaponSelectTexture=Texture2D'WEP_M24_TEX.UI_M24'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Sharpshooter'


    // 2D scene capture
    begin object name="SceneCapture2DComponent0"
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=12.5000000
    end object


    ScopedSensitivityMod=8.0000000
    ScopeLenseMICTemplate=MaterialInstanceConstant'wep_1p_m24_mat.WEP_1P_M24_Scope_MAT'

    // FOV
    MeshFOV=65.0000000
    MeshIronSightFOV=45.0000000
    PlayerIronSightFOV=65.0000000
    IronSightMeshFOVCompensationScale=1.5000000

    // Depth of field
    DOF_FG_MaxNearBlurSize=0.5000000

    // Content
    PackageKey="M24"
    FirstPersonMeshName="WEP_1P_M24_MESH.WEP_1stP_M24_Rig"
    FirstPersonAnimSetNames(0)="wep_1p_mosin_anim.Wep_1stP_Mosin_ANIM"
    PickupMeshName="WEP_3P_M24_MESH.WEP_3rdP_M24_Pickup"
    AttachmentArchetypeName="WEP_M24_ARCH.Wep_Mosin_3P"
    MuzzleFlashTemplateName="WEP_Mosin_ARCH.Wep_Mosin_MuzzleFlash"

    // Ammo
    MagazineCapacity=6
    SpareAmmoCapacity=114
    InitialSpareMags=5

    // Zooming / Position
    PlayerViewOffset=(X=8.2500000,Y=13.0000000,Z=-3.5000000)
    IronSightPosition=(X=-3.0000000,Y=-0.0825000,Z=-2.4250000)

    // AI warning system
    bWarnAIWhenAiming=true
    AimWarningDelay=(X=0.4000000,Y=0.8000000)

    // Recoil
    maxRecoilPitch=850
    minRecoilPitch=700
    maxRecoilYaw=260
    minRecoilYaw=-260
    RecoilRate=0.0900000
    RecoilViewRotationScale=0.7000000
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=1450
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=50
    RecoilISMinYawLimit=65485
    RecoilISMaxPitchLimit=500
    RecoilISMinPitchLimit=65485

    // DEFAULT_FIREMODE (0)
    FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
    FiringStatesArray(DEFAULT_FIREMODE)=WeaponSingleFiring
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
    WeaponProjectiles(DEFAULT_FIREMODE)=class'KFGameContent.KFProj_Bullet_MosinNagant'
    InstantHitDamage(DEFAULT_FIREMODE)=400.0000000 //450
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_M24'
    FireInterval(DEFAULT_FIREMODE)=0.8500000
    PenetrationPower(DEFAULT_FIREMODE)=2.0000000
    Spread(DEFAULT_FIREMODE)=0.0010000
    FireOffset=(X=25.0000000,Y=3.0000000,Z=-2.5000000)

    // ALTFIRE_FIREMODE (1)
    FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
    FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFGame.KFDT_Ballistic'
    FireInterval(ALTFIRE_FIREMODE)=1.0000000

    // BASH_FIREMODE (3)
    InstantHitDamageTypes(BASH_FIREMODE)=class'KFGameContent.KFDT_Piercing_MosinNagant'
    InstantHitDamage(BASH_FIREMODE)=1000.0000000

    // Fire effects
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_MosinNagant.Play_MosinNagant_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_MosinNagant.Play_MosinNagant_Shoot_1P')
    WeaponDryFireSnd(0)=AkEvent'WW_WEP_MosinNagant.Play_MosinNagant_DryFire'

    // Custom animations
    FireSightedAnims(0)=Shoot_Iron
    FireSightedAnims(1)=Shoot_Iron2
    FireSightedAnims(2)=Shoot_Iron3

    // Attachments
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    BonesToLockOnEmpty(0)=RW_Bolt_Back
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'

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
    LastFireInterval=0.3000000
    SceneCapture=SceneCapture2DComponent0
    bUseAdditiveMoveAnim=false
    EjectedShellForegroundDuration=1.5000000
    Components[0]=SceneCapture2DComponent0
}
