class KFWeapDef_M110_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 121 at 400 RPM, penetration 2"
		$ "\n*Control power: stumble 10, no knockdown, no stun"
		$ "\n*Recoil: heavier than M14, controlled for rapid fire"
		$ "\n*Weight: 8, 25-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M110_Ex"
	ImagePath="WEP_M110_TEX.M110_UI"
	BuyPrice=70000
	AmmoPricePerMag=60
	EffectiveRange=95
}
