class KFWeapDef_DeagleEx_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return class'CWP.KFWeapDef_DeagleEx'.static.GetItemDescription()
		$ "\n*Right-click toggles full-auto mode";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DeagleEx_AT"
	ImagePath="WEP_UI_Deagle_TEX.UI_WeaponSelect_Deagle"

	BuyPrice=550
	AmmoPricePerMag=21

	EffectiveRange=50

	//UpgradePrice[0]=700

	//UpgradeSellPrice[0]=525
}
