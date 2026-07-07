class KFWeapDef_SCAREx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 55"
		$"\n*Fire Rate: 625 RPM";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_SCAREx"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_SCAR"

	BuyPrice=1500
	AmmoPricePerMag=30

	EffectiveRange=70
}
