class KFWeapDef_AF2011DualEx_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return class'CWP.KFWeapDef_AF2011DualEx'.static.GetItemDescription()
		$ "\n*Add:Switch full-auto fire mode";
}

DefaultProperties
{
	WeaponClassPath="CWP.KFWeap_Pistol_DualAF2011Ex_AT"
	ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011"

	BuyPrice=1500
	AmmoPricePerMag=54

	EffectiveRange=50
}
