class KFWeapDef_Colt1911Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("KFWeap_Pistol_Colt1911", "ItemDescription", "KFGameContent");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_Colt1911Ex"
	ImagePath="WEP_UI_M1911_TEX.UI_WeaponSelect_M1911Colt"
	
	BuyPrice=325 // 325
	AmmoPricePerMag=13
	
	EffectiveRange=50

	UpgradePrice[0]=600
	UpgradePrice[1]=700
//	UpgradePrice[2]=1500

	UpgradeSellPrice[0]=450
	UpgradeSellPrice[1]=975
//	UpgradeSellPrice[2]=2100
}
