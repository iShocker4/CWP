class KFWeapDef_P90Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_SMG_P90Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_SMG_P90Ex"
	ImagePath="WEP_UI_P90_TEX.UI_WeaponSelect_FNP90"

	BuyPrice=1100
	AmmoPricePerMag=36

	EffectiveRange=70

	UpgradePrice[0]=700
	UpgradePrice[1]=1500

	UpgradeSellPrice[0]=525
	UpgradeSellPrice[1]=1650
}
