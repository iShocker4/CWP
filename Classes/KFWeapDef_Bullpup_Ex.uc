class KFWeapDef_Bullpup_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 32 -> 33"
		$ "\n*Recoil: slightly steadier";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_Bullpup_Ex"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_Bullpup"
	BuyPrice=600
	AmmoPricePerMag=30
	EffectiveRange=68
}
