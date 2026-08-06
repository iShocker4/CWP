//=============================================================================
// CW_Healer_SyringeArmor
//=============================================================================
// Syringe Armor — เข็มฉีดที่เติมเกราะแทนเลือด ใช้ animation และ state ของ
// healer syringe ปกติ (Heal_Team / Heal_Self) แต่เปลี่ยนผลลัพธ์เป็น AddArmor()
// กระสุนเป็นแบบจำกัดจำนวนโดสจริง (ไม่ใช่ infinite recharge เหมือนต้นฉบับ) —
// ชาร์จหลอดแบบ 0-100% คืนความเร็วคงที่ 5 วิ/หลอด แต่การชาร์จแต่ละหน่วยจะดึงจาก
// SpareAmmoCount (โดสสำรอง) จริง เมื่อโดสสำรองหมด การชาร์จจะหยุดจนกว่าจะไป
// เติมที่ร้านค้า
//=============================================================================

class CW_Healer_SyringeArmor extends KFWeapon;

/*********************************************************************************************
 Ammo / Recharge
********************************************************************************************* */

/** เวลาคงที่ในการชาร์จหลอดให้เต็ม (วินาที) — เท่ากันทั้งฮีลเพื่อนและฮีลตัวเอง */
var() float ArmorRechargeSeconds;

/** อัตราชาร์จต่อวินาที คำนวณจาก ArmorRechargeSeconds ตอนเริ่มชาร์จ */
var float HealRechargePerSecond;

/** เก็บเศษของการชาร์จ เนื่องจากต้องชาร์จเป็นจำนวนเต็ม */
var float HealingIncrement;

/** กำลังชาร์จหลอดอยู่หรือไม่ */
var repnotify bool bIsAmmoRecharging;

/** เสียงตอนชาร์จเต็ม */
var AKEvent RechargeCompleteSound;

/*********************************************************************************************
 Healing (aka Firing Mode) target acquisition — ก๊อปมาจาก KFWeap_HealerBase ตรงๆ
********************************************************************************************* */

/** ระยะสูงสุดในการหาเพื่อนร่วมทีม */
var() float HealingRangeSQ;

/** เป้าหมายที่หาได้จาก UpdateHealTarget() */
var Pawn HealTarget;

/** เป้าหมายล่าสุดที่ valid ใช้สำหรับ "Heal Miss" dialog */
var Pawn LastValidHealTarget;

/** เวลาล่าสุดที่ ready state เปลี่ยน กันการสลับ idle/ready เร็วเกินไป */
var float LastReadyHealTime;

/** ป้องกันไม่ให้ zed คว้าตัวระหว่างกำลังฉีดเกราะ */
var(Weapon) float HealAttemptWeakZedGrabCooldown;

/*********************************************************************************************
 Animations — reuse ชื่อ anim จาก healer syringe ต้นฉบับ
********************************************************************************************* */

const IdleReadyAnim = 'Idle_Ready';
const HealSelfAnim  = 'Heal_Self';
const HealTeamAnim  = 'Heal_Team';

/*********************************************************************************************
 Screen (จอบนตัวเข็ม)
********************************************************************************************* */

var class<KFGFxWorld_HealerScreen> ScreenUIClass;
var KFGFxWorld_HealerScreen ScreenUI;

var float LastUIUpdateTime;
var float UIUpdateInterval;

replication
{
	if (bNetDirty)
		bIsAmmoRecharging;
}

simulated event ReplicatedEvent(name VarName)
{
	super.ReplicatedEvent(VarName);
	if (VarName == nameof(bIsAmmoRecharging))
	{
		if (!bIsAmmoRecharging && Owner != none)
		{
			PlaySoundBase(RechargeCompleteSound, true, false, false, Owner.Location);
		}
	}
}

/*********************************************************************************************
 * Skin
 *********************************************************************************************/
simulated event SetWeapon()
{
	super.SetWeapon();
	class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_Healer_Syringe');
}

/*********************************************************************************************
 * Ammo initialization
 *********************************************************************************************/
