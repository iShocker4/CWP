//=============================================================================
// KFWeapDef_AF2011DualExEU
//=============================================================================

class KFWeapDef_AF2011DualExEU extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
    return Localize("CW_Pistol_DualAF2011ExEU", "ItemDescription", "CWP");
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_Pistol_DualAF2011ExEU"

    // EU balance sheet price.
    BuyPrice=1700
    AmmoPricePerMag=54
    ImagePath="WEP_UI_AF2001_TEX.UI_WeaponSelect_DualAF2011"
    EffectiveRange=50
}
