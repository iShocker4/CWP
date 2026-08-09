//=============================================================================
// CW_Bow_CrossbowEx
//=============================================================================
// ปืน Crossbow เวอร์ชันดัดแปลง (สำหรับ Sharpshooter)
//=============================================================================

class CW_Bow_CrossbowEx extends KFWeap_Bow_Crossbow;

// GetReloadRateScale — เพิ่มความเร็วรีโหลด 10% จากค่าเดิม
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
simulated function float GetReloadRateScale()
{
	return Super.GetReloadRateScale() * 0.9;
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Piercing_CrossbowVanillaEx'
}
