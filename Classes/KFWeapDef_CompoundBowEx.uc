//=============================================================================
// KFWeapDef_CompoundBowEx
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — Compound Bow Custom (Sharpshooter)
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
//=============================================================================

class KFWeapDef_CompoundBowEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 250 -> 300"
		$"\n*ReloadSpeed: 10% faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Bow_CompoundBowEx"
	ImagePath="WEP_UI_CompoundBow_TEX.UI_WeaponSelect_Compound_Bow"

	BuyPrice=2000
	AmmoPricePerMag=16

	EffectiveRange=80
}
