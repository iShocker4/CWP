//=============================================================================
// KFWeapDef_CenterfireMB464Ex
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? Centerfire MB464 Custom
// ?????????, ??????????, ????, ??? ????????????????? spawn
// ??? localization ?????????? Centerfire MB464 ???????
//=============================================================================

class KFWeapDef_CenterfireMB464Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 165 -> 180"
		$ "\n*Sharpshooter/Gunslinger reload: 20% faster"
		$ "\n*Recoil: slightly stronger vertical kick"
		$ "\n*Draw and put-away are faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_CenterfireMB464Ex"
	ImagePath="WEP_UI_Centerfire_TEX.UI_WeaponSelect_Centerfire"

	BuyPrice=700 //650
	AmmoPricePerMag=55 //50

	EffectiveRange=70
}
