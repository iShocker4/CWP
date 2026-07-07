//=============================================================================
// KFWeapDef_DeagleEx
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — DeagleEx เดี่ยว
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
// ดึงชื่อและคำอธิบายจากไฟล์ localization ของ Deagle ต้นฉบับ
//=============================================================================

class KFWeapDef_DeagleEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return "*RPM: 545 -> 530"; 
//		$"\n*Reload Speed 5% faster";
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Pistol_DeagleEx"
	ImagePath="WEP_UI_Deagle_TEX.UI_WeaponSelect_Deagle"

	BuyPrice=550
	AmmoPricePerMag=21

	EffectiveRange=50
	
	UpgradePrice[0]=700
//	UpgradePrice[1]=1500

	UpgradeSellPrice[0]=525
//	UpgradeSellPrice[1]=1650
}
