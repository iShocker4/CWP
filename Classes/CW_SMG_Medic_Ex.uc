class CW_SMG_Medic_Ex extends KFWeap_SMG_Medic;

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
	LockChecktime=0.025
	LockAcquireTime=0.05

	// Ammo
	InitialSpareMags[0]=0

	// Recoil
	maxRecoilPitch=75
	minRecoilPitch=75

	// Upgrades
	WeaponUpgrades.Empty
}
