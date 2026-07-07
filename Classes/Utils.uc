//=============================================================================
// Utils
//=============================================================================
// คลาสยูทิลิตี้แบบ static สำหรับใช้ร่วมกับอาวุธทั้งหมดใน CWP
// มีฟังก์ชันตรวจสอบและลบอาวุธซ้ำในกรณีที่ผู้เล่นพยายามซื้ออาวุธเดียวกัน
//=============================================================================

class Utils extends Object;

// ApplyCustomSkin — ปรับสกินอาวุธจากอาวุธต้นฉบับให้กับอาวุธ custom
//   ดึง SkinItemId จากอาวุธต้นฉบับ แล้วใช้ KFWeaponSkinList เพื่อหา material
//   จากนั้น set material ลงบน MySkelMesh ของอาวุธ custom โดยตรง
//   วิธีนี้เป็น fallback กรณีที่ SaveWeaponSkin ไม่อัปเดต CDO ใน memory
// พารามิเตอร์:
//   Weapon - อาวุธ custom ที่จะปรับสกิน
//   OriginalWeaponClass - คลาสของอาวุธต้นฉบับที่จะดึง SkinItemId
// คืนค่า: ไม่มี
simulated static final function ApplyCustomSkin(KFWeapon Weapon, class<KFWeapon> OriginalWeaponClass)
{
    local int SkinId;
    local array<MaterialInterface> SkinMats;
    local int i;

    // ไม่ต้องทำอะไรบน dedicated server
    if (Weapon.WorldInfo.NetMode == NM_DedicatedServer)
    {
        return;
    }

    // ดึง SkinItemId จากอาวุธต้นฉบับ
    SkinId = OriginalWeaponClass.default.SkinItemId;

    // ถ้าไม่มีสกิน (SkinItemId == 0) ก็ไม่ต้องทำอะไร
    if (SkinId <= 0)
    {
        return;
    }

    // ตรวจสอบว่า MySkelMesh มีอยู่
    if (Weapon.MySkelMesh == none)
    {
        return;
    }

    // ดึง material สกินแบบ first-person
    SkinMats = class'KFGame.KFWeaponSkinList'.static.GetWeaponSkin(SkinId, WST_FirstPerson);

    // ใส่ material ทุกตัวลงใน MySkelMesh
    for (i = 0; i < SkinMats.Length; ++i)
    {
        Weapon.MySkelMesh.SetMaterial(i, SkinMats[i]);
    }

    // ถ้าสกินต้องการอัปเดตแบบ real-time (เช่น แสดงจำนวนกระสุน, เลือด)
    // ให้เริ่ม Timer_UpdateWeaponSkin
    if (class'KFGame.KFWeaponSkinList'.static.SkinNeedsCodeUpdates(SkinId))
    {
        Weapon.Timer_UpdateWeaponSkin();
        Weapon.SetTimer(0.5f, true, nameof(Weapon.Timer_UpdateWeaponSkin));
    }
}

// CheckAndRemoveDuplicatedWeapon — ตรวจสอบว่ามีอาวุธซ้ำในช่องเติมของผู้เล่นหรือไม่
//   ถ้าพบอาวุธที่มี PackageKey เดียวกัน จะแจ้งเตือนและลบอาวุธใหม่ทิ้ง
// พารามิเตอร์:
//   CurrentWeapon - อาวุธปัจจุบันที่อยู่ในช่องเติม (Inventory)
//   NewWeapon - อาวุธใหม่ที่กำลังจะถูกเพิ่ม
// คืนค่า: true ถ้าพบและลบอาวุธซ้ำแล้ว, false ถ้าไม่พบอาวุธซ้ำ
simulated static final function bool CheckAndRemoveDuplicatedWeapon(Inventory CurrentWeapon, KFWeapon NewWeapon)
{
	if(KFWeapon(CurrentWeapon).PackageKey == NewWeapon.PackageKey)
	{
		CurrentWeapon.Instigator.ClientMessage("Don't buy the same weapons!");
		KFInventoryManager(CurrentWeapon.InvManager).ServerRemoveFromInventory(NewWeapon);
		KFInventoryManager(CurrentWeapon.InvManager).ClientRemoveFromInventory(NewWeapon);
		return true;
	}
	return false;
}
