class KFWeapDef_M24_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 300 at 71 RPM, penetration 3"
		$ "\n*Control power: no knockdown/stumble, stun 300"
		$ "\n*Weight: 7, 6-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M24_Ex"
	ImagePath="WEP_M24_TEX.UI_M24"
	BuyPrice=1700
	AmmoPricePerMag=42
	EffectiveRange=95
}
