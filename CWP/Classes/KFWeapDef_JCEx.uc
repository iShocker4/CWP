class KFWeapDef_JCEx extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return Localize("CW_Pistol_JCEx", "ItemDescription", "CWP");
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_JCEx"
	ImagePath="WEP_JC_TEX.ui_casull"
	BuyPrice=30000 //100000
	AmmoPricePerMag=42 //21
	EffectiveRange=100 //50
}
