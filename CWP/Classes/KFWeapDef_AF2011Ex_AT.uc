class KFWeapDef_AF2011Ex_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Pistol_AF2011Ex_AT", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_AF2011Ex_AT"
	ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_AF2011"

	BuyPrice=750
	AmmoPricePerMag=27

	EffectiveRange=50
}
