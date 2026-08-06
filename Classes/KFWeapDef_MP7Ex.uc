class KFWeapDef_MP7Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_SMG_MP7Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_SMG_MP7Ex"
	ImagePath="WEP_UI_MP7_TEX.UI_WeaponSelect_MP7"

	BuyPrice=200
	AmmoPricePerMag=14

	EffectiveRange=70

	UpgradePrice[0]=500
	UpgradePrice[1]=600
	UpgradePrice[2]=700
	UpgradePrice[3]=1500

	UpgradeSellPrice[0]=375
	UpgradeSellPrice[1]=825
	UpgradeSellPrice[2]=1350
	UpgradeSellPrice[3]=2475
}
