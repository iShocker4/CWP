class KFWeapDef_AA12Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Shotgun_AA12Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Shotgun_AA12Ex"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_AA12"

	BuyPrice=1500
	AmmoPricePerMag=82

	EffectiveRange=30

	UpgradePrice[0]=1500

	UpgradeSellPrice[0]=1125
}
