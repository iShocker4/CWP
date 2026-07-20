class KFWeapDef_M107_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 650 at 60 RPM, penetration 8"
		$ "\n*Control power: stumble 350, no knockdown, gun hit 300"
		$ "\n*Recoil: near M99, but slightly softer"
		$ "\n*Weight: 12, 10-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M107_Ex"
	ImagePath="WEP_UI_M107_TEX.UI_m107"
	BuyPrice=75000
	AmmoPricePerMag=53
	EffectiveRange=150
}
