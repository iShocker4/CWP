//=============================================================================
// KFWeapDef_CenterfireMB464Meme
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — Centerfire MB464 Custom
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
// ดึง localization บางส่วนจาก Centerfire MB464 ต้นฉบับ
//=============================================================================

class KFWeapDef_CenterfireMB464Meme extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*More Damage: 165 -> 220"
		$"\n*=== Sharpshooter Perk ==="
		$"\n*Reload speed: 50% Faster"
		$"\n*=== Gunslinger Perk ==="
		$"\n*Reload speed: 60% Faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_CenterfireMB464Meme"
	ImagePath="WEP_UI_Centerfire_TEX.UI_WeaponSelect_Centerfire"

	BuyPrice=30000 //650
	AmmoPricePerMag=55 //50

	EffectiveRange=70
}
