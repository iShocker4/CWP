class KFWeapDef_SW500Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 160 -> 190";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Revolver_SW500Ex"
	ImagePath="WEP_UI_SW_500_TEX.UI_WeaponSelect_SW500"
	
	BuyPrice=1250
	AmmoPricePerMag=25
	
	EffectiveRange=50
}
