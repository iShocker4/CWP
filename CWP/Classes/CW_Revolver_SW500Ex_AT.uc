class CW_Revolver_SW500Ex_AT extends CW_Revolver_SW500Ex;

var private bool bServerFiringMode;

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_Revolver_SW500Ex_AT(PickedUpWeapon).bServerFiringMode);
}

simulated function AltFireMode()
{
	super.AltFireMode();
	ServerSetAltFire(bUseAltFireMode);
}

reliable server function ServerSetAltFire(bool bAltFire)
{
	bServerFiringMode = bAltFire;
}

reliable client function ClientSetAltFire(bool bAltFire)
{
	bUseAltFireMode = bAltFire;
}

simulated function InstantFireClient()
{
	local vector StartTrace, EndTrace;
	local rotator AimRot;
	local array<ImpactInfo> ImpactList;
	local int Idx;
	local ImpactInfo RealImpact;
	local float CurPenetrationValue;
	local byte FlashFireMode;

	bInstantHit = true;

	StartTrace = GetSafeStartTraceLocation();
	AimRot = GetAdjustedAim(StartTrace);
	EndTrace = StartTrace + vector(AimRot) * GetTraceRange();

	bInstantHit = false;

	PenetrationPowerRemaining = GetInitialPenetrationPower(CurrentFireMode);
	CurPenetrationValue = PenetrationPowerRemaining;
	RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);

	if (Instigator != None)
	{
		FlashFireMode = CurrentFireMode;
		if (CurrentFireMode == ALTFIRE_FIREMODE)
		{
			FlashFireMode = DEFAULT_FIREMODE;
		}
		Instigator.SetFlashLocation(self, FlashFireMode, RealImpact.HitLocation);
	}

	if (Instigator != None && Instigator.IsLocallyControlled())
	{
		InstantFireClient_AddImpacts(StartTrace, AimRot, ImpactList);

		for (Idx = 0; Idx < ImpactList.Length; Idx++)
		{
			ProcessInstantHitEx(CurrentFireMode, ImpactList[Idx],, CurPenetrationValue, Idx);
		}

		if (Instigator.Role < ROLE_Authority)
		{
			SendClientImpactList(CurrentFireMode, ImpactList);
		}
	}
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.Custom_KFDT_Ballistic_SW500Ex_AT'

	// ALTFIRE_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_RevolverSW500'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'CWP.Custom_KFDT_Ballistic_SW500Ex_AT'
	FireInterval(ALTFIRE_FIREMODE)=+0.24
	InstantHitDamage(ALTFIRE_FIREMODE)=180.0
	PenetrationPower(ALTFIRE_FIREMODE)=3.0
	Spread(ALTFIRE_FIREMODE)=0.015

	// Fire Effects
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_3P', FirstPersonCue=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Fire_1P')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_SA_SW500.Play_WEP_SA_SW500_Handling_DryFire'

	// Dual class
	DualClass=class'CWP.CW_Revolver_DualSW500Ex_AT'
}
