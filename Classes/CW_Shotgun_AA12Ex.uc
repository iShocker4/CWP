class CW_Shotgun_AA12Ex extends KFWeap_Shotgun_AA12;

// Reload 15% faster, with an additional 15% speed bonus while rounds remain.
simulated function float GetReloadRateScale()
{
	if (AmmoCount[0] > 0)
	{
		return Super.GetReloadRateScale() * 0.70f;
	}

	return Super.GetReloadRateScale() * 0.85f;
}

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (AA12)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Shotgun_AA12');
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_AA12ShotgunEx'

	// Support damage buff: +20% per pellet.
	InstantHitDamage(DEFAULT_FIREMODE)=24.0
	InstantHitDamage(ALTFIRE_FIREMODE)=24.0
}
