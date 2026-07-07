class KFWeapDef_HRGCrossbowEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*40HP heal per dart (50 ammo per dart)" $
	"\n*12 Seconds full dart recharge" $
	"\n*Dart dmg: 50" $
	"\n*Dart projectile speed: Instant" $
	"\n*No dart auto-track";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Bow_HRGCrossbowEx"
	ImagePath="WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow"

	BuyPrice=1000
	AmmoPricePerMag=11

	EffectiveRange=80
}
