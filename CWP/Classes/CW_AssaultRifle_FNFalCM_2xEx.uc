//=============================================================================
// CW_AssaultRifle_FNFalCM_2xEx
//=============================================================================
// FN FAL พร้อมกล้อง 2x และ mesh กำหนดเอง (Custom Mesh)
// สร้างใหม่จาก KFWeap_RifleBase (ไม่ได้สืบทอดจาก FNFal ต้นฉบับ)
// - ความเสียหาย 60 (จาก 70), RPM 700 (จาก 606)
// - กระสุนสำรอง 280 (จาก 160), Penetration 1.0 (จาก 2.0)
// - รีโหลดเร็วขึ้น 5% (คูณ 0.95)
// - Recoil 165-165 vertical, -125~145 horizontal
// - Perk: Commando
// - ซิงค์โหมดยิง (auto/semi) ระหว่าง client-server
// - ตรวจจับอาวุธซ้ำก่อน equip
//=============================================================================

class CW_AssaultRifle_FNFalCM_2xEx extends KFWeap_RifleBase;

var private bool bServerFiringMode;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   ตรวจสอบและลบอาวุธซ้ำก่อน แล้วจึงเรียก super.SetWeapon()
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	class'Utils'.static.CheckAndRemoveDuplicatedWeapon(Inventory,self);
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_AssaultRifle_FNFal');
}

// DenyPickupQuery — ตรวจสอบว่าอนุญาตให้เก็บอาวุธนี้หรือไม่
//   ปฏิเสธถ้า: ไม่ระบุ ItemClass หรือ PackageKey ซ้ำ
// พารามิเตอร์:
//   ItemClass - คลาสของไอเทมที่จะเก็บ
//   Pickup - Actor ของไอเทมที่จะเก็บ
// คืนค่า: bool - true ถ้าปฏิเสธการเก็บ, false ถ้าอนุญาต

/*
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}
*/

// SetOriginalValuesFromPickup — โอนสถานะโหมดยิงจากอาวุธที่เก็บได้
//   เรียกเมื่อผู้เล่นเก็บอาวุธจากพื้น จะซิงค์โหมดยิงไปยัง client
// พารามิเตอร์:
//   PickedUpWeapon - อาวุธที่เก็บจากพื้น
// คืนค่า: ไม่มี
function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_AssaultRifle_FNFalCM_2xEx(PickedUpWeapon).bServerFiringMode);
}

// AltFireMode — สลับโหมดยิง (auto/semi)
//   ส่งสถานะโหมดยิงไปยัง server
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated function AltFireMode()
{
	super.AltFireMode();
	ServerSetAltFire(bUseAltFireMode);
}

// GetReloadRateScale — คืนค่าตัวคูณความเร็วรีโหลด
//   ทำให้รีโหลดเร็วขึ้น 5% (คูณ 0.95)
// พารามิเตอร์: ไม่มี
// คืนค่า: float - ตัวคูณความเร็วรีโหลด
SimuLated function float GetReloadRateScale()
{
	return Super.GetReloadRateScale() * 0.95f;
}

// ServerSetAltFire — รับค่าโหมดยิงจาก client ไปเก็บฝั่ง server
//   (reliable server function)
// พารามิเตอร์:
//   bAltFire - true ถ้าเป็นโหมด semi-auto, false ถ้าเป็น auto
// คืนค่า: ไม่มี
reliable server function ServerSetAltFire(bool bAltFire)
{
	bServerFiringMode = bAltFire;
}

// ClientSetAltFire — รับค่าโหมดยิงจาก server ไปตั้งค่าฝั่ง client
//   (reliable client function)
// พารามิเตอร์:
//   bAltFire - true ถ้าเป็นโหมด semi-auto, false ถ้าเป็น auto
// คืนค่า: ไม่มี
reliable client function ClientSetAltFire(bool bAltFire)
{
	bUseAltFireMode = bAltFire;
}

