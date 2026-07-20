//=============================================================================
// KFWeapDef_FNFal_4x
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — FN FAL 4x ACOG
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
// ดึง localization บางส่วนจาก FNFal ต้นฉบับ
//=============================================================================

class KFWeapDef_FNFal_4x extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 70 -> 75"
		$ "\n*Fire rate: 606 -> 496 RPM"
		$ "\n*Recoil is heavier and pulls right"
		$ "\n*Reload speed: 5% faster";
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_AssaultRifle_FNFal_4xEx"
    ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
    BuyPrice=1500
    AmmoPricePerMag=47
    EffectiveRange=70
}
