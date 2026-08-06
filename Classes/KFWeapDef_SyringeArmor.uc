class KFWeapDef_SyringeArmor extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Healer_SyringeArmor", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Healer_SyringeArmor"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Healer"

	BuyPrice=750
	AmmoPricePerMag=185
}
