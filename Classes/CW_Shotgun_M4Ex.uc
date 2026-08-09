class CW_Shotgun_M4Ex extends KFWeap_Shotgun_M4;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (M4 MS193 Professional)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Shotgun_M4');
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_M4ShotgunEx'

	// Support damage buff: +15% per pellet.
	InstantHitDamage(DEFAULT_FIREMODE)=34.5
}
