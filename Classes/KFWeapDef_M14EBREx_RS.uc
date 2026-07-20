//=============================================================================
// KFWeapDef_M14EBREx_RS
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — M14 EBR Custom (ACOG)
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
// ดึง localization บางส่วนจาก M14 EBR ต้นฉบับ
//=============================================================================

class KFWeapDef_M14EBREx_RS extends KFWeaponDefinition abstract;

/* 
static function string GetItemCategory()
{
	return Localize("KFWeap_Rifle_M14EBR", "ItemCategory", "KFGameContent");
}
*/

static function string GetItemDescription()
{
	return "*Damage: 80 -> 121"
		$ "\n*Vertical recoil: 200-225 -> 225-225"
		$ "\n*Sharpshooter reload: 35% faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_M14EBR_RS"
	ImagePath="WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR"

	BuyPrice=30000
	AmmoPricePerMag=60 //53

	EffectiveRange=90
}
