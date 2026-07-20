//=============================================================================
// SkinsAdder
//=============================================================================
// คลาสสำหรับแทนที่สกินอาวุธฝั่งไคลเอนต์
// ดึงสกินเริ่มต้นจากอาวุธต้นฉบับ แล้วไปใส่ให้อาวุธที่กำหนดเอง (CustomWeapDef)
// เพื่อให้อาวุธ custom แสดงสกินเดียวกับอาวุธต้นฉบับได้
// ทำงานเฉพาะฝั่งไคลเอนต์ แล้วทำลายตัวเองเมื่อทำงานเสร็จ
//=============================================================================

class SkinsAdder extends ReplicationInfo dependson(CWPMut);

struct native SkinReplacement
{
	var class<KFWeaponDefinition> CustomWeapDef;
	var class<KFWeapon> DefaultWeapon;
};

var private array<SkinReplacement> ReplacementArray;

// PostBeginPlay — ถูกเรียกเมื่อ SkinsAdder เริ่มทำงาน
//   ตรวจสอบว่าไม่ใช่ Dedicated Server แล้วเรียก ReplaceSkins เพื่อแทนที่สกิน
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	if(WorldInfo.NetMode != NM_DedicatedServer) // Server doesn't need skins
	{
		ReplaceSkins();
	}
}

// ReplaceSkins — วนลูปแทนที่สกินอาวุธทุกชิ้นใน ReplacementArray
//   ดึง SkinItemId จากอาวุธต้นฉบับ แล้วบันทึกลงในอาวุธ custom
//   เมื่อทำเสร็จจะล้าง array และทำลายตัวเอง
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
private simulated function ReplaceSkins()
{
	local SkinReplacement SR;
	foreach ReplacementArray(SR)
	{
		class'KFGame.KFWeaponSkinList'.static.SaveWeaponSkin(SR.CustomWeapDef,SR.DefaultWeapon.default.SkinItemId);
	}
	ReplacementArray.length = 0;
	SetTimer(1.0f, false, nameof(Cleanup));
}

// Cleanup — ทำลาย SkinsAdder หลังจากรอให้ replication เสร็จสมบูรณ์
//   หน่วงเวลา 1 วินาที เพื่อให้ actor ถูก replicate ไปยัง remote clients ก่อน
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
private function Cleanup()
{
	self.Destroy();
}

DefaultProperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=true

	// Gunslinger
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_AF2011Ex',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_AF2011'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_AF2011DualEx',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_DualAF2011'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_AF2011Ex_AT',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_AF2011'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_AF2011DualEx_AT',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_DualAF2011'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_DeagleEx',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_Deagle'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_DeagleDualEx',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_DualDeagle'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_DeagleEx_AT',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_Deagle'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_DeagleDualEx_AT',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_DualDeagle'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Colt1911Ex',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_Colt1911'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Colt1911DualEx',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_DualColt1911'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Colt1911Ex_AT',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_Colt1911'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Colt1911DualEx_AT',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_DualColt1911'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_SW500Ex',DefaultWeapon=class'KFGameContent.KFWeap_Revolver_SW500'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_SW500DualEx',DefaultWeapon=class'KFGameContent.KFWeap_Revolver_DualSW500'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_SW500Ex_AT',DefaultWeapon=class'KFGameContent.KFWeap_Revolver_SW500'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_SW500DualEx_AT',DefaultWeapon=class'KFGameContent.KFWeap_Revolver_DualSW500'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Pistol_G18CEx',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_G18C'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Pistol_DualG18Ex',DefaultWeapon=class'KFGameContent.KFWeap_Pistol_DualG18'))

	// Sharpshooter
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_CenterfireMB464Ex',DefaultWeapon=class'KFGameContent.KFWeap_Rifle_CenterfireMB464'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_CenterfireMB464Meme',DefaultWeapon=class'KFGameContent.KFWeap_Rifle_CenterfireMB464'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_M14EBREx',DefaultWeapon=class'KFGameContent.KFWeap_Rifle_M14EBR'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_M14EBREx_RS',DefaultWeapon=class'KFGameContent.KFWeap_Rifle_M14EBR'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_M14EBR_IS_Ex',DefaultWeapon=class'KFGameContent.KFWeap_Rifle_M14EBR'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_MosinNagantEx',DefaultWeapon=class'KFGameContent.KFWeap_Rifle_MosinNagant'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_CrossbowEx',DefaultWeapon=class'KFGameContent.KFWeap_Bow_Crossbow'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_CompoundBowEx',DefaultWeapon=class'KFGameContent.KFWeap_Bow_CompoundBow'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_FNFal_4x',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_FNFal'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_FNFal_4xMeme',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_FNFal'))

	// Commando
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Ak12_Ex',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_AK12'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Bullpup_Ex',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_Bullpup'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_FNFalCM_2x',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_FNFal'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_SCAREx',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_SCAR'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_SCAREx_Meme',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_SCAR'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_MG3Ex',DefaultWeapon=class'KFGameContent.KFWeap_LMG_MG3'))

	// Field Medic
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_Hemogoblin_NoBleed_Ex',DefaultWeapon=class'KFGameContent.KFWeap_Rifle_Hemogoblin'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_HRGCrossbowEx',DefaultWeapon=class'KFGameContent.KFWeap_Bow_Crossbow'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_MedicRifle_Ex',DefaultWeapon=class'KFGameContent.KFWeap_AssaultRifle_Medic'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_MedicSMG2_Ex',DefaultWeapon=class'KFGameContent.KFWeap_SMG_Medic'))

	// SWAT
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_MP7Ex',DefaultWeapon=class'KFGameContent.KFWeap_SMG_MP7'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_P90Ex',DefaultWeapon=class'KFGameContent.KFWeap_SMG_P90'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_KrissEx',DefaultWeapon=class'KFGameContent.KFWeap_SMG_Kriss'))

	// Support
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_S12Ex',DefaultWeapon=class'KFGameContent.KFWeap_Shotgun_S12'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_DoubleBarrelEx',DefaultWeapon=class'KFGameContent.KFWeap_Shotgun_DoubleBarrel'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_HZ12Ex',DefaultWeapon=class'KFGameContent.KFWeap_Shotgun_HZ12'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_M4Ex',DefaultWeapon=class'KFGameContent.KFWeap_Shotgun_M4'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_AA12Ex',DefaultWeapon=class'KFGameContent.KFWeap_Shotgun_AA12'))
	ReplacementArray.Add((CustomWeapDef=class'CWP.KFWeapDef_ElephantGunEx',DefaultWeapon=class'KFGameContent.KFWeap_Shotgun_ElephantGun'))
}
