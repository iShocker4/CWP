class KFWeapDef_AutoMag_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 140 at 300 RPM, penetration 4"
		$ "\n*Control power: no knockdown/stumble, gun hit 150"
		$ "\n*Recoil: stronger than Deagle, below SW500"
		$ "\n*Weight: 2, 9-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_AutoMag_Ex"
	ImagePath="WEP_UI_AutoMag_TEX.automag_ui"
	BuyPrice=15000
	AmmoPricePerMag=21
	EffectiveRange=50
}
