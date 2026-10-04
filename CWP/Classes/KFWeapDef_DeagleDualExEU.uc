//=============================================================================
// KFWeapDef_DeagleDualExEU
//=============================================================================

class KFWeapDef_DeagleDualExEU extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
    return Localize("CW_Pistol_DualDeagleExEU", "ItemDescription", "CWP");
}
DefaultProperties
{
    WeaponClassPath="CWP.CW_Pistol_DualDeagleExEU"
    ImagePath="WEP_UI_Dual_Deagle_TEX.UI_WeaponSelect_DualDeagle"

    BuyPrice=1100
    AmmoPricePerMag=42
    EffectiveRange=50
}
