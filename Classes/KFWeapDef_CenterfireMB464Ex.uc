//=============================================================================
// KFWeapDef_CenterfireMB464Ex
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — Centerfire MB464 Custom
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
// ดึง localization บางส่วนจาก Centerfire MB464 ต้นฉบับ
//=============================================================================

class KFWeapDef_CenterfireMB464Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 165 -> 180"
		$ "\n*Sharpshooter/Gunslinger reload: 20% faster"
		$ "\n*Draw and put-away are faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_CenterfireMB464Ex"
	ImagePath="WEP_UI_Centerfire_TEX.UI_WeaponSelect_Centerfire"

	BuyPrice=700 //650
	AmmoPricePerMag=55 //50

	EffectiveRange=70
}
