//=============================================================================
// KFWeapDef_DeagleDualEx
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — DeagleEx คู่
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
// ดึงชื่อและหมวดหมู่จากไฟล์ localization ของ Dual Deagle ต้นฉบับ
//=============================================================================

class KFWeapDef_DeagleDualEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*RPM: 545 -> 530"; 
//		$"\n*Reload Speed 5% faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DualDeagleEx"
	ImagePath="WEP_UI_Dual_Deagle_TEX.UI_WeaponSelect_DualDeagle"

	BuyPrice=1100
	AmmoPricePerMag=42

	EffectiveRange=50

	UpgradePrice[0]=700
//	UpgradePrice[1]=1500

	UpgradeSellPrice[0]=525
//	UpgradeSellPrice[1]=1650
}
