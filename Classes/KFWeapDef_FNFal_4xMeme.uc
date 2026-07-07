//=============================================================================
// KFWeapDef_FNFal_4xMeme
//=============================================================================

class KFWeapDef_FNFal_4xMeme extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return "*FireRate: 606 -> 496rpm"
		$"\n*Damage: 70 -> 91"
		$"\n*HorizontalRecoil: Zero Recoil LR"
		$"\n*VerticalRecoil: 165-200 -> 230-230"
		$"\n*ReloadSpeed: 25% faster"
		$"\n*Weight: 8 > 9"
		$"\n*Empty Reload: 2.91s -> 2.67s";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_AssaultRifle_FNFal_4xMeme"
	ImagePath="WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL"
	BuyPrice=38000
	AmmoPricePerMag=60
	EffectiveRange=70
}
