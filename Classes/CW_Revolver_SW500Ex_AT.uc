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

DefaultProperties
{
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_RevolverSW500'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_SW500'
	FireInterval(ALTFIRE_FIREMODE)=+0.24
	InstantHitDamage(ALTFIRE_FIREMODE)=190.0
	PenetrationPower(ALTFIRE_FIREMODE)=3.0
	Spread(ALTFIRE_FIREMODE)=0.015

	DualClass=class'CWP.CW_Revolver_DualSW500Ex_AT'
}
