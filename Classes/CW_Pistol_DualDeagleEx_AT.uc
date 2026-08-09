class CW_Pistol_DualDeagleEx_AT extends CW_Pistol_DualDeagleEx;

var private bool bServerFiringMode;

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_Pistol_DualDeagleEx_AT(PickedUpWeapon).bServerFiringMode);
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

simulated state WeaponFiring
{
	simulated function FireAmmunition()
	{
		bFireFromRightWeapon = !bFireFromRightWeapon;
		Super.FireAmmunition();
	}
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleEx_AT'

	// ALTFIRE_FIREMODE already mirrors DEFAULT_FIREMODE stats in the base class,
	// only the firing state/icon need to switch to full-auto
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	FireInterval(ALTFIRE_FIREMODE)=+0.11 //0.14, matched to vanilla KFWeap_Pistol_DualDeagle

	// Single class
	SingleClass=class'CWP.CW_Pistol_DeagleEx_AT'
}
