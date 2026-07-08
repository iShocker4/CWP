class KFWeapDef_MedicRifle_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("KFWeap_AssaultRifle_Medic", "ItemDescription", "KFGameContent");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_Medic_Ex"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_MedicAssault"
	BuyPrice=1500
	AmmoPricePerMag=40
	EffectiveRange=70
}
