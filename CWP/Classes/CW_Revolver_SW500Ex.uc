class CW_Revolver_SW500Ex extends KFWeap_Revolver_SW500;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (SW500)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Revolver_SW500');
}

DefaultProperties
{
	// Ammo
	InitialSpareMags[0]=0
	
	// Recoil
	maxRecoilPitch=850
	minRecoilPitch=850 //750
	
	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=180.0
	
	// Dual class
	DualClass=class'CWP.CW_Revolver_DualSW500Ex'

	// Upgrades
	WeaponUpgrades.Empty
}
