//=============================================================================
// CW_Pistol_DualJCEx
//=============================================================================
// ปืน JC (Jackal & Casull) คู่ — นำเข้าจาก AGST mod
//=============================================================================

class CW_Pistol_DualJCEx extends KFWeap_DualBase
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
	PackageKey="Jackal & Casull"
	FirstPersonMeshName="WEP_1P_JC_MESH.Wep_1stP_jackal_casull_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_Dual_Deagle_ANIM.Wep_1stP_Dual_Deagle_Anim"
	PickupMeshName="WEP_3P_JC_MESH.Wep_jackal_pickup"
	AttachmentArchetypeName="WEP_JC_ARCH.Wep_jackal_casull_3P"
	MuzzleFlashTemplateName="WEP_Dual_Deagle_ARCH.Wep_Dual_Deagle_MuzzleFlash"
	WeaponSelectTexture=Texture2D'WEP_1P_JC_TEX.Black'

	// Weapon behavior
	SingleClass=class'CWP.CW_Pistol_JCEx'
	bHasIronSights=true
	bCanBeReloaded=true
	bReloadFromMagazine=true
	bHasFireLastAnims=true
	BonesToLockOnEmpty(0)=RW_Slide
	BonesToLockOnEmpty(1)=RW_Bullets1

	// Inventory and trader sorting
	InventorySize=8
	GroupPriority=45.0000000

	// Ammo economy
	MagazineCapacity=16
	SpareAmmoCapacity=288
	InitialSpareMags=0

	// Sights and view offsets
	MeshIronSightFOV=77.0000000
	PlayerIronSightFOV=77.0000000
	IronSightPosition=(X=-1.0000000,Y=0.0000000,Z=-0.0500000)
	QuickWeaponDownRotation=(Pitch=-8192,Yaw=0,Roll=0)
	DOF_FG_FocalRadius=38.0000000
	PlayerViewOffset=(X=9.0000000,Y=0.0000000,Z=-5.0000000)
	FireOffset=(X=17.0000000,Y=4.0000000,Z=-2.2500000)
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

	// DEFAULT_FIREMODE (0)
	PenetrationPower(0)=2.0000000
	WeaponFireSnd(0)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
	WeaponDryFireSnd(0)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
	AssociatedPerkClasses(0)=class'KFGame.KFPerk_Gunslinger'
	FiringStatesArray(0)=WeaponSingleFiring
	WeaponProjectiles(0)=class'KFGameContent.KFProj_Bullet_Pistol50AE'
	FireInterval(0)=0.1100000
	Spread(0)=0.0100000
	InstantHitDamage(0)=156.0000 // Target 85,000 DPM rounded up
	InstantHitDamageTypes(0)=class'CWP.Custom_KFDT_Ballistic_JCEx'
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Projectile

	// ALTFIRE_FIREMODE (1)
	PenetrationPower(1)=2.0000000
	WeaponFireSnd(1)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P',FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
	WeaponDryFireSnd(1)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'
	FiringStatesArray(1)=WeaponSingleFiring
	WeaponProjectiles(1)=class'KFGameContent.KFProj_Bullet_Pistol50AE'
	FireInterval(1)=0.1100000
	Spread(1)=0.0100000
	InstantHitDamage(1)=156.0000 // Target 85,000 DPM rounded up
	InstantHitDamageTypes(1)=class'CWP.Custom_KFDT_Ballistic_JCEx'
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Projectile

	// BASH_FIREMODE (3)
	InstantHitDamage(3)=300.0000000 //240
	InstantHitDamageTypes(3)=class'KFGameContent.KFDT_Bludgeon_Deagle'

	// Upgrade path — disabled
	WeaponUpgrades.Empty

	// Miscellaneous
	BonesToLockOnEmpty_L(0)=LW_Slide
	BonesToLockOnEmpty_L(1)=LW_Bullets1
	LeftFireOffset=(X=17.0000000,Y=-4.0000000,Z=-2.2500000)
}
