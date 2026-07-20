//=============================================================================
// KFWeapDef_JCEx
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? JC (Casull) ??????
// ????????? AGST mod
//=============================================================================

class KFWeapDef_JCEx extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return "*Damage: 113"
		$ "\n*Fire rate: 300 RPM"
		$ "\n*Recoil: moderate and controlled for its power"
		$ "\n*Weight: 5"
		$ "\n*Heavy bash damage: 300";
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_JCEx"
	ImagePath="WEP_JC_TEX.ui_casull"
	BuyPrice=30000 //100000
	AmmoPricePerMag=42 //21
	EffectiveRange=100 //50
}
