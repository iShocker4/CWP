//=============================================================================
// CW_Pistol_JCEx
//=============================================================================
// ปืน JC (Casull) เดี่ยว — นำเข้าจาก AGST mod
//=============================================================================

class CW_Pistol_JCEx extends KFWeap_PistolBase
	config(Game)
	hidecategories(Navigation,Advanced,Collision,Mobile,Movement,Object,Physics,Attachment,Debug);

simulated function Projectile ProjectileFire()
{
	local Vector StartTrace, EndTrace, RealStartLoc, AimDir;
	local ImpactInfo TestImpact;
	local Vector DirA, DirB;
	local Quat Q;
	local Class<KFProjectile> MyProjectileClass;

	MyProjectileClass = GetKFProjectileClass();
	StartTrace = GetSafeStartTraceLocation();
	AimDir = Vector(GetAdjustedAim(StartTrace));
	RealStartLoc = GetPhysicalFireStartLoc(AimDir);
	EndTrace = StartTrace + (AimDir * (GetTraceRange()));
	TestImpact = CalcWeaponFire(StartTrace, EndTrace);
	if (Instigator != none)
	{
		Instigator.SetFlashLocation(self, CurrentFireMode, TestImpact.HitLocation);
	}
	if ((Role == ROLE_Authority) || (MyProjectileClass.default.bUseClientSideHitDetection && MyProjectileClass.default.bNoReplicationToInstigator && (Instigator != none) && Instigator.IsLocallyControlled()))
	{
		if (StartTrace != RealStartLoc)
		{
			DirB = AimDir;
			AimDir = Normal(TestImpact.HitLocation - RealStartLoc);
			DirA = AimDir;
			if ((DirA Dot DirB) < 0.9950000)
			{
				Q = QuatFromAxisAndAngle(Normal(DirB Cross DirA), 0.1000000);
				AimDir = QuatRotateVector(Q, DirB);
			}
		}
		return SpawnAllProjectiles(MyProjectileClass, RealStartLoc, AimDir);
	}
	return none;
}

defaultproperties
{
	// Content assets
	PackageKey="Casull"
	FirstPersonMeshName="WEP_1P_JC_MESH.Wep_1stP_casull_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_Deagle_ANIM.Wep_1st_Deagle_Anim"
	PickupMeshName="WEP_3P_JC_MESH.Wep_casull_pickup"
	AttachmentArchetypeName="WEP_JC_ARCH.Wep_casull_3P"
	MuzzleFlashTemplateName="WEP_Deagle_ARCH.Wep_Deagle_MuzzleFlash"
	WeaponSelectTexture=Texture2D'WEP_JC_TEX.ui_casull'
	WeaponFireWaveForm=ForceFeedbackWaveform'FX_ForceFeedback_ARCH.Gunfire.Medium_Recoil'

	// Weapon behavior
	bHasIronSights=true
	bCanBeReloaded=true
	bReloadFromMagazine=true
	bHasFireLastAnims=true
	DualClass=class'CWP.CW_Pistol_DualJCEx'
	BonesToLockOnEmpty(0)=RW_Slide
	BonesToLockOnEmpty(1)=RW_Bullets1

	// Inventory and trader sorting
	InventorySize=4
	GroupPriority=25.0000000
	AmmoPickupScale=2.0000000

	// Ammo economy
	MagazineCapacity=8
	SpareAmmoCapacity=144
	InitialSpareMags=0

	// Sights and view offsets
	MeshIronSightFOV=77.0000000
	PlayerIronSightFOV=77.0000000
	IronSightPosition=(X=11.0000000,Y=0.0000000,Z=-0.0500000)
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

	// Fire mode stats
	FireSightedAnims(0)=Shoot_Iron
	FireSightedAnims(1)=Shoot_Iron2
	FireSightedAnims(2)=Shoot_Iron3

	// DEFAULT_FIREMODE (0)
	PenetrationPower(0)=4.0000000
	WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
	WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
	AssociatedPerkClasses(0)=class'KFGame.KFPerk_Gunslinger'
	FiringStatesArray(0)=WeaponSingleFiring
	WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_Pistol50AE'
	FireInterval(0)=0.2000000
	Spread(0)=0.0100000
	InstantHitDamage(0)=113.0000000 //400
	InstantHitDamageTypes(0)=class'CWP.Custom_KFDT_Ballistic_JCEx'
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile

	// ALTFIRE_FIREMODE (1)
	FiringStatesArray(1)=WeaponSingleFiring
	FireInterval(1)=1.0000000
	InstantHitDamageTypes(1)=class'KFGame.KFDT_Ballistic'
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_None

	// BASH_FIREMODE (3)
	InstantHitDamage(3)=300.0000000 //220
	InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Bludgeon_Deagle'

	// Upgrade path — disabled
	WeaponUpgrades.Empty
}
