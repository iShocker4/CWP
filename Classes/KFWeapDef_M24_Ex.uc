class KFWeapDef_M24_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 450 at 71 RPM, penetration 3"
		$ "\n*Control power: stumble 75, no knockdown, stun 300"
		$ "\n*Recoil: heavy bolt-action kick, below M107"
		$ "\n*Weight: 7, 6-round mag";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M24_Ex"
	ImagePath="WEP_M24_TEX.UI_M24"
	BuyPrice=45000
	AmmoPricePerMag=42
	EffectiveRange=95
}
