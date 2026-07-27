class KFWeapDef_M110_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 138 at 300 RPM, penetration 2"
		$ "\n*Control power: stumble 20, no knockdown, stun 30"
		$ "\n*Recoil: heavier than M14, controlled for rapid fire"
		$ "\n*Weight: 8, 30-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M110_Ex"
	ImagePath="WEP_M110_TEX.M110_UI"
	BuyPrice=80000
	AmmoPricePerMag=60
	EffectiveRange=120
}
