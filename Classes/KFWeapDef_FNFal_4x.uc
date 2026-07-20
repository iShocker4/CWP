//=============================================================================
// KFWeapDef_FNFal_4x
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? FN FAL 4x ACOG
// ?????????, ??????????, ????, ??? ????????????????? spawn
// ??? localization ?????????? FNFal ???????
//=============================================================================

class KFWeapDef_FNFal_4x extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 70 -> 75"
		$ "\n*Fire rate: 606 -> 496 RPM"
		$ "\n*Recoil: heavier and pulls right"
		$ "\n*Reload speed: 5% faster";
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_AssaultRifle_FNFal_4xEx"
    ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
    BuyPrice=1500
    AmmoPricePerMag=47
    EffectiveRange=70
}
