class KFWeapDef_MedicRifleGrenadeLauncher_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
    return Localize("CW_AssaultRifle_MedicRifleGrenadeLauncher_Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_AssaultRifle_MedicRifleGrenadeLauncher_Ex"

    BuyPrice=2000
    AmmoPricePerMag=47
    ImagePath="WEP_UI_Medic_GrenadeLauncher_TEX.UI_WeaponSelect_MedicGrenadeLauncher"

    EffectiveRange=68

    SecondaryAmmoMagSize=1
    SecondaryAmmoMagPrice=27
}
