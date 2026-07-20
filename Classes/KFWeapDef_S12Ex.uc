class KFWeapDef_S12Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("KFWeap_Shotgun_S12", "ItemDescription", "KFGameContent");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Shotgun_S12Ex"
	ImagePath="WEP_UI_Saiga12_TEX.UI_WeaponSelect_Saiga12"

	BuyPrice=1500
	AmmoPricePerMag=40

	SecondaryAmmoMagSize=1
	SecondaryAmmoMagPrice=30

	EffectiveRange=30

	UpgradePrice[0]=1500

	UpgradeSellPrice[0]=1125
}
