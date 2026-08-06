class KFWeapDef_SCAREx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_AssaultRifle_SCAREx", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_SCAREx"
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_SCAR"

	BuyPrice=1500
	AmmoPricePerMag=30

	EffectiveRange=70
}