function InitializeAmmo()
{
	MagazineCapacity[0] = default.MagazineCapacity[0];
	InitialSpareMags[0] = default.InitialSpareMags[0];

	AmmoCount[0] = MagazineCapacity[0];
	AddAmmo(InitialSpareMags[0] * MagazineCapacity[0]);
}

/** ไม่ต้องรีโหลดกดเอง — การชาร์จเริ่มอัตโนมัติหลังยิงเสร็จ ดู PerformReload() */
simulated function bool CanReload(optional byte FireModeNum)
{
	return false;
}

/*********************************************************************************************
 * Screen / Attach / Detach
 *********************************************************************************************/
simulated function AttachWeaponTo(SkeletalMeshComponent MeshCpnt, optional Name SocketName)
{
	super.AttachWeaponTo(MeshCpnt, SocketName);

	if (Instigator != none && Instigator.IsLocallyControlled())
	{
		if (ScreenUI == none)
		{
			ScreenUI = new(self) ScreenUIClass;
			ScreenUI.Init();
			ScreenUI.Start(true);
		}

		if (ScreenUI != none)
		{
			ScreenUI.SetPause(false);
			ScreenUI.SetCharge(MagazineCapacity[0]);
		}
	}
}

simulated function DetachWeapon()
{
	super.DetachWeapon();
	if (Instigator != none && Instigator.IsLocallyControlled() && ScreenUI != none)
	{
		ScreenUI.SetPause();
	}
}

simulated event Destroyed()
{
	if (Instigator != none && Instigator.IsLocallyControlled() && ScreenUI != none)
	{
		ScreenUI.Close();
	}
	super.Destroyed();
}

/** อัปเดตจอบนเข็ม — AmmoCount[0] เป็น 0-100 อยู่แล้วเพราะ MagazineCapacity[0]=100 */
simulated function UpdateScreenUI()
{
	if (Instigator != none && Instigator.IsLocallyControlled() && Instigator.Weapon == self)
	{
		if (ScreenUI != none && ScreenUI.CurrentCharge != AmmoCount[0])
		{
			ScreenUI.SetCharge(AmmoCount[0]);
		}
	}
}

/** แสดงจำนวน "โดส" สำรองบน HUD แทนหน่วยชาร์จดิบ */
simulated function int GetSpareAmmoForHUD()
{
	return SpareAmmoCount[0] / MagazineCapacity[0];
}

/*********************************************************************************************
 Ammunition — Recharge ที่กินโดสสำรองจริง (ไม่ใช่ของฟรีเหมือนเข็มยาต้นฉบับ)
********************************************************************************************* */

/** เริ่มชาร์จหลอดหลังยิงเสร็จ ถ้าไม่มีโดสสำรองเหลือก็ไม่เริ่มชาร์จ */
simulated function PerformReload(optional byte FireModeNum)
{
	if (Role == ROLE_Authority)
	{
		if (SpareAmmoCount[0] <= 0)
		{
			bIsAmmoRecharging = false;
			return;
		}

		bIsAmmoRecharging = true;
		HealRechargePerSecond = float(MagazineCapacity[0]) / ArmorRechargeSeconds;
	}
}

/** ชาร์จหลอด 0-100% โดยแต่ละหน่วยที่ชาร์จจะดึงออกจาก SpareAmmoCount[0] จริง */
function HealAmmoRegeneration(float DeltaTime)
{
	if (SpareAmmoCount[0] <= 0)
	{
		bIsAmmoRecharging = false;
		return;
	}

	HealingIncrement += HealRechargePerSecond * DeltaTime;

	while (HealingIncrement >= 1.0 && AmmoCount[0] < MagazineCapacity[0] && SpareAmmoCount[0] > 0)
	{
		AmmoCount[0]++;
		SpareAmmoCount[0]--;
		HealingIncrement -= 1.0;
	}

	if (AmmoCount[0] == MagazineCapacity[0] || SpareAmmoCount[0] <= 0)
	{
		bIsAmmoRecharging = false;

		if (Instigator != none && Instigator.IsLocallyControlled() && Owner != none)
		{
			PlaySoundBase(RechargeCompleteSound, true, false, false, Owner.Location);
		}
	}
}

