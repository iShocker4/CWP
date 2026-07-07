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
    return "*Damage: 80 -> 100"
//        $"\n*Damage: 70 -> 75"
//        $"\n*HorizontalRecoil: -165~190 -> 0~140 (pulls right only)"
//        $"\n*VerticalRecoil: 165-200 -> 230-230"
        $"\n*ReloadSpeed: 25% faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_M14EBR_RS"
	ImagePath="WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR"

	BuyPrice=20000
	AmmoPricePerMag=60 //53

	EffectiveRange=90
}
