class CW_Pistol_Colt1911Ex extends KFWeap_Pistol_Colt1911;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (Colt1911)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Pistol_Colt1911');
}

DefaultProperties
{
	// Ammo
	InitialSpareMags[0]=0
	
	// Recoil
	maxRecoilPitch=450
	minRecoilPitch=450
	
	// Other
	DualClass=class'CWP.CW_Pistol_DualColt1911Ex'

	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.4f)))
	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.8f), (Stat=EWUS_Weight, Add=1)))
//	WeaponUpgrades[3]=(Stats=((Stat=EWUS_Damage0, Scale=2.0f), (Stat=EWUS_Weight, Add=2)))
}
