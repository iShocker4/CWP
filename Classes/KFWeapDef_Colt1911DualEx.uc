class KFWeapDef_Colt1911DualEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Recoil: slightly stronger vertical kick";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DualColt1911Ex"
	ImagePath="WEP_UI_Dual_M1911_TEX.UI_WeaponSelect_DualM1911"
	
	BuyPrice=650 //650
	AmmoPricePerMag=26
	
	EffectiveRange=50

	UpgradePrice[0]=600
	UpgradePrice[1]=700
//	UpgradePrice[2]=1500

	UpgradeSellPrice[0]=450
	UpgradeSellPrice[1]=975
//	UpgradeSellPrice[2]=2100
}
