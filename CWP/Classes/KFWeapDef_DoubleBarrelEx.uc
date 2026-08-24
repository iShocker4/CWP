class KFWeapDef_DoubleBarrelEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Shotgun_DoubleBarrelEx", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Shotgun_DoubleBarrelEx"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_DBShotgun"

	BuyPrice=750
	AmmoPricePerMag=13

	EffectiveRange=15

	UpgradePrice[0]=600
	UpgradePrice[1]=700
	UpgradePrice[2]=1500

	UpgradeSellPrice[0]=450
	UpgradeSellPrice[1]=975
	UpgradeSellPrice[2]=2100
}
