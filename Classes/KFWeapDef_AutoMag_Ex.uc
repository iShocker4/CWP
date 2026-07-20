class KFWeapDef_AutoMag_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 120 at 300 RPM"
		$ "\n*Control power: no knockdown/stumble, gun hit 150"
		$ "\n*Weight: 2, 7-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_AutoMag_Ex"
	ImagePath="WEP_UI_AutoMag_TEX.automag_ui"
	BuyPrice=2000
	AmmoPricePerMag=21
	EffectiveRange=50
}
