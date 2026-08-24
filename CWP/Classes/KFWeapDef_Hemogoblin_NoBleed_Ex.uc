class KFWeapDef_Hemogoblin_NoBleed_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Rifle_Hemogoblin_Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_Hemogoblin_Ex"
	ImagePath="WEP_UI_Bleeder_TEX.UI_WeaponSelect_Bleeder"
	BuyPrice=1100
	AmmoPricePerMag=30
	EffectiveRange=90
}
