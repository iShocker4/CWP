//=============================================================================
// KFWeapDef_AF2011DualEx
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — AF2011Ex คู่
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
//=============================================================================

class KFWeapDef_AF2011DualEx extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Knockdown Power: 15 -> 0"
//        $"\n*Reload Speed 5% faster"
        $"\n*Vertical Recoil: 550 - 650 -> 650 - 650 (Min - Max)"
        $"\n*Horizontal Recoil: -550 to 500 -> -225 to 225 (Left - Right)";
}

DefaultProperties
{
    WeaponClassPath="CWP.KFWeap_Pistol_DualAF2011Ex"

    BuyPrice=1500
    AmmoPricePerMag=54
    ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011"
    EffectiveRange=50
}
