//=============================================================================
// CW_Pistol_DualDeagleEx
//=============================================================================
// ปืน Deagle คู่ เวอร์ชันดัดแปลง
// - ความเร็วรีโหลดเร็วขึ้น 10% (คูณ 0.9)
// - ปรับ fire interval เป็น 0.12 (จาก 0.11)
// - ปรับ recoil ให้รุนแรงขึ้น (650-650)
// - ไม่มีกระสุนสำรองเริ่มเกม
// - ป้องกันการเก็บปืนเดี่ยว/ซ้ำ
//=============================================================================

class CW_Pistol_DualDeagleEx extends KFWeap_Pistol_DualDeagle;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (DualDeagle)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Pistol_DualDeagle');
}

/*
// GetReloadRateScale — คืนค่าตัวคูณความเร็วรีโหลด
//   ทำให้รีโหลดเร็วขึ้น 10% (คูณ 0.9)
//   (มีโค้ดเดิมที่ comment ไว้สำหรับ empty reload ช้าลง 1.2x)
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
simulated function float GetReloadRateScale()
{
/*
	if(AmmoCount[0] <= 0)
	{
		return Super.GetReloadRateScale() * 1.20f; //1.1
	}
*/
	return Super.GetReloadRateScale() * 0.95f; //0.75
}
*/

// DenyPickupQuery — ตรวจสอบว่าอนุญาตให้เก็บอาวุธนี้หรือไม่
//   ปฏิเสธถ้า: ไม่ระบุ ItemClass, เป็นปืนเดี่ยวตัวเดียวกัน, หรือ PackageKey ซ้ำ
// พารามิเตอร์:
//   ItemClass - คลาสของไอเทมที่จะเก็บ
//   Pickup - Actor ของไอเทมที่จะเก็บ
// คืนค่า: bool - true ถ้าปฏิเสธการเก็บ, false ถ้าอนุญาต
/* 
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || ItemClass == SingleClass || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}
*/
DefaultProperties
{
	// Ammo
	InitialSpareMags[0]=0

	// Recoil
	maxRecoilPitch=650 // 650
	minRecoilPitch=650 // 550

	// Fire intervals
	FireInterval(DEFAULT_FIREMODE)=+0.113 // .11
	FireInterval(ALTFIRE_FIREMODE)=+0.113 // .11

	// Other
	SingleClass=class'CWP.CW_Pistol_DeagleEx'
	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.25f), (Stat=EWUS_Damage1, Scale=1.25f), (Stat=EWUS_Weight, Add=2)))
//	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=4)))
}
