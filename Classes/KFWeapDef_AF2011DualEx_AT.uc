class KFWeapDef_AF2011DualEx_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return class'CWP.KFWeapDef_AF2011DualEx'.static.GetItemDescription()
		$ "\n*Right-click toggles full-auto mode";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DualAF2011Ex_AT"
	ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011"

	BuyPrice=1500
	AmmoPricePerMag=54

	EffectiveRange=50
}