/** @see Weapon::Tick */
simulated event Tick(float DeltaTime)
{
	Super.Tick(DeltaTime);

	if (Role == ROLE_Authority && AmmoCount[0] < MagazineCapacity[0] && bIsAmmoRecharging)
	{
		HealAmmoRegeneration(DeltaTime);
	}

	if (Instigator != none && Instigator.WorldInfo.TimeSeconds - LastUIUpdateTime > UIUpdateInterval)
	{
		LastUIUpdateTime = Instigator.WorldInfo.TimeSeconds;
		UpdateScreenUI();
	}
}

/*********************************************************************************************
 Firing / Target acquisition — ก๊อปมาจาก KFWeap_HealerBase ตรงๆ (ไม่แก้ logic การหาเป้า)
********************************************************************************************* */

simulated function AltFireMode()
{
	if (!Instigator.IsLocallyControlled())
	{
		return;
	}
	StartFire(ALTFIRE_FIREMODE);
}

/** ยิงเกราะ — ใส่เพื่อน (DEFAULT_FIREMODE) หรือใส่ตัวเอง (ALTFIRE_FIREMODE) */
simulated function CustomFire()
{
	local KFPawn_Human HumanTarget;

	if (Role == ROLE_Authority)
	{
		if (CurrentFireMode == DEFAULT_FIREMODE)
		{
			HumanTarget = KFPawn_Human(HealTarget);
		}
		else if (CurrentFireMode == ALTFIRE_FIREMODE)
		{
			HumanTarget = KFPawn_Human(Instigator);
		}

		if (HumanTarget != none)
		{
			HumanTarget.AddArmor(int(InstantHitDamage[CurrentFireMode]));
		}
	}
}

