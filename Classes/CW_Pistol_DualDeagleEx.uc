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

// Reload 20% faster when the current magazine still has ammunition.
simulated function float GetReloadRateScale()
{
	if (AmmoCount[0] > 0)
	{
		return Super.GetReloadRateScale() * 0.8f;
	}

	return Super.GetReloadRateScale();
}

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
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleDualEx'

	// Ammo
	InitialSpareMags[0]=0

	// Recoil
	maxRecoilPitch=650 // 650
	minRecoilPitch=650 // 550

	// Match the vanilla dual Deagle fire rate.
	FireInterval(DEFAULT_FIREMODE)=+0.11
	FireInterval(ALTFIRE_FIREMODE)=+0.11

	// Single class
	SingleClass=class'CWP.CW_Pistol_DeagleEx'

	// Upgrades
	WeaponUpgrades.Empty
//	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f), (Stat=EWUS_Damage1, Scale=1.4f), (Stat=EWUS_Weight, Add=4)))
}
