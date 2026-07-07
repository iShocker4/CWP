//=============================================================================
// KFWeap_Pistol_DualAF2011Ex
//=============================================================================
// ปืนพกคู่ AF2011 เวอร์ชันดัดแปลง
// - แก้บั๊กกระสุนเลขคี่ตอน equip
// - Tac reload เร็วขึ้น 80% (คูณ 0.8)
// - บังคับยิงสองมือพร้อมกัน
// - นับ shots fired ให้ถูกต้องสำหรับ perk (นับเป็น 2 ต่อการยิง)
// - ปรับ recoil ให้รุนแรงขึ้น
//=============================================================================

class KFWeap_Pistol_DualAF2011Ex extends KFWeap_Pistol_DualAF2011;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip เข้าไปในช่อง
//   ตั้งเวลา 0.25 วินาที เพื่อตรวจสอบกระสุนเลขคี่
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
// แก้บั๊กกระสุนเลขคี่ตอน equip
simulated event SetWeapon()
{
    super.SetWeapon();
    class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Pistol_DualAF2011');
    SetTimer(0.25f, false, nameof(CheckUneven));
}

// CheckUneven — ตรวจสอบและแก้ไขกระสุนเลขคี่
//   ถ้าจำนวนกระสุนในช่องใดช่องหนึ่งเป็นเลขคี่ จะลดลง 1
//   เนื่องจากปืนคู่ยิง 2 นัดต่อไก กระสุนต้องเป็นเลขคู่เสมอ
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated function CheckUneven()
{
    if ((AmmoCount[0] & 1) != 0)
    {
        AmmoCount[0] = AmmoCount[0] - 1;
    }
    else if ((AmmoCount[1] & 1) != 0)
    {
        AmmoCount[1] = AmmoCount[1] - 1;
    }
}

/*
// GetReloadRateScale — คืนค่าตัวคูณความเร็วรีโหลด
//   ทำให้ tac reload เร็วขึ้น 20% (คูณ 0.8)
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
// Tac reload เร็วขึ้น 80%, Empty reload ปกติ
simulated function float GetReloadRateScale()
{
    return Super.GetReloadRateScale() * 0.95f;
}
*/

// HandleWeaponShotTaken — นับจำนวนนัดที่ยิงเพื่อส่งให้ perk system
//   สำหรับปืนคู่ AF2011 ที่ยิง 2 นัดพร้อมกัน ต้องนับเป็น 2 นัด
// พารามิเตอร์:
//   FireMode - โหมดการยิง (DEFAULT_FIREMODE, ALTFIRE_FIREMODE ฯลฯ)
// คืนค่า: ไม่มี
// นับ shots fired ให้ถูกต้องสำหรับ perk
function HandleWeaponShotTaken( byte FireMode )
{
    if ( KFPlayer != None )
    {
        if (FireMode == ALTFIRE_FIREMODE || FireMode == DEFAULT_FIREMODE)
        {
            KFPlayer.AddShotsFired(2);
        }
        else
        {
            KFPlayer.AddShotsFired(GetNumProjectilesToFire(FireMode));
        }
    }
}

// InstantFireClient — บังคับให้ยิง 2 ครั้งต่อการกดไกหนึ่งครั้ง
//   เรียก super ของ KFWeap_DualBase สองครั้ง เพื่อให้สองมือยิงพร้อมกัน
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
// บังคับยิงสองมือพร้อมกัน
simulated function InstantFireClient()
{
    super(KFWeap_DualBase).InstantFireClient();
    super(KFWeap_DualBase).InstantFireClient();
}

// Allow both barrels to register as separate headshots in the same frame.
simulated function ProcessInstantHitEx(byte FiringMode, ImpactInfo Impact, optional int NumHits, optional out float OutPenetrationValue, optional int ImpactNum)
{
    local KFPawn_Monster HitMonster;

    HitMonster = KFPawn_Monster(Impact.HitActor);
    if (HitMonster != None
        && HitMonster.CanCountHeadshots()
        && HitMonster.GetHitZoneIndex(Impact.HitInfo.BoneName) == HZI_HEAD
        && HitMonster.LastHeadShotReceivedTime == WorldInfo.TimeSeconds)
    {
        HitMonster.LastHeadShotReceivedTime = -1.f;
    }

    super.ProcessInstantHitEx(FiringMode, Impact, NumHits, OutPenetrationValue, ImpactNum);
}

defaultproperties
{
    // ชี้กลับไปที่ Single Ex
    SingleClass=class'KFWeap_Pistol_AF2011Ex'

    WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
    WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit

    // DamageType ชี้ไปที่ของใหม่
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'KFDT_Ballistic_AF2011Ex'
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_AF2011Ex'

    GroupPriority=50

	// Recoil
	maxRecoilPitch=650  //650  //550
	minRecoilPitch=650  //550  //550
	maxRecoilYaw=225 //150
	minRecoilYaw=-225 //150
}
