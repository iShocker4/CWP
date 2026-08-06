class CW_Shotgun_AA12Ex extends KFWeap_Shotgun_AA12;

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
	// Support damage buff: +20% per pellet.
	InstantHitDamage(DEFAULT_FIREMODE)=24.0
	InstantHitDamage(ALTFIRE_FIREMODE)=24.0
}
