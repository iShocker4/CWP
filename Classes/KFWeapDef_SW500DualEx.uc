class KFWeapDef_SW500DualEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 160 -> 190"
		$ "\n*Stumble power: 60 -> 50"
		$ "\n*Reload speed: 40% faster"
		$ "\n*Recoil: stronger vertical kick";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Revolver_DualSW500Ex"
	ImagePath="WEP_UI_Dual_SW_500_TEX.UI_WeaponSelect_DualSW500"
	
	BuyPrice=2500
	AmmoPricePerMag=50
	
	EffectiveRange=50
}
