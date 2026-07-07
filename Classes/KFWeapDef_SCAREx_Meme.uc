class KFWeapDef_SCAREx_Meme extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 55 > 80"
		$"\n*Fire Rate: 625 RPM > 650 RPM"
		$"\n*Magazine: 20 > 30"
		$"\n*Spare Ammo: 340 > 420"
		$"\n*Reload Speed: 15%"
		$"\n*Price 1500 > 16000 Dosh";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_SCAREx_Meme"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_SCAR"

	BuyPrice=16000
	AmmoPricePerMag=35

	EffectiveRange=70
}
