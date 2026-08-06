class KFWeapDef_AutoMag_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return Localize("CW_Pistol_AutoMag_Ex", "ItemDescription", "CWP");
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_AutoMag_Ex"
	ImagePath="WEP_UI_AutoMag_TEX.automag_ui"
	BuyPrice=50000 //15000
	AmmoPricePerMag=21
	EffectiveRange=50
}
