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

DefaultProperties
{
	// ALTFIRE_FIREMODE — full-auto toggle, same stats as DEFAULT_FIREMODE
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_PistolColt1911'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_Colt1911'
	FireInterval(ALTFIRE_FIREMODE)=+0.175
	InstantHitDamage(ALTFIRE_FIREMODE)=50.0
	Spread(ALTFIRE_FIREMODE)=0.015

	DualClass=class'CWP.CW_Pistol_DualColt1911Ex_AT'
}
