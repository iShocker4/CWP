class KFWeapDef_SCAREx_Meme extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_AssaultRifle_SCAREx_Meme", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_SCAREx_Meme"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_SCAR"

	BuyPrice=16000
	AmmoPricePerMag=35

	EffectiveRange=70
}
