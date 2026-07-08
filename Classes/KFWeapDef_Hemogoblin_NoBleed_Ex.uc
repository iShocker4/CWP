class KFWeapDef_Hemogoblin_NoBleed_Ex extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*DoT type: Bleeding -> Toxic" $
	"\n*Stumble power: 200 -> 130" $
	"\n*Attack speed modifier: -25% -> 0%" $
	"\n*Move speed modifier: -30% -> -20%" $
	"\n*Damage modifier: -30% -> 0%" $
	"\n*Stats change: 5s -> forever" $
	"\n==== Note ====" $
	"\nThis version of hemogoblin was mainly created to fix glitch that occurs with normal hemogoblin where raged zeds affected by DOT_Bleeding couldn't get decapped for 5 seconds after death";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_Hemogoblin_Ex"
	ImagePath="WEP_UI_Bleeder_TEX.UI_WeaponSelect_Bleeder"
	BuyPrice=1100
	AmmoPricePerMag=30
	EffectiveRange=90
}
