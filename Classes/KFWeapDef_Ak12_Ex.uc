class KFWeapDef_Ak12_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 40 -> 46" $
	"\n*Weight 6 -> 7";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_AK12_Ex"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_AK12"
	BuyPrice=1750
	AmmoPricePerMag=40
	EffectiveRange=67
}
