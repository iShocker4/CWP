class KFWeapDef_M110_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 100 at 300 RPM, penetration 3"
		$ "\n*Control power: stumble 25, no knockdown, no stun"
		$ "\n*Recoil: heavier than M14, controlled for rapid fire"
		$ "\n*Price: 70000"
		$ "\n*Weight: 6, 20-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M110_Ex"
	ImagePath="WEP_M110_TEX.M110_UI"
	BuyPrice=70000
	AmmoPricePerMag=60
	EffectiveRange=95
}
