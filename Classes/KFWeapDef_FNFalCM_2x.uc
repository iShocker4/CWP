//=============================================================================
// KFWeapDef_FNFalCM_2x
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — FN FAL 2x Scope
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
// ดึง localization บางส่วนจาก FNFal ต้นฉบับ
//=============================================================================

class KFWeapDef_FNFalCM_2x extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
    return "*Damage: 70 -> 60"
        $"\n*Scope: x4 ACOG -> x2"
        $"\n*Penetration: 2.0 -> 1.0"
        $"\n*ReloadSpeed: 5% faster"
        $"\n*RPM: 606 -> 700"
        $"\n*SpareAmmo: 160 -> 280"
        $"\n*VerticalRecoil: 165-200 -> 165-165"
        $"\n*HorizontalRecoil: -165~190 -> -125~145";
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_AssaultRifle_FNFalCM_2xEx"
    ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
    BuyPrice=2500
    AmmoPricePerMag=47
    EffectiveRange=70
}
