//=============================================================================
// KFWeapDef_FNFal_4xMeme
//=============================================================================

class KFWeapDef_FNFal_4xMeme extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return "*Damage: 70 -> 91"
		$ "\n*Fire rate: 606 -> 496 RPM"
		$ "\n*Recoil: no side pull"
		$ "\n*Reload speed: 25% faster"
		$ "\n*Weight: 8 -> 9";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_FNFal_4xMeme"
	ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
	BuyPrice=38000
	AmmoPricePerMag=60
	EffectiveRange=70
}
