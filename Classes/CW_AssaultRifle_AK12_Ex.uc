class CW_AssaultRifle_AK12_Ex extends KFWeap_AssaultRifle_AK12;

var private bool bServerFiringMode;

function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_AssaultRifle_AK12_Ex(PickedUpWeapon).bServerFiringMode);
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
	// Inventory / Grouping
	// DroppedPickupClass=class'CW_DroppedPickup_Ex'
	InventorySize=7

	// Ammo
	InitialSpareMags[0]=0

	// Recoil
	maxRecoilPitch=200
	minRecoilPitch=200

	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=46.0

	// ALTFIRE_FIREMODE
	InstantHitDamage(ALTFIRE_FIREMODE)=46.0

	// Upgrades
	WeaponUpgrades.Empty
}
