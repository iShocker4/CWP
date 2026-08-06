//=============================================================================
// KFWeapDef_MG3Ex
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — MG3 Custom (Commando)
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
//=============================================================================

class KFWeapDef_MG3Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_LMG_MG3Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_LMG_MG3Ex"
	ImagePath="WEP_UI_MG3_TEX.UI_WeaponSelect_MG3"

	BuyPrice=2000
	AmmoPricePerMag=70

	EffectiveRange=68
}
