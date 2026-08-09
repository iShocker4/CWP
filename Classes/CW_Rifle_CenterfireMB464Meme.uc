//=============================================================================
// CW_Rifle_CenterfireMB464Meme
//=============================================================================
// ปืน Centerfire MB464 เวอร์ชันดัดแปลง
// - ความเสียหาย 180 (จาก 165)
// - ปรับ recoil เป็น 500-500 (จาก 500-400)
// - ไม่มีกระสุนสำรองเริ่มเกม
// - ปรับสถานะตาม Perk:
//   - Sharpshooter: Equip/PutDown เร็วขึ้น, รีโหลดเร็ว 0.80x (ถ้าไม่มี Tactical Reload)
//   - Gunslinger: Equip/PutDown เร็วขึ้น, รีโหลดเร็ว 0.80x (ถ้าไม่มี Speed Reload)
//   - Perk อื่น: รีเซ็ตเป็นค่าเริ่มต้น
// - ป้องกันการเก็บอาวุธซ้ำ
//=============================================================================

class CW_Rifle_CenterfireMB464Meme extends KFWeap_Rifle_CenterfireMB464;

var private float ReloadspeedMod;

// GetReloadRateScale — คืนค่าตัวคูณความเร็วรีโหลด
//   คูณด้วย ReloadspeedMod ซึ่งถูกตั้งค่าตาม Perk ใน SetWeapon/NotifyBeginState
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
simulated function float GetReloadRateScale()
{
	local KFPerk_Gunslinger GunPerk;

	GunPerk = KFPerk_Gunslinger(GetPerk());
	if (GunPerk != none)
		return ReloadSpeedMod; // bypass Super — GS ได้ 0.40f เสมอ

	return Super.GetReloadRateScale() * ReloadSpeedMod;
}

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   ตรวจสอบ Perk ของผู้เล่น แล้วปรับ EquipTime, PutDownTime, MinFiringPutDownPct, ReloadSpeedMod
//   - Sharpshooter: เร่งเวลา equip/putdown, รีโหลดเร็ว 0.80x (ถ้าไม่มี Tactical Reload)
//   - Gunslinger: เร่งเวลา equip/putdown, รีโหลดเร็ว 0.80x (ถ้าไม่มี Speed Reload)
//   - Perk อื่น: รีเซ็ตเป็นค่าเริ่มต้น
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	local KFPerk_Sharpshooter SharpPerk;
	local KFPerk_Gunslinger GunPerk;

    super.SetWeapon();
class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Rifle_CenterfireMB464');

    SharpPerk = KFPerk_Sharpshooter(GetPerk());
    if (SharpPerk != none)
    {
        EquipTime = 0.25f;
        PutDownTime = 0.25f;
        MinFiringPutDownPct = 0.60f;
        if (!SharpPerk.IsTacticalReloadActive())
        {
            ReloadSpeedMod = 0.50f;
        }
        else
        {
            ReloadSpeedMod = 1.0f;
        }
        return;
    }

    GunPerk = KFPerk_Gunslinger(GetPerk());
    if (GunPerk != none)
    {
        EquipTime = 0.25f;
        PutDownTime = 0.25f;
        MinFiringPutDownPct = 0.60f;
        ReloadSpeedMod = 0.40f; // 60% เสมอ ไม่ว่า Speed Reload จะเปิดหรือเปล่า
        return;
    }

    // Reset to defaults for non-Sharpshooter/Gunslinger perks
    EquipTime = default.EquipTime;
    PutDownTime = default.PutDownTime;
    MinFiringPutDownPct = default.MinFiringPutDownPct;
    ReloadSpeedMod = 1.0f;
}

// NotifyBeginState — ถูกเรียกเมื่อสถานะอาวุธเปลี่ยน
//   ตรวจสอบ Perk แล้วปรับค่าเช่นเดียวกับ SetWeapon
//   - Sharpshooter: เร่งเวลา equip/putdown, รีโหลดเร็ว 0.80x (ถ้าไม่มี Tactical Reload)
//   - Gunslinger: เร่งเวลา equip/putdown, รีโหลดเร็ว 0.80x (ถ้าไม่มี Speed Reload)
//   - Perk อื่น: รีเซ็ตเป็นค่าเริ่มต้น
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated function NotifyBeginState()
{
    local KFPerk InstigatorPerk;

    super(KFWeapon).NotifyBeginState();

    InstigatorPerk = GetPerk();
    if (InstigatorPerk == none)
        return;

    if (InstigatorPerk.Class == class'KFGame.KFPerk_Sharpshooter')
    {
        EquipTime = 0.25f;
        PutDownTime = 0.25f;
        MinFiringPutDownPct = 0.60f;
        if (!KFPerk_Sharpshooter(InstigatorPerk).IsTacticalReloadActive())
        {
            ReloadSpeedMod = 0.50f;
        }
        else
        {
            ReloadSpeedMod = 1.0f;
        }
    }
    else if (InstigatorPerk.Class == class'KFGame.KFPerk_Gunslinger')
    {
        EquipTime = 0.25f;
        PutDownTime = 0.25f;
        MinFiringPutDownPct = 0.60f;
        ReloadSpeedMod = 0.40f; // 60% เสมอ ไม่ว่า Speed Reload จะเปิดหรือเปล่า
    }
    else
    {
        EquipTime = default.EquipTime;
        PutDownTime = default.PutDownTime;
        MinFiringPutDownPct = default.MinFiringPutDownPct;
        ReloadSpeedMod = 1.0f;
    }
}

// DenyPickupQuery — ตรวจสอบว่าอนุญาตให้เก็บอาวุธนี้หรือไม่
//   ปฏิเสธถ้า: ไม่ระบุ ItemClass หรือ PackageKey ซ้ำ
// พารามิเตอร์:
//   ItemClass - คลาสของไอเทมที่จะเก็บ
//   Pickup - Actor ของไอเทมที่จะเก็บ
// คืนค่า: bool - true ถ้าปฏิเสธการเก็บ, false ถ้าอนุญาต
/*
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}
*/
DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_CenterfireMB464Meme'

	// Inventory / Grouping
	InventorySize=5
	GroupPriority=54

	// Ammo
	InitialSpareMags[0]=0
    MagazineCapacity[0]=10

	// Recoil
	maxRecoilPitch=500 // 500
	minRecoilPitch=500 // 400

	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=220

	// Upgrades
	WeaponUpgrades.Empty
}
