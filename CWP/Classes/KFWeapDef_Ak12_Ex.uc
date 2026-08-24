class KFWeapDef_Ak12_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_AssaultRifle_AK12_Ex", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_AK12_Ex"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_AK12"
	BuyPrice=1750
	AmmoPricePerMag=40
	EffectiveRange=67
}
