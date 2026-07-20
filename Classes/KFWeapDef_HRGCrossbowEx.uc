class KFWeapDef_HRGCrossbowEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Medic crossbow with 40 HP heal darts"
		$ "\n*Ammo: 34 -> 14"
		$ "\n*Weight: 7 -> 6"
		$ "\n*Recoil: stronger than standard crossbows"
		$ "\n*No dart auto-track";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Bow_HRGCrossbowEx"
	ImagePath="WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow"

	BuyPrice=1000
	AmmoPricePerMag=11

	EffectiveRange=80
}
