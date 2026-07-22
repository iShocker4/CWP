//=============================================================================
// CW_AssaultRifle_FNFal_4x
//=============================================================================
// FN FAL พร้อมกล้อง 4x ACOG เวอร์ชันดัดแปลง
// - รีโหลดเร็วขึ้น 10% (คูณ 0.9)
// - ความเสียหาย 75 (จาก 70)
// - Recoil 240-240 vertical, 0-140 horizontal (ดึงขวาอย่างเดียว)
// - เปลี่ยน perk เป็น Sharpshooter
// - ซิงค์โหมดยิง (auto/semi) ระหว่าง client-server
// - ป้องกันการเก็บอาวุธซ้ำ
//=============================================================================

class CW_AssaultRifle_FNFal_4xEx extends KFWeap_AssaultRifle_FNFal;

var private bool bServerFiringMode;

simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_AssaultRifle_FNFal');
}

/* 
function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
	return ItemClass == none || class<KFWeapon>(ItemClass).default.PackageKey == self.PackageKey;
}
*/

function SetOriginalValuesFromPickup(KFWeapon PickedUpWeapon)
{
	super.SetOriginalValuesFromPickup(PickedUpWeapon);
	ClientSetAltFire(CW_AssaultRifle_FNFal_4xEx(PickedUpWeapon).bServerFiringMode);
}

simulated function AltFireMode()
{
	super.AltFireMode();
	bServerFiringMode = bUseAltFireMode;
	ServerSetAltFire(bUseAltFireMode);
}

SimuLated function float GetReloadRateScale()
{
	return Super.GetReloadRateScale() * 0.95f;
}

reliable server function ServerSetAltFire(bool bAltFire)
{
	bServerFiringMode = bAltFire;
}

reliable client function ClientSetAltFire(bool bAltFire)
{
	bUseAltFireMode = bAltFire;
}

DefaultProperties
{
	// Ammo
	MagazineCapacity[0]=20
	SpareAmmoCapacity[0]=280
	InitialSpareMags[0]=2
	bCanBeReloaded=true
	bReloadFromMagazine=true

	// Content
	PackageKey="FNFAL_4x_EX"
	ScopeLenseMICTemplate=MaterialInstanceConstant'CustomScope_Ex.WEP_1P_FNFAL_Scope_MAT'

	// Zooming / Position
	PlayerViewOffset=(X=22.0,Y=11,Z=-3.0)
	IronSightPosition=(X=15,Y=0,Z=-0.01)

	// Inventory / Grouping
	InventorySize=8

	// Recoil
	maxRecoilPitch=230 //200
	minRecoilPitch=230 //165
	maxRecoilYaw=140 //190
	minRecoilYaw=0 //-165
	HippedRecoilModifier=1.4

	// DEFAULT_FIREMODE
	FireInterval(DEFAULT_FIREMODE)=+0.121
	InstantHitDamage(DEFAULT_FIREMODE)=75.0

	// ALTFIRE_FIREMODE
	FireInterval(ALTFIRE_FIREMODE)=+0.121
	InstantHitDamage(ALTFIRE_FIREMODE)=75.0

	// Perk / Class
	AssociatedPerkClasses.Empty
    AssociatedPerkClasses(0)=class'KFPerk_Sharpshooter'
}
