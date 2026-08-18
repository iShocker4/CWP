class CW_Shotgun_DoubleBarrelEx extends KFWeap_Shotgun_DoubleBarrel;

// Reload 25% faster, with an additional 20% speed bonus while rounds remain.
simulated function float GetReloadRateScale()
{
	if (AmmoCount[0] > 0)
	{
		return Super.GetReloadRateScale() * 0.55f;
	}

	return Super.GetReloadRateScale() * 0.75f;
}

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (Double Barrel)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Shotgun_DoubleBarrel');
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_DBShotgunEx'

	// Support damage buff: +10% per pellet.
	InstantHitDamage(DEFAULT_FIREMODE)=27.5
	InstantHitDamage(ALTFIRE_FIREMODE)=27.5
}
