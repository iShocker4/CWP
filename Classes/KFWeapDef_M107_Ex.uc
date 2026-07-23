class KFWeapDef_M107_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 300 at 200 RPM, penetration 8"
		$ "\n*Control power: stumble 0, no knockdown, gun hit 300"
		$ "\n*Recoil: near M99, but slightly softer"
		$ "\n*Weight: 10, 10-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M107_Ex"
	ImagePath="WEP_UI_M107_TEX.UI_m107"
	BuyPrice=99999 //75000
	AmmoPricePerMag=53
	EffectiveRange=150
}
