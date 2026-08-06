class KFWeapDef_SW500DualEx_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Revolver_DualSW500Ex_AT", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Revolver_DualSW500Ex_AT"
	ImagePath="WEP_UI_Dual_SW_500_TEX.UI_WeaponSelect_DualSW500"

	BuyPrice=2500
	AmmoPricePerMag=50

	EffectiveRange=50
}
