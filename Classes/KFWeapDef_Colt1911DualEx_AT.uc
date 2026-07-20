class KFWeapDef_Colt1911DualEx_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return class'CWP.KFWeapDef_Colt1911DualEx'.static.GetItemDescription()
		$ "\n*Right-click toggles full-auto mode";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DualColt1911Ex_AT"
	ImagePath="WEP_UI_Dual_M1911_TEX.UI_WeaponSelect_DualM1911"

	BuyPrice=650
	AmmoPricePerMag=26

	EffectiveRange=50

	UpgradePrice[0]=600
	UpgradePrice[1]=700

	UpgradeSellPrice[0]=450
	UpgradeSellPrice[1]=975
}
