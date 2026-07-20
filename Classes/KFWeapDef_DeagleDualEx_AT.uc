class KFWeapDef_DeagleDualEx_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return class'CWP.KFWeapDef_DeagleDualEx'.static.GetItemDescription()
		$ "\n*Right-click toggles full-auto mode";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DualDeagleEx_AT"
	ImagePath="WEP_UI_Dual_Deagle_TEX.UI_WeaponSelect_DualDeagle"

	BuyPrice=1100
	AmmoPricePerMag=42

	EffectiveRange=50

	//UpgradePrice[0]=700

	//UpgradeSellPrice[0]=525
}
