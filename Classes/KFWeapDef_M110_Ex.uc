class KFWeapDef_M110_Ex extends KFWeaponDefinition
    abstract;

static function string GetItemDescription()
{
	return Localize("CW_Rifle_M110_Ex", "ItemDescription", "CWP");
}

defaultproperties
{
	WeaponClassPath="CWP.CW_Rifle_M110_Ex"
	ImagePath="WEP_M110_TEX.M110_UI"
	BuyPrice=80000
	AmmoPricePerMag=60
	EffectiveRange=120
}
