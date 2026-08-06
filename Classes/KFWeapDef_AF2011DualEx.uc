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
	return Localize("CW_Pistol_DualAF2011Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_Pistol_DualAF2011Ex"

    BuyPrice=1500
    AmmoPricePerMag=54
    ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011"
    EffectiveRange=50
}
