class KFWeapDef_M107_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return Localize("CW_Rifle_M107_Ex", "ItemDescription", "CWP");
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M107_Ex"
	ImagePath="WEP_UI_M107_TEX.UI_m107"
	BuyPrice=99999 //75000
	AmmoPricePerMag=53
	EffectiveRange=150
}
