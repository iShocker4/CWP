//=============================================================================
// KFWeapDef_FNFal_4xMeme
//=============================================================================

class KFWeapDef_FNFal_4xMeme extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return Localize("CW_AssaultRifle_FNFal_4xMeme", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_FNFal_4xMeme"
	ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
	BuyPrice=38000
	AmmoPricePerMag=60
	EffectiveRange=70
}