simulated function StartFire(byte FireModeNum)
{
	local Pawn Healee;

	if (FireModeNum > ALTFIRE_FIREMODE)
	{
		Super.StartFire(FireModeNum);
		return;
	}

	Healee = (FireModeNum == DEFAULT_FIREMODE) ? HealTarget : Instigator;

	if (Healee == None || !IsValidHealingTarget(Healee))
	{
		if (FireModeNum == DEFAULT_FIREMODE && HealTarget == None
			&& `TimeSince(LastReadyHealTime) < 2.f)
		{
			MissHeal(LastValidHealTarget);
		}
		return;
	}

	if (Instigator == None || !Instigator.bNoWeaponFiring)
	{
		if (Role < Role_Authority)
		{
			ServerStartHeal(FireModeNum, HealTarget);
		}
		BeginFire(FireModeNum);
	}
}

/** Set the heal target and start firing mode */
reliable server private function ServerStartHeal(byte FireModeNum, Pawn P)
{
	if (FireModeNum == DEFAULT_FIREMODE && !P.IsAliveAndWell())
	{
		return;
	}

	HealTarget = P;
	ServerStartFire(FireModeNum);
}

/** เป้าหมายที่เกราะยังไม่เต็มและยังไม่ตาย เท่านั้นที่ยิงใส่ได้ */
simulated function bool IsValidHealingTarget(Pawn Healee)
{
	local KFPawn_Human HumanHealee;

	HumanHealee = KFPawn_Human(Healee);
	if (HumanHealee != none)
	{
		return HumanHealee.Armor < HumanHealee.GetMaxArmor() && HumanHealee.IsAliveAndWell();
	}

	return false;
}

simulated function MissHeal(Pawn P)
{
	if (Role < ROLE_Authority)
	{
		ServerMissHeal(P);
	}
	else
	{
		`DialogManager.PlayHealMissDialog(KFPawn(Instigator), KFPawn(P));
	}
}

unreliable server private function ServerMissHeal(Pawn P)
{
	MissHeal(P);
}

/*********************************************************************************************
 * Effects / Animations
 *********************************************************************************************/
simulated function PlayFireEffects(byte FireModeNum, optional vector HitLocation)
{
	PlayFiringSound(CurrentFireMode);

	if (Instigator != none && Instigator.IsFirstPerson())
	{
		ShakeView();
	}
}

simulated function name GetHealAnimName(byte FireModeNum)
{
	return (FireModeNum == DEFAULT_FIREMODE) ? HealTeamAnim : HealSelfAnim;
}

/*********************************************************************************************
 * Timing
 *********************************************************************************************/
simulated function float GetFireInterval(byte FireModeNum)
{
	local name AnimName;

	if (FireModeNum <= ALTFIRE_FIREMODE)
	{
		AnimName = GetHealAnimName(FireModeNum);
		return FMax(MySkelMesh.GetAnimInterruptTime(AnimName), 0.01f);
	}
	return super.GetFireInterval(FireModeNum);
}

simulated function bool ShouldRefire()
{
	return false;
}

/*********************************************************************************************
 * Target acquisition
 *********************************************************************************************/
simulated function UpdateHealTarget(optional bool bSkipOnAnimEnd)
{
	local bool bHasHealTarget;
	local vector AimDir, StartTrace, Projection;
	local Pawn P;
	local KFPawn KFP;
	local float DistSQ, FOV, HealTargetRating, BestHealTargetRating;

	if (`TimeSince(LastReadyHealTime) < 0.2f)
	{
		return;
	}

	bHasHealTarget = (HealTarget != None);
	HealTarget = None;

	StartTrace = Instigator.GetWeaponStartTraceLocation();
	AimDir = vector(GetAdjustedAim(StartTrace));

	foreach WorldInfo.AllPawns(class'Pawn', P)
	{
		if (P != Instigator && P.GetTeamNum() == Instigator.GetTeamNum() && P.IsAliveAndWell())
		{
			KFP = KFPawn(P);
			if (KFP != none && !KFP.CanBeHealed())
			{
				continue;
			}

			Projection = P.Location - StartTrace;

			DistSQ = VSizeSQ(Projection);
			if (DistSQ > HealingRangeSQ)
			{
				continue;
			}

			FOV = AimDir dot Normal(Projection);
			if (FOV > 0.4f)
			{
				HealTargetRating = FOV + (0.4f * (1.f - (DistSQ / HealingRangeSQ)));
				if (HealTargetRating > BestHealTargetRating && FastTrace(P.Location, StartTrace))
				{
					BestHealTargetRating = HealTargetRating;
					HealTarget = P;
					LastValidHealTarget = P;
					LastReadyHealTime = WorldInfo.TimeSeconds;
				}
			}
		}
	}

	if (!bSkipOnAnimEnd && bHasHealTarget != (HealTarget != None))
	{
		OnAnimEnd(none, 0.f, 0.f);
	}
}

/*********************************************************************************************
 * State Active
 *********************************************************************************************/
simulated state Active
{
	simulated event Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);

		UpdateHealTarget();
		UpdateScreenUI();
	}

	simulated function PlayIdleAnim()
	{
		local int IdleIndex;

		if (Instigator != none && Instigator.IsFirstPerson())
		{
			UpdateHealTarget(true);

			if (HealTarget != None)
			{
				PlayAnimation(IdleReadyAnim, 0.0, true, 0.2);
			}
			else
			{
				IdleIndex = Rand(IdleAnims.Length);
				PlayAnimation(IdleAnims[IdleIndex], 0.0, true, 0.2);
			}
		}
	}
}

/*********************************************************************************************
 * State WeaponHealing — ยิง "ใส่" เกราะ แล้วเริ่มชาร์จหลอดต่อ (ไม่มี manual reload)
 *********************************************************************************************/
simulated state WeaponHealing extends WeaponSingleFiring
{
	simulated function byte GetWeaponStateId()
	{
		return WEP_Heal;
	}

	simulated event BeginState(Name PreviousStateName)
	{
		SetWeakZedGrabCooldownOnPawn(HealAttemptWeakZedGrabCooldown);

		PlayHeal();
		TimeWeaponFiring(CurrentFireMode);

		NotifyBeginState();
	}

	simulated function PlayHeal()
	{
		local name AnimName;
		AnimName = GetHealAnimName(CurrentFireMode);

		if (Instigator != none && Instigator.IsFirstPerson())
		{
			if (AnimName != '')
			{
				PlayAnimation(AnimName, , , FireTweenTime);
			}
		}
	}

	simulated function RefireCheckTimer()
	{
		FireAmmunition();
		PerformReload();

		HandleFinishedFiring();
	}

	simulated function EndState(Name NextStateName)
	{
		Super.EndState(NextStateName);
		NotifyEndState();
	}
}

defaultproperties
{
	PlayerViewOffset=(X=20.0,Y=10,Z=-8)

	// Content — reuse vanilla healer syringe assets
	PackageKey="SyringeArmor"
	FirstPersonMeshName="WEP_1P_Healer_MESH.Wep_1stP_Healer_Rig"
	FirstPersonAnimSetNames(0)="WEP_1P_Healer_ANIM.Wep_1st_Healer_Anim"
	AttachmentArchetypeName="WEP_Healer_ARCH.Wep_Healer_3P"

	Begin Object Name=FirstPersonMesh
		Animations=AnimTree'CHR_1P_Arms_ARCH.WEP_1stP_Animtree_Healer'
	End Object

	FireModeIconPaths(DEFAULT_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'
	FireModeIconPaths(ALTFIRE_FIREMODE)=Texture2D'ui_firemodes_tex.UI_FireModeSelect_MedicDart'

	//Grouping
	GroupPriority=6
	WeaponSelectTexture=Texture2D'ui_weaponselect_tex.UI_WeaponSelect_Healer'
	InventoryGroup=IG_Equipment
	InventorySize=3

	bCanThrow=true
	bDropOnDeath=true
	bStorePreviouslyEquipped=false

	ScreenUIClass=class'KFGFxWorld_HealerScreen'
	UIUpdateInterval=1.f
	FireTweenTime=0.3f
	HealingRangeSQ=23000.f

	// Aim Assist
	AimCorrectionSize=0.f
	bTargetAdhesionEnabled=false

	// Armor to teammate
	FiringStatesArray(DEFAULT_FIREMODE)=WeaponHealing
	WeaponFireTypes(DEFAULT_FIREMODE)=EWFT_Custom
	FireInterval(DEFAULT_FIREMODE)=+0.2
	InstantHitDamage(DEFAULT_FIREMODE)=50.0
	AmmoCost(DEFAULT_FIREMODE)=100
	HealAttemptWeakZedGrabCooldown=1.0

	// Armor to self
	FiringStatesArray(ALTFIRE_FIREMODE)=WeaponHealing
	WeaponFireTypes(ALTFIRE_FIREMODE)=EWFT_Custom
	FireInterval(ALTFIRE_FIREMODE)=+2.0
	InstantHitDamage(ALTFIRE_FIREMODE)=50.0
	AmmoCost(ALTFIRE_FIREMODE)=100

	// Ammo — 100 หน่วย/หลอด (1 โดส) x 3 โดสรวม (mag + 2 สำรอง)
	MagazineCapacity[0]=100
	SpareAmmoCapacity[0]=200
	InitialSpareMags[0]=2
	bCanBeReloaded=false
	bReloadFromMagazine=true
	bInfiniteSpareAmmo=false
	ArmorRechargeSeconds=5.0
	bAllowClientAmmoTracking=false

	// Fire Effects
	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_3P_Fire_Single', FirstPersonCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_1P_Fire_Single')
	WeaponFireSnd(ALTFIRE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_3P_Fire_Single', FirstPersonCue=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_1P_Fire_Single')

	RechargeCompleteSound=AkEvent'WW_WEP_SA_Syringe.Play_WEP_SA_Syringe_Charged'

	AssociatedPerkClasses(0)=none
}
