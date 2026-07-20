class CW_Rifle_M24_Ex extends KFWeap_ScopedBase
    config(Game)
    hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

var float LastFireInterval;

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

    if (AmmoCount[0] > 0)
    {
        ReloadAnimName = (bTacticalReload ? 'Reload_Half_Elite' : 'Reload_Half');
        ReloadAnimName = name((string(ReloadAnimName) $ string('_')) $ string(AmmoCount[0]));
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
    // Content assets
    PackageKey="M24"
    FirstPersonMeshName="WEP_1P_M24_MESH.WEP_1stP_M24_Rig"
    FirstPersonAnimSetNames(0)="wep_1p_mosin_anim.Wep_1stP_Mosin_ANIM"
    PickupMeshName="WEP_3P_M24_MESH.WEP_3rdP_M24_Pickup"
    AttachmentArchetypeName="WEP_M24_ARCH.Wep_Mosin_3P"
    MuzzleFlashTemplateName="WEP_Mosin_ARCH.Wep_Mosin_MuzzleFlash"
    WeaponSelectTexture=Texture2D'WEP_M24_TEX.UI_M24'
    WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'

    // Weapon behavior
    bHasIronSights=true
    bCanBeReloaded=true
    bReloadFromMagazine=true
    BonesToLockOnEmpty(0)=RW_Bolt_Back

    // Inventory and trader sorting
    InventorySize=7
    GroupPriority=75.0000000

    // Ammo economy
    MagazineCapacity=6
    SpareAmmoCapacity=114
    InitialSpareMags=5

    // Sights and view offsets
    MeshFOV=65.0000000
    MeshIronSightFOV=45.0000000
    PlayerIronSightFOV=65.0000000
    IronSightPosition=(X=-3.0000000,Y=0.0000000,Z=-2.0000000)
    PlayerViewOffset=(X=8.0000000,Y=7.0000000,Z=-3.5000000)
    IronSightMeshFOVCompensationScale=1.5000000
    FireOffset=(X=25.0000000,Y=3.0000000,Z=-2.5000000)
    DOF_FG_MaxNearBlurSize=2.5000000

    // Recoil
    maxRecoilPitch=550
    minRecoilPitch=400
    maxRecoilYaw=150
    minRecoilYaw=-150
    RecoilRate=0.0800000
    RecoilViewRotationScale=0.6000000
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=1250
    RecoilMinPitchLimit=64785
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
    FireSightedAnims(0)=Shoot_Iron
    FireSightedAnims(1)=Shoot_Iron2
    FireSightedAnims(2)=Shoot_Iron3

    // DEFAULT_FIREMODE (0)
    FireModeIconPaths(0)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
    PenetrationPower(0)=3.0000000
    WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_MosinNagant.Play_MosinNagant_Shoot_3P',FirstPersonCue=AkEvent'WW_WEP_MosinNagant.Play_MosinNagant_Shoot_1P')
    WeaponDryFireSnd(0)=AkEvent'WW_WEP_MosinNagant.Play_MosinNagant_DryFire'
    AssociatedPerkClasses(0)=class'KFGame.KFPerk_Sharpshooter'
    FiringStatesArray(0)=WeaponSingleFiring
    WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_MosinNagant'
    FireInterval(0)=0.8500000
    Spread(0)=0.0070000
    InstantHitDamage(0)=300.0000000
    InstantHitDamageTypes(0)=class'CWP.KFDT_Ballistic_M24'
    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit

    // ALTFIRE_FIREMODE (1)
    FireModeIconPaths(1)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
    FiringStatesArray(1)=WeaponFiring
    FireInterval(1)=1.0000000
    InstantHitDamageTypes(1)=class'KFGame.KFDT_Ballistic'
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

    // BASH_FIREMODE (3)
    InstantHitDamage(3)=100.0000000
    InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Piercing_MosinNagant'

    // Upgrade path
    WeaponUpgrades.Empty

/*
    // Components
    begin object name="SceneCapture2DComponent0"
        TextureTarget=TextureRenderTarget2D'Wep_Mat_Lib.WEP_ScopeLense_Target'
        FieldOfView=6.2500000
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
    LastFireInterval=0.3000000
    SceneCapture=SceneCapture2DComponent0
    ScopeLenseMICTemplate=MaterialInstanceConstant'wep_1p_m24_mat.WEP_1P_M24_Scope_MAT'
    ScopedSensitivityMod=8.0000000
    bWarnAIWhenAiming=true
    bUseAdditiveMoveAnim=false
    EjectedShellForegroundDuration=1.5000000
    Components[0]=SceneCapture2DComponent0
}
