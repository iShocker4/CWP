//=============================================================================
// CW_Rifle_MosinNagantEx
//=============================================================================
// A Mosin-Nagant Rifle
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class CW_Rifle_MosinNagantEx extends KFWeap_Rifle_MosinNagant;

var private float ReloadSpeedMod;

// SetWeapon — ถูกเรียกเมื่ออาวุธถูก equip
//   เรียก super แล้วปรับสกินจากอาวุธต้นฉบับ (MosinNagant)
// พารามิเตอร์: ไม่มี
// คืนค่า: ไม่มี
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Rifle_MosinNagant');
}

simulated function float GetReloadRateScale()
{
    return Super.GetReloadRateScale() * ReloadSpeedMod;
}

simulated function NotifyBeginState()
{
    local KFPerk InstigatorPerk;

    super(KFWeapon).NotifyBeginState();

    InstigatorPerk = GetPerk();
    if (InstigatorPerk == none)
        return;

    if (InstigatorPerk.Class == class'KFGame.KFPerk_Sharpshooter')
    {
        if (!KFPerk_Sharpshooter(InstigatorPerk).IsTacticalReloadActive())
            ReloadSpeedMod = 0.75f; // ไวขึ้น 15%
        else
            ReloadSpeedMod = 1.0f;
    }
    else
    {
        ReloadSpeedMod = 1.0f;
    }
}

DefaultProperties
{
	// Inventory / Grouping
	InventorySize=7
	GroupPriority=75

	// Ammo
	MagazineCapacity[0]=5
	SpareAmmoCapacity[0]=70
	InitialSpareMags[0]=0

	// DEFAULT_FIREMODE
    InstantHitDamage(DEFAULT_FIREMODE)=350
    FireInterval(DEFAULT_FIREMODE)=0.85 // 60 RPM

	// Upgrades
//	WeaponUpgrades[1]=(Stats=((Stat=EWUS_Damage0, Scale=1.15f), (Stat=EWUS_Damage1, Scale=1.15f), (Stat=EWUS_Weight, Add=1)))
//	WeaponUpgrades[2]=(Stats=((Stat=EWUS_Damage0, Scale=1.3f), (Stat=EWUS_Damage1, Scale=1.3f), (Stat=EWUS_Weight, Add=2)))
}
