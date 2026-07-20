class KFWeapDef_KrissEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("KFWeap_SMG_Kriss", "ItemDescription", "KFGameContent");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_SMG_KrissEx"
	ImagePath="WEP_UI_KRISS_TEX.UI_WeaponSelect_KRISS"

	BuyPrice=1500
	AmmoPricePerMag=31

	EffectiveRange=70

	UpgradePrice[0]=1500

	UpgradeSellPrice[0]=1125
}
