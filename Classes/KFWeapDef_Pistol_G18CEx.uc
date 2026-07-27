//=============================================================================
// KFWeapDef_Pistol_G18CEx
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Fernando Ferrando @ Saber Interactive
//=============================================================================
class KFWeapDef_Pistol_G18CEx extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return "*Damage: 40 at 800 RPM auto / 343 RPM single, penetration 0"
		$ "\n*Control power: stumble 12, no knockdown, no stun"
		$ "\n*Recoil: horizontal kick reduced 60%, vertical unchanged"
		$ "\n*Spread: 0.03 auto / 0.0125 single"
		$ "\n*Weight: 4, 33-round mag";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_G18CEx"

	BuyPrice=750 //Weapon Price
	AmmoPricePerMag=38//24

	EffectiveRange=30 //70 //Default Firemode (Automatic) & Altfire Firemode (Single Fire) range

	ImagePath="WEP_UI_G18C_TEX.UI_WeaponSelect_G18C"

	IsPlayGoHidden=true;

//	UpgradePrice[0]=1500
//	UpgradeSellPrice[0]=1125

//	SharedUnlockId=SCU_G18C
}
