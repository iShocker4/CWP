class CW_Rifle_Hemogoblin_Ex extends KFWeap_Rifle_Hemogoblin;

var private Texture2D SecondaryAmmoTextureDisableLockOn;
var private bool bDisableLockOn;

exec simulated function togglelockon()
{
	bDisableLockOn = !bDisableLockOn;
	ServerToggleLockOn(bDisableLockOn);
	ClientToggleLockOn(bDisableLockOn);
}

private unreliable server function ServerToggleLockOn(bool bDisableLockOnParam)
{
	bDisableLockOn = bDisableLockOnParam;
}

private unreliable client function ClientToggleLockOn(bool bDisableLockOnParam)
{
	bDisableLockOn = bDisableLockOnParam;
	Instigator.PlaySoundBase(KFInventoryManager(InvManager).SwitchFireModeEvent);
	SecondaryAmmoTexture = bDisableLockOnParam ? SecondaryAmmoTextureDisableLockOn : default.SecondaryAmmoTexture;
	KFPlayerController(Instigator.Controller).MyGFxHUD.PlayerBackpackContainer.RefreshWeapon(self);
}

function bool AllowTargetLockOn()
{
	return !bDisableLockOn && !Instigator.bNoWeaponFiring;
}

function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}

DefaultProperties
{
	// Inventory / Grouping
	// DroppedPickupClass=class'CW_DroppedPickup_Ex'

	// Medic / Lock-on
	SecondaryAmmoTextureDisableLockOn=Texture2D'Custom_UI_SecondaryAmmo_TEX.MedicDarts'
	HealAmount=20
	HealFullRechargeSeconds=10
	LockChecktime=0.025
	LockAcquireTime=0.05

	// Ammo
	MagazineCapacity[0]=6
	SpareAmmoCapacity[0]=56
	InitialSpareMags[0]=0

	// Recoil
	maxRecoilPitch=225
	minRecoilPitch=225

	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=100.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'Custom_KFDT_Ballistic_Hemogoblin_NoBleed_Ex'
	FireInterval(DEFAULT_FIREMODE)=0.25
	PenetrationPower(DEFAULT_FIREMODE)=0.0
	Spread(DEFAULT_FIREMODE)=0.006

	// Upgrades
	WeaponUpgrades.Empty
}