DefaultProperties
{
	// FOV
	MeshFOV=55
	MeshIronSightFOV=20
	PlayerIronSightFOV=70

	// Depth of field
	DOF_BlendInSpeed=3.0
	DOF_FG_FocalRadius=0
	DOF_FG_MaxNearBlurSize=3.5

	// Zooming / Position
	IronSightPosition=(X=12,Y=-0.04,Z=1.33)
	PlayerViewOffset=(X=22.0,Y=11,Z=-3.0)

	// Ammo
	MagazineCapacity[0]=20
	SpareAmmoCapacity[0]=280
	InitialSpareMags[0]=2
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Inventory / Grouping
	InventorySize=7
	GroupPriority=100

	// DEFAULT_FIREMODE
	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletAuto'
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponFiring
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(DEFAULT_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_FNFalCM_2x'
	FireInterval(DEFAULT_FIREMODE)=+0.0857 // 700 RPM
	InstantHitDamage(DEFAULT_FIREMODE)=60.0
	Spread(DEFAULT_FIREMODE)=0.007

	// ALTFIRE_FIREMODE
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_BulletSingle'
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_InstantHit
	WeaponProjectiles(ALTFIRE_FIREMODE)=class'KFProj_Bullet_AssaultRifle'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'KFDT_Ballistic_FNFal'
	FireInterval(ALTFIRE_FIREMODE)=+0.0857
	InstantHitDamage(ALTFIRE_FIREMODE)=60.0
	Spread(ALTFIRE_FIREMODE)=0.007

	bUseAltFireMode=false
	FireOffset=(X=30,Y=4.5,Z=-5)

	// BASH_FIREMODE
	InstantHitDamageTypes(BASH_FIREMODE)=class'KFDT_Bludgeon_FNFAl'
	InstantHitDamage(BASH_FIREMODE)=26

	// Recoil
	maxRecoilPitch=165
	minRecoilPitch=165
	maxRecoilYaw=145
	minRecoilYaw=-125
	RecoilRate=0.09
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=65035
	RecoilISMaxYawLimit=75
	RecoilISMinYawLimit=65460
	RecoilISMaxPitchLimit=375
	RecoilISMinPitchLimit=65460
	IronSightMeshFOVCompensationScale=4.5

	// Shooting Animations
	FireSightedAnims[0]=Shoot_Iron
	FireSightedAnims[1]=Shoot_Iron2
	FireSightedAnims[2]=Shoot_Iron3

	// Content
	PackageKey="FNFAL_CM_2x_EX"
	FirstPersonMeshName="FNFAL_CM_MESH_2x_Mad.WEP_1stP_FNFAL_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_FNFAL_ANIM.Wep_1stP_FNFAL_Anim"
	PickupMeshName="WEP_3P_FNFAL_MESH.WEP_3rdP_FNFAL_Pickup"
	AttachmentArchetypeName="WEP_FNFAL_ARCH.Wep_FNFAL_3P"
	MuzzleFlashTemplateName="WEP_FNFAL_ARCH.Wep_FNFAL_MuzzleFlash"

	WeaponSelectTexture=Texture2D'WEP_UI_FNFAL_TEX.UI_WeaponSelect_FNFAL'

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_3P_Loop',FirstPersonCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_1P_Loop')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_3P_Single',FirstPersonCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_1P_Single')
	WeaponDryFireSnd(DEFAULT_FIREMODE)=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_DryFire'
	WeaponDryFireSnd(ALTFIRE_FIREMODE)=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_DryFire'

	// Looping fire
	bLoopingFireAnim(DEFAULT_FIREMODE)=true
	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_3P_EndLoop',FirstPersonCue=AkEvent'WW_WEP_FNFAL.Play_WEP_FNFAL_Fire_1P_EndLoop')
	SingleFireSoundIndex=ALTFIRE_FIREMODE

	// Attachments
	bHasIronSights=true
	bHasFlashlight=false
	AssociatedPerkClasses(0)=class'KFPerk_Commando'
}
