//=============================================================================
// CW_Pistol_DeagleEx
//=============================================================================
// ปืน Deagle เดี่ยว เวอร์ชันดัดแปลง
// - ไม่มีกระสุนสำรองเริ่มเกม (InitialSpareMags=0)
// - ปรับ recoil ให้รุนแรงขึ้น (650-650 จากปกติที่ต่างกัน)
// - เชื่อมโยงไปยังคลาส Dual ที่กำหนดเอง (CW_Pistol_DualDeagleEx)
//=============================================================================

class CW_Pistol_DeagleEx extends KFWeap_Pistol_Deagle;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (Deagle)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Pistol_Deagle');
}

// Reload 20% faster when the current magazine still has ammunition.
simulated function float GetReloadRateScale()
{
	if (AmmoCount[0] > 0)
	{
		return Super.GetReloadRateScale() * 0.8f;
	}

	return Super.GetReloadRateScale();
}

DefaultProperties
{
	// Ammo
	InitialSpareMags[0]=0

	// Recoil
	maxRecoilPitch=650
	minRecoilPitch=650

	// Dual class
	DualClass=class'CWP.CW_Pistol_DualDeagleEx'

	// Upgrades
	WeaponUpgrades.Empty
//	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Weight, Add=2)))
}
