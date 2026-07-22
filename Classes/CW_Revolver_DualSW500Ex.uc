class CW_Revolver_DualSW500Ex extends KFWeap_Revolver_DualSW500;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (DualSW500)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Revolver_DualSW500');
}

simulated function float GetReloadRateScale()
{
	return Super.GetReloadRateScale() * 0.6f; //0.75
}
/*
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || ItemClass == SingleClass || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}
*/
DefaultProperties
{
	// Ammo
	InitialSpareMags[0]=0
	
	// Recoil
	maxRecoilPitch=850 //850
	minRecoilPitch=850 //750
	
	// DEFAULT_FIREMODE
	InstantHitDamage(DEFAULT_FIREMODE)=190.0
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'Custom_KFDT_Ballistic_SW500Ex'

	// ALTFIRE_FIREMODE
	InstantHitDamage(ALTFIRE_FIREMODE)=190.0
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'Custom_KFDT_Ballistic_SW500Ex'
	
	// Single class
	SingleClass=class'CWP.CW_Revolver_SW500Ex'
}
