class CW_Pistol_DualAF2011Ex_AT extends CW_Pistol_DualAF2011Ex;

var private bool bServerFiringMode;

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_Pistol_DualAF2011Ex_AT(PickedUpWeapon).bServerFiringMode);
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
	// ALTFIRE_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_PistolAF2011'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AF2011Ex'
	FireInterval(ALTFIRE_FIREMODE)=+0.13
	InstantHitDamage(ALTFIRE_FIREMODE)=53
	PenetrationPower(ALTFIRE_FIREMODE)=1.5
	Spread(ALTFIRE_FIREMODE)=0.01
	AmmoCost(ALTFIRE_FIREMODE)=2

	// Single class
	SingleClass=class'CWP.CW_Pistol_AF2011Ex_AT'
}
