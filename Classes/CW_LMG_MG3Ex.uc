//=============================================================================
// CW_LMG_MG3Ex
//=============================================================================
// ปืน MG3 เวอร์ชันดัดแปลง (สำหรับ Commando)
// - ความเสียหาย 50 (จาก 35)
// - รีโหลดเร็วขึ้น 20%
//=============================================================================

class CW_LMG_MG3Ex extends KFWeap_LMG_MG3;

// GetReloadRateScale — เพิ่มความเร็วรีโหลด 20% จากค่าเดิม
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
simulated function float GetReloadRateScale()
{
	return Super.GetReloadRateScale() * 0.8;
}

DefaultProperties
{
	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=50.0 //35
}
