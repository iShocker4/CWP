class KFWeapDef_DeagleDualEx_Meme extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Pistol_DualDeagleEx_Meme", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DualDeagleEx_Meme"
	ImagePath="WEP_UI_Dual_Deagle_TEX.UI_WeaponSelect_DualDeagle"

	BuyPrice=85000
	AmmoPricePerMag=42

	EffectiveRange=50
}
