class KFWeapDef_DualJCEx extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return Localize("CW_Pistol_DualJCEx", "ItemDescription", "CWP");
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Pistol_DualJCEx"
	ImagePath="WEP_1P_JC_TEX.Black"
	BuyPrice=60000 //100000
	AmmoPricePerMag=84 //42
	EffectiveRange=65 //50
}
