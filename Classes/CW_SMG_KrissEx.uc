class CW_SMG_KrissEx extends KFWeap_SMG_Kriss;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (Kriss Vector)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_SMG_Kriss');
}

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_KrissEx'

	// SWAT damage buff: +10% per bullet.
	InstantHitDamage(DEFAULT_FIREMODE)=36.3
	InstantHitDamage(ALTFIRE_FIREMODE)=36.3
}
