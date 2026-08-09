class CW_AssaultRifle_SCAREx extends KFWeap_AssaultRifle_SCAR;

var private bool bServerFiringMode;

Simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_AssaultRifle_SCAR');
}

/*
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}
*/

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_AssaultRifle_SCAREx(PickedUpWeapon).bServerFiringMode);
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
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_SCAREx'

	// Ammo
	MagazineCapacity[0]=20
	SpareAmmoCapacity[0]=480
	InitialSpareMags[0]=0
	
	// Recoil
	maxRecoilPitch=150
	minRecoilPitch=150 // 125

	// DEFAULT_FIREMODE
	FireInterval(DEFAULT_FIREMODE)=+0.096 // 625 RPM
	InstantHitDamage(DEFAULT_FIREMODE)=55.0 //57

	// ALT_FIREMODE
	FireInterval(ALTFIRE_FIREMODE)=+0.096 // 625 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=55.0 //57

	WeaponUpgrades.Empty
}
