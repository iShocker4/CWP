//=============================================================================
// KFWeapDef_DualJCEx
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — JC (Jackal & Casull) คู่
// นำเข้าจาก AGST mod
//=============================================================================

class KFWeapDef_DualJCEx extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return "*Damage: 113 per bullet"
		$ "\n*Dual fire rate: 545 RPM"
		$ "\n*Weight: 10"
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
