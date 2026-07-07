class KFWeapDef_Colt1911Ex_AT extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("KFWeap_Pistol_Colt1911", "ItemDescription", "KFGameContent")
		$ "\n*Right-click to toggle full-auto fire mode";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_Colt1911Ex_AT"
	ImagePath="WEP_UI_M1911_TEX.UI_WeaponSelect_M1911Colt"

	BuyPrice=325
	AmmoPricePerMag=13

	EffectiveRange=50

	UpgradePrice[0]=600
	UpgradePrice[1]=700

	UpgradeSellPrice[0]=450
	UpgradeSellPrice[1]=975
}
