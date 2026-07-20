//=============================================================================
// KFWeapDef_AF2011DualEx
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? AF2011Ex ???
// ?????????, ??????????, ????, ??? ????????????????? spawn
//=============================================================================

class KFWeapDef_AF2011DualEx extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Control power removed: knockdown/stumble/gun hit set lower"
		$ "\n*Recoil: stronger vertical kick"
		$ "\n*Recoil: steadier side pull";
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_Pistol_DualAF2011Ex"

    BuyPrice=1500
    AmmoPricePerMag=54
    ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011"
    EffectiveRange=50
}
