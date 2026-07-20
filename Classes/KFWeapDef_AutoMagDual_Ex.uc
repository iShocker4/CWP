class KFWeapDef_AutoMagDual_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 140 per bullet at 462 RPM, penetration 4"
		$ "\n*Control power: no knockdown/stumble, gun hit 150"
		$ "\n*Recoil: stronger than Dual Deagle, below Dual SW500"
		$ "\n*Weight: 4, 18-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_DualAutoMag_Ex"
	ImagePath="WEP_UI_AutoMag_TEX.dualautomag_ui"
	BuyPrice=30000
	AmmoPricePerMag=42
	EffectiveRange=50
}
