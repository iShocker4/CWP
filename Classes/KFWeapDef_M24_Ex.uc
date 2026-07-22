class KFWeapDef_M24_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 400 at 71 RPM, penetration 3"
		$ "\n*Control power: stumble 75, no knockdown, no stun"
		$ "\n*Recoil: heavy bolt-action kick, below M107"
		$ "\n*Weight: 7, 6-round mag"
		$ "\n*ReloadSpeed: 15% faster";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M24_Ex"
	ImagePath="WEP_M24_TEX.UI_M24"
	BuyPrice=85000
	AmmoPricePerMag=42
	EffectiveRange=95
}
