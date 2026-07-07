//=============================================================================
// KFDT_Ballistic_AF2011Ex
//=============================================================================
// คลาสประเภทความเสียหายแบบ Ballistic สำหรับปืน AF2011Ex
// ดัดแปลงจาก KFDT_Ballistic_AF2011 โดย:
// - ลด KnockdownPower จาก 20 เป็น 0
// - ลด StumblePower จาก 30 เป็น 0
// - ลด GunHitPower จาก 150 เป็น 100
// - ลด KDamageImpulse, KDeathUpKick, KDeathVel
// - ชี้ WeaponDef ไปที่ KFWeapDef_AF2011Ex
//=============================================================================

class KFDT_Ballistic_AF2011Ex extends KFDT_Ballistic_AF2011
    abstract
    hidedropdown;

defaultproperties
{
	KDamageImpulse=1500 //2500
	KDeathUpKick=-450   //-500
	KDeathVel=200       //250

	KnockdownPower=0 //20
	StumblePower=0 //30
	GunHitPower=100 //150

    WeaponDef=class'KFWeapDef_AF2011Ex'
}
