class KFWeapDef_M4Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("KFWeap_Shotgun_M4", "ItemDescription", "KFGameContent");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Shotgun_M4Ex"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Benelli"

	BuyPrice=1100
	AmmoPricePerMag=38

	EffectiveRange=35

	UpgradePrice[0]=700
	UpgradePrice[1]=1500

	UpgradeSellPrice[0]=525
	UpgradeSellPrice[1]=1650
}
