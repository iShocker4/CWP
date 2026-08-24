class KFWeapDef_SW500Ex_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Revolver_SW500Ex_AT", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Revolver_SW500Ex_AT"
	ImagePath="WEP_UI_SW_500_TEX.UI_WeaponSelect_SW500"

	BuyPrice=1250
	AmmoPricePerMag=25

	EffectiveRange=50
}
