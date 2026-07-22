//=============================================================================
// CW_Bow_CompoundBowEx
//=============================================================================
// ปืน Compound Bow เวอร์ชันดัดแปลง (สำหรับ Sharpshooter)
//=============================================================================

class CW_Bow_CompoundBowEx extends KFWeap_Bow_CompoundBow;

// GetReloadRateScale — เพิ่มความเร็วรีโหลด 10% จากค่าเดิม
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
simulated function float GetReloadRateScale()
{
	return Super.GetReloadRateScale() * 0.9;
}

DefaultProperties
{
	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=300.0 //250
}
