class KFWeapDef_MedicSMG2_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_SMG_Medic2_Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_SMG_Medic2_Ex"
	BuyPrice=650
	AmmoPricePerMag=21
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_MedicSMG"
	EffectiveRange=70
}
