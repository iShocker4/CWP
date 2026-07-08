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
	DroppedPickupClass=class'CW_DroppedPickup_Ex'
	InitialSpareMags[0]=0
	maxRecoilPitch=200
	minRecoilPitch=200
	InventorySize=7
	InstantHitDamage(DEFAULT_FIREMODE)=46.0
	InstantHitDamage(ALTFIRE_FIREMODE)=46.0
	WeaponUpgrades.Empty
}
