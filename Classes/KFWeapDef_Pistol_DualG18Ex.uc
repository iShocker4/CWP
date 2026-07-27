//=============================================================================
// KFWeapDef_Pistol_DualG18Ex
//=============================================================================
//
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
// Fernando Ferrando @ Saber Interactive
//=============================================================================
class KFWeapDef_Pistol_DualG18Ex extends KFWeaponDefinition
	abstract;

static function string GetItemDescription()
{
	return "*Damage: 40 per bullet at 1200 RPM, penetration 0"
		$ "\n*Control power: stumble 12, no knockdown, no stun"
		$ "\n*Recoil: horizontal kick reduced 60%, vertical unchanged"
		$ "\n*Spread: 0.03"
		$ "\n*Weight: 8, 66-round mag";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DualG18Ex"

	BuyPrice=1500 //Weapon Price
	AmmoPricePerMag=76//48

	EffectiveRange=30 //70 //Default Firemode (Automatic) & Altfire Firemode (Single Fire) range

	ImagePath="WEP_UI_Dual_G18C_TEX.UI_WeaponSelect_Dual_G18C"

	IsPlayGoHidden=true;

//	UpgradePrice[0]=1500
//	UpgradeSellPrice[0]=1125

//	SharedUnlockId=SCU_G18C
}
