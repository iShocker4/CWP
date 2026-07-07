//=============================================================================
// KFWeapDef_AF2011Ex
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — AF2011Ex เดี่ยว
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
//=============================================================================

class KFWeapDef_AF2011Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "Knockdown Power: 15 -> 0\n Vertical Recoil: 550 - 650 -> 650 - 650 (Min - Max) \n Horizontal Recoil: -550 to 500 -> -225 to 225 (Left - Right)";
}
DefaultProperties
{
    WeaponClassPath="CWP.KFWeap_Pistol_AF2011Ex"

    BuyPrice=750
    AmmoPricePerMag=27
    ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_AF2011"
    EffectiveRange=50
}
