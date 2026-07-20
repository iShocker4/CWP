class KFWeapDef_M110_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 110 at 333 RPM, penetration 3"
		$ "\n*Control power: no knockdown/stumble, stun 300"
		$ "\n*Weight: 6, 20-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M110_Ex"
	ImagePath="WEP_M110_TEX.M110_UI"
	BuyPrice=2300
	AmmoPricePerMag=20
	EffectiveRange=95
}
