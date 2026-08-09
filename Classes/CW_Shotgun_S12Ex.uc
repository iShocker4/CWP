class CW_Shotgun_S12Ex extends KFWeap_Shotgun_S12;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (S12)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Shotgun_S12');
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_Shotgun_S12Ex'

	// Support damage buff: +20% per pellet and grenade explosion.
	InstantHitDamage(DEFAULT_FIREMODE)=33.6
	ExplosionTemplate.Damage=240.0
}
