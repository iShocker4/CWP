class KFWeapDef_M14EBR_IS_Ex extends KFWeaponDefinition abstract;


static function string GetItemDescription()
{
	return "*Damage: 80 -> 90" $
	"\n*ADS Vertical recoil increased by 95 (30%)";
}


DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_M14EBR_IS_Ex"
	ImagePath="WEP_UI_M14EBR_TEX.UI_WeaponSelect_SM14-EBR"

	BuyPrice=1100
	AmmoPricePerMag=60 //53

	EffectiveRange=90
}
