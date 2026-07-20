class KFWeapDef_M107_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 650 at 60 RPM, penetration 8"
		$ "\n*Control power: no knockdown/stumble, gun hit 300"
		$ "\n*Weight: 12, 10-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M107_Ex"
	ImagePath="WEP_UI_M107_TEX.UI_m107"
	BuyPrice=3000
	AmmoPricePerMag=53
	EffectiveRange=100
}
