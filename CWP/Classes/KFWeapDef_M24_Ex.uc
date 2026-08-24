class KFWeapDef_M24_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return Localize("CW_Rifle_M24_Ex", "ItemDescription", "CWP");
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M24_Ex"
	ImagePath="WEP_M24_TEX.UI_M24"
	BuyPrice=85000
	AmmoPricePerMag=42
	EffectiveRange=95
}
