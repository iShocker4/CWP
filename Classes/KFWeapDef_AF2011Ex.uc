//=============================================================================
// KFWeapDef_AF2011Ex
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? AF2011Ex ??????
// ?????????, ??????????, ????, ??? ????????????????? spawn
//=============================================================================

class KFWeapDef_AF2011Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Control power removed: knockdown/stumble/gun hit set lower"
		$ "\n*Vertical recoil: 550-650 -> 650-650"
		$ "\n*Horizontal recoil: -550~550 -> -225~225";
}
DefaultProperties
{
    WeaponClassPath="CWP.CW_Pistol_AF2011Ex"

    BuyPrice=750
    AmmoPricePerMag=27
    ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_AF2011"
    EffectiveRange=50
}
