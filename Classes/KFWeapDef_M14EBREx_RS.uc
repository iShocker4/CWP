//=============================================================================
// KFWeapDef_M14EBREx_RS
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? M14 EBR Custom (ACOG)
// ?????????, ??????????, ????, ??? ????????????????? spawn
// ??? localization ?????????? M14 EBR ???????
//=============================================================================

class KFWeapDef_M14EBREx_RS extends KFWeaponDefinition abstract;

/* 
static function string GetItemCategory()
{
	return Localize("KFWeap_Rifle_M14EBR", "ItemCategory", "KFGameContent");
}
*/

static function string GetItemDescription()
{
	return "*Damage: 80 -> 121"
		$ "\n*Recoil: slightly stronger vertical kick"
		$ "\n*Sharpshooter reload: 35% faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_M14EBR_RS"
	ImagePath="WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR"

	BuyPrice=30000
	AmmoPricePerMag=60 //53

	EffectiveRange=90
}
