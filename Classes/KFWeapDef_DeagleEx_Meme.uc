class KFWeapDef_DeagleEx_Meme extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Pistol_DeagleEx_Meme", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DeagleEx_Meme"
	ImagePath="WEP_UI_Deagle_TEX.UI_WeaponSelect_Deagle"

	BuyPrice=42500
	AmmoPricePerMag=21

	EffectiveRange=50
}
