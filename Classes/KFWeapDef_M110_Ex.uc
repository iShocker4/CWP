class KFWeapDef_M110_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 110 at 333 RPM, penetration 3"
		$ "\n*Control power: stumble 25, no knockdown, stun 300"
		$ "\n*Recoil: heavier than M14, controlled for rapid fire"
		$ "\n*Price: 55000"
		$ "\n*Weight: 6, 20-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M110_Ex"
	ImagePath="WEP_M110_TEX.M110_UI"
	BuyPrice=55000
	AmmoPricePerMag=60
	EffectiveRange=95
}
