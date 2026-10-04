//=============================================================================
// KFWeapDef_DeagleExEU
//=============================================================================

class KFWeapDef_DeagleExEU extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
    return Localize("CW_Pistol_DeagleExEU", "ItemDescription", "CWP");
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_Pistol_DeagleExEU"
    ImagePath="WEP_UI_Deagle_TEX.UI_WeaponSelect_Deagle"

    BuyPrice=550
    AmmoPricePerMag=21
    EffectiveRange=50
}
