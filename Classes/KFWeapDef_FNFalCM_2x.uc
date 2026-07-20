//=============================================================================
// KFWeapDef_FNFalCM_2x
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? FN FAL 2x Scope
// ?????????, ??????????, ????, ??? ????????????????? spawn
// ??? localization ?????????? FNFal ???????
//=============================================================================

class KFWeapDef_FNFalCM_2x extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return "*Damage: 70 -> 60"
		$ "\n*Scope: 4x -> 2x"
		$ "\n*Fire rate: 606 -> 700 RPM"
		$ "\n*Spare ammo: 160 -> 280"
		$ "\n*Recoil: steadier";
}

DefaultProperties
{
    WeaponClassPath="CWP.CW_AssaultRifle_FNFalCM_2xEx"
    ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
    BuyPrice=2500
    AmmoPricePerMag=47
    EffectiveRange=70
}
