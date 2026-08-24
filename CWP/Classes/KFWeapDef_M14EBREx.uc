//=============================================================================
// KFWeapDef_M14EBREx
//=============================================================================
// ?????????? (Weapon Definition) ????????????? ? M14 EBR Custom (ACOG)
// ?????????, ??????????, ????, ??? ????????????????? spawn
// ??? localization ?????????? M14 EBR ???????
//=============================================================================

class KFWeapDef_M14EBREx extends KFWeaponDefinition abstract;

/* 
static function string GetItemCategory()
{
	return Localize("KFWeap_Rifle_M14EBR", "ItemCategory", "KFGameContent");
}
*/

static function string GetItemDescription()
{
	return Localize("CW_Rifle_M14EBREx", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_M14EBREx"
	ImagePath="WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR"

	BuyPrice=1100
	AmmoPricePerMag=60 //53

	EffectiveRange=90
}
