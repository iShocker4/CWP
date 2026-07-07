class CW_Pistol_DualColt1911Ex_AT extends CW_Pistol_DualColt1911Ex;

var private bool bServerFiringMode;

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_Pistol_DualColt1911Ex_AT(PickedUpWeapon).bServerFiringMode);
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
	// ALTFIRE_FIREMODE already mirrors DEFAULT_FIREMODE stats in the base class,
	// only the firing state needs to switch to full-auto
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring

	SingleClass=class'CWP.CW_Pistol_Colt1911Ex_AT'
}
