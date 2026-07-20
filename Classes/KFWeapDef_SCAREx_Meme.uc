class KFWeapDef_SCAREx_Meme extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 55 -> 80"
		$ "\n*Fire rate: 625 -> 650 RPM"
		$ "\n*Magazine/spare ammo: 20/340 -> 30/420"
		$ "\n*Reload speed: 15% faster"
		$ "\n*Price: 1500 -> 16000";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_SCAREx_Meme"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_SCAR"

	BuyPrice=16000
	AmmoPricePerMag=35

	EffectiveRange=70
}
