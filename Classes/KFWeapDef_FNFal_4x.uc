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
    return "*FireRate: 606 -> 496rpm"
        $"\n*Damage: 70 -> 75"
        $"\n*HorizontalRecoil: -165~190 -> 0~140 (pulls right only)"
        $"\n*VerticalRecoil: 165-200 -> 230-230"
        $"\n*ReloadSpeed: 5% faster";
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_AssaultRifle_FNFal_4xEx"
    ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
    BuyPrice=1500
    AmmoPricePerMag=47
    EffectiveRange=70
}
