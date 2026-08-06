class KFWeapDef_SW500Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Revolver_SW500Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Revolver_SW500Ex"
	ImagePath="WEP_UI_SW_500_TEX.UI_WeaponSelect_SW500"
	
	BuyPrice=1250
	AmmoPricePerMag=25
	
	EffectiveRange=50
}
