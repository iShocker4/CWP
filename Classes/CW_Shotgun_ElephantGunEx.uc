class CW_Shotgun_ElephantGunEx extends KFWeap_Shotgun_ElephantGun;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (Elephant Gun / Doomstick)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Shotgun_ElephantGun');
}

DefaultProperties
{
	// Support damage buff: +10% per pellet.
	InstantHitDamage(DEFAULT_FIREMODE)=44.0
	InstantHitDamage(ALTFIRE_FIREMODE)=44.0
}
