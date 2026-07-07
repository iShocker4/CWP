//=============================================================================
// CW_Rifle_M14EBREx
//=============================================================================
// ปืน M14 EBR เวอร์ชันดัดแปลง
// - ความเสียหาย 90 (จาก 80)
// - มีระบบเลเซอร์ไซต์ที่สามารถเปิด/ปิดได้ (AltFire)
// - มีกล้อง scope lens แบบกำหนดเอง (Custom Scope)
// - ตรวจจับอาวุธซ้ำก่อน equip
// - ซิงค์สถานะเลเซอร์ไซต์ระหว่าง client-server และตอนเก็บอาวุธ
// - ปรับ EquipTime/PutDownTime, recoil, offset
//=============================================================================

class CW_Rifle_M14EBREx extends KFWeap_Rifle_M14EBR;

var bool bIsLaserSightEnabled, bIsFromPickup;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   ตรวจสอบและลบอาวุธซ้ำก่อน แล้วจึงเรียก super.SetWeapon()
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	class'Utils'.static.CheckAndRemoveDuplicatedWeapon(Inventory,self);
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Rifle_M14EBR');
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

// AttachLaserSight — ถูกเรียกเมื่อเลเซอร์ไซต์ถูกแนบกับอาวุธ
//   ตั้งค่าเริ่มต้นของเลเซอร์: เปิดถ้าเป็นอาวุธใหม่, ใช้ค่าเดิมถ้าเก็บจากพื้น
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated function AttachLaserSight()
{
	local bool bEnabled;

	super.AttachLaserSight();

	// Setup our laser sight on the client
	if (bIsFromPickup)
	{
		bEnabled = bIsLaserSightEnabled;
	}
	else
	{
		bEnabled = true;
	}
	SetLaserSightEnabled(bEnabled);
}

// SetLaserSightEnabled — เปิด/ปิดเลเซอร์ไซต์
//   อัปเดตสถานะ visual ของเลเซอร์ (ลำแสง + จุด) และส่งไปยัง server ถ้าเป็น client
//   ถ้า LaserSight ยังไม่ถูกสร้าง จะตั้ง bIsFromPickup=true เพื่อรอการแนบ
// พารามิเตอร์:
//   bEnabled - true เปิดเลเซอร์, false ปิดเลเซอร์
//   SendToServer - (optional) true ถ้าต้องการส่งค่าไป server (default: true)
// คืนค่า: ไม่มี
simulated function SetLaserSightEnabled(bool bEnabled, optional bool SendToServer = true)
{
	bIsLaserSightEnabled = bEnabled;
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (LaserSight != None)
		{
			// We don't use LaserSight.ChangeVisibility() because
			// that hides the laser sight mesh itself
			LaserSight.LaserBeamMeshComp.SetHidden(!bIsLaserSightEnabled);
			LaserSight.LaserDotMeshComp.SetHidden(!bIsLaserSightEnabled);
			if (Role < ROLE_Authority && SendToServer)
			{
				ServerSetLaserSight(bIsLaserSightEnabled);
			}
		}
		else
		{
			bIsFromPickup = true;
		}
	}
}

// AltFireMode — สลับเลเซอร์ไซต์เปิด/ปิด
//   ทำงานเฉพาะฝั่งผู้เล่นที่ควบคุมอาวุธอยู่
//   เล่นเสียงสลับโหมดเพื่อยืนยัน
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated function AltFireMode()
{
	if (!Instigator.IsLocallyControlled())
	{
		return;
	}

	SetLaserSightEnabled(!bIsLaserSightEnabled);

	// Play switch fire mode sound for audio confirmation
	Instigator.PlaySoundBase(KFInventoryManager(InvManager).SwitchFireModeEvent);
}

// Tick — ถูกเรียกทุกเฟรม
//   1. อัปเดตเลเซอร์ไซต์ถ้าเปิดอยู่
//   2. อัปเดต scope lens interpolation (zoom in/out effect)
// พารามิเตอร์:
//   DeltaTime - เวลาที่ผ่านไปตั้งแต่เฟรมก่อนหน้า
// คืนค่า: ไม่มี
simulated event Tick(float DeltaTime)
{
	local float InterpValue;
	local float DefaultZoomInTime;

	// Copy/paste modified from KFWeapon
	if (LaserSight != None && bIsLaserSightEnabled)
	{
		LaserSight.Update(DeltaTime, Self);
	}

	// Copy/paste modified from KFWeap_ScopedBase
	if(ScopeLenseMIC == none)
	{
		return;
	}

	if(Instigator != none && Instigator.Controller != none && Instigator.IsHumanControlled())
	{
		if(bZoomingOut)
		{
			InterpValue = ZoomTime/default.ZoomOutTime;
			ScopeLenseMIC.SetScalarParameterValue(InterpParamName, InterpValue);
		}
		else if(bZoomingIn)
		{
			DefaultZoomInTime = default.ZoomInTime;
			InterpValue = -ZoomTime/DefaultZoomInTime + 1;
			ScopeLenseMIC.SetScalarParameterValue(InterpParamName, InterpValue);
		}
	}
}

// ServerSetLaserSight — รับค่าสถานะเลเซอร์จาก client ไปเก็บฝั่ง server
//   (reliable server function)
// พารามิเตอร์:
//   bEnabled - true เปิดเลเซอร์, false ปิดเลเซอร์
// คืนค่า: ไม่มี
reliable server function ServerSetLaserSight(bool bEnabled)
{
	bIsLaserSightEnabled = bEnabled;
}

// ClientSetLaserSight — ส่งค่าสถานะเลเซอร์ไปยัง client
//   (reliable client function) ใช้ตอนเก็บอาวุธจากพื้น
// พารามิเตอร์:
//   bEnabled - true เปิดเลเซอร์, false ปิดเลเซอร์
// คืนค่า: ไม่มี
/** Transfers laser sight setting to client when picking up dropped weapon */
reliable client function ClientSetLaserSight(bool bEnabled)
{
	if (Role < ROLE_Authority)
		SetLaserSightEnabled(bEnabled, false);
}

// SetOriginalValuesFromPickup — โอนสถานะเลเซอร์ไซต์จากอาวุธที่เก็บได้
//   เรียกเมื่อผู้เล่นเก็บอาวุธจากพื้น จะตั้งค่าเลเซอร์และส่งไปยัง client
// พารามิเตอร์:
//   PickedUpWeapon - อาวุธที่เก็บจากพื้น
// คืนค่า: ไม่มี
/** Transfer laser sight setting to client */
function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	SetLaserSightEnabled(CW_Rifle_M14EBREx(PickedUpWeapon).bIsLaserSightEnabled);
	ClientSetLaserSight(bIsLaserSightEnabled);
}

DefaultProperties
{
	// Lens override
	ScopeLenseMICTemplate=MaterialInstanceConstant'CustomScope_Ex.WEP_1P_M14EBR_Scope_MAT'

	// Offsets/Positioning
	PlayerViewOffset=(X=15.0,Y=11.5,Z=-4)
	IronSightPosition=(X=6.0,Y=-0.025,Z=-0.03)

	// Ammo
	InitialSpareMags[0]=0
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Inventory handling
	EquipTime=0.20
	PutDownTime=0.20

	// Recoil
	maxRecoilPitch=225
	minRecoilPitch=225 // 200

	// Damage
	InstantHitDamage(DEFAULT_FIREMODE)=90.0 //80

	// Other
	bIsLaserSightEnabled=true
	WeaponUpgrades.Empty
}
