class KFWeapDef_HRGCrossbowEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Bow_HRGCrossbowEx", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Bow_HRGCrossbowEx"
	ImagePath="WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow"

	BuyPrice=1000
	AmmoPricePerMag=11

	EffectiveRange=80
}
