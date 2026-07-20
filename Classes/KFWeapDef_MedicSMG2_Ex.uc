class KFWeapDef_MedicSMG2_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*Heal amount: 15 -> 10"
		$ "\n*Dart cost: 40 -> 25"
		$ "\n*Alt-fire shoots 2 darts"
		$ "\n*Secondary-slot medic SMG";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_SMG_Medic2_Ex"
	BuyPrice=650
	AmmoPricePerMag=21
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_MedicSMG"
	EffectiveRange=70
}
