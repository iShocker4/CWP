class KFWeapDef_Hemogoblin_NoBleed_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Damage: 120 -> 100"
		$ "\n*Magazine/spare ammo: 7/112 -> 6/56"
		$ "\n*Heal amount: 25 -> 20"
		$ "\n*DoT changed from bleeding to toxic"
		$ "\n*Recoil: heavier than standard medic rifles"
		$ "\n*Slows movement by 20%, without damage/attack debuff";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_Hemogoblin_Ex"
	ImagePath="WEP_UI_Bleeder_TEX.UI_WeaponSelect_Bleeder"
	BuyPrice=1100
	AmmoPricePerMag=30
	EffectiveRange=90
}
