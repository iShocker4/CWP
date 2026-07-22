//=============================================================================
// CW_AssaultRifle_FNFal_4xMeme
//=============================================================================

class CW_AssaultRifle_FNFal_4xMeme extends CW_AssaultRifle_FNFal_4xEx;

var private float ReloadSpeedMod;
var private float EmptyReloadRateScale;

simulated event SetWeapon()
{
	super.SetWeapon();
	UpdateReloadSpeedMod();
}

simulated function NotifyBeginState()
{
	super(KFWeapon).NotifyBeginState();
	UpdateReloadSpeedMod();
}

simulated function UpdateReloadSpeedMod()
{
	local KFPerk_Sharpshooter SharpPerk;

	ReloadSpeedMod = 1.0f;

	SharpPerk = KFPerk_Sharpshooter(GetPerk());
	if (SharpPerk != none && !SharpPerk.IsTacticalReloadActive())
	{
		ReloadSpeedMod = 0.75f;
	}
}

SimuLated function float GetReloadRateScale()
{
	local float Rate;

	Rate = Super(KFWeapon).GetReloadRateScale() * ReloadSpeedMod;

	if (AmmoCount[0] <= 0)
	{
		Rate *= EmptyReloadRateScale;
	}

	return Rate;
}

DefaultProperties
{
	// Inventory / Grouping
	InventorySize=9

	// Perk / Reload
	ReloadSpeedMod=1.0
	EmptyReloadRateScale=0.9175258

	// Content
	PackageKey="FNFAL_4x_MEME"

	// Recoil
	maxRecoilYaw=0
	minRecoilYaw=0

	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=91.0
}
