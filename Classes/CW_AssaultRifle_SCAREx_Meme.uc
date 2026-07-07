class CW_AssaultRifle_SCAREx_Meme extends KFWeap_AssaultRifle_SCAR;

var private bool bServerFiringMode;

Simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_AssaultRifle_SCAR');
}

simulated function float GetReloadRateScale()
{
	return Super.GetReloadRateScale() * 0.85f;
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
	ClientSetAltFire(CW_AssaultRifle_SCAREx_Meme(PickedUpWeapon).bServerFiringMode);
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
	// Ammo
	MagazineCapacity[0]=30 //20
	SpareAmmoCapacity[0]=420 //340
	InitialSpareMags[0]=0
	
	// Recoil
	maxRecoilPitch=150
	minRecoilPitch=150 // 125

	// DEFAULT_FIREMODE
	FireInterval(DEFAULT_FIREMODE)=+0.09231 //650 RPM 0.096 = 625 RPM
	InstantHitDamage(DEFAULT_FIREMODE)=80.0 //55

	// ALT_FIREMODE
	FireInterval(ALTFIRE_FIREMODE)=+0.09231 //650 RPM 0.096 = 625 RPM
	InstantHitDamage(ALTFIRE_FIREMODE)=80.0 //55

	WeaponUpgrades.Empty
}
