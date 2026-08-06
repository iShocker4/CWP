class KFWeapDef_AutoMagDual_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return Localize("CW_Pistol_DualAutoMag_Ex", "ItemDescription", "CWP");
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_DualAutoMag_Ex"
	ImagePath="WEP_UI_AutoMag_TEX.dualautomag_ui"
	BuyPrice=100000
	AmmoPricePerMag=42
	EffectiveRange=50
}
