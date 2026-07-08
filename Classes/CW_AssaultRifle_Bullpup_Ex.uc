class CW_AssaultRifle_Bullpup_Ex extends KFWeap_AssaultRifle_Bullpup;

var private bool bServerFiringMode;

function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_AssaultRifle_Bullpup_Ex(PickedUpWeapon).bServerFiringMode);
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
	maxRecoilPitch=115
	minRecoilPitch=115
	maxRecoilYaw=90
	minRecoilYaw=-90
	RecoilRate=0.070
	InstantHitDamage(DEFAULT_FIREMODE)=33.0
	Spread(DEFAULT_FIREMODE)=0.0065
	InstantHitDamage(ALTFIRE_FIREMODE)=33.0
	Spread(ALTFIRE_FIREMODE)=0.0065
	WeaponUpgrades.Empty
}
