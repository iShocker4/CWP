class KFWeapDef_DualJCEx extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return "*Damage: 113 per bullet"
		$ "\n*Dual fire rate: 545 RPM"
		$ "\n*Recoil: moderate dual-pistol kick"
		$ "\n*Weight: 8"
		$ "\n*Heavy bash damage: 300";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_DualJCEx"
	ImagePath="WEP_1P_JC_TEX.Black"
	BuyPrice=60000 //100000
	AmmoPricePerMag=84 //42
	EffectiveRange=65 //50
}
