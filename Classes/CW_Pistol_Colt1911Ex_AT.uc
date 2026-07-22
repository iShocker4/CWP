class CW_Pistol_Colt1911Ex_AT extends CW_Pistol_Colt1911Ex;

var private bool bServerFiringMode;

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_Pistol_Colt1911Ex_AT(PickedUpWeapon).bServerFiringMode);
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
	// ALTFIRE_FIREMODE — full-auto toggle, same stats as DEFAULT_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_PistolColt1911'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_Colt1911'
	FireInterval(ALTFIRE_FIREMODE)=+0.175
	InstantHitDamage(ALTFIRE_FIREMODE)=50.0
	Spread(ALTFIRE_FIREMODE)=0.015

	// Fire Effects
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_M', FirstPersonCue=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Fire_Single_S')
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_1911.Play_WEP_SA_1911_Handling_DryFire'

	// Dual class
	DualClass=class'CWP.CW_Pistol_DualColt1911Ex_AT'
}
