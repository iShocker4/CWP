class KFWeapDef_MedicSMG2_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*HealAmount: 15 -> 10" $
	"\n*HealCost: 40 -> 25" $
	"\n*Inventory slot: Primary -> Secondary" $
	"\n*Weapon equip time: 0.45 -> 0.20" $
	"\n*Alt fire shoots 2 darts";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_SMG_Medic2_Ex"
	BuyPrice=650
	AmmoPricePerMag=21
	ImagePath="ui_weaponselect_tex.UI_WeaponSelect_MedicSMG"
	EffectiveRange=70
}
