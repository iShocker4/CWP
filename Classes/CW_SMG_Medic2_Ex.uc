class CW_SMG_Medic2_Ex extends CW_SMG_Medic_Ex;

simulated function AltFireMode()
{
	SpawnMedDart();
	SetTimer(FireInterval[ALTFIRE_FIREMODE],false,nameof(SpawnMedDart));
}

simulated function SpawnMedDart()
{
	if (!HasAmmo(ALTFIRE_FIREMODE,AmmoCost[ALTFIRE_FIREMODE]))
	{
		return;
	}
	StartFire(ALTFIRE_FIREMODE);
}

DefaultProperties
{
	HealAmount=10
	HealFullRechargeSeconds=13
	InventoryGroup=IG_Secondary
	GroupPriority=35
	EquipTime=0.20
	PutDownTime=0.20
	MinFiringPutDownPct=0.60
	DartMaxRecoilPitch=150
	DartMinRecoilPitch=100
	DartMaxRecoilYaw=50
	DartMinRecoilYaw=-50
	FireInterval(DEFAULT_FIREMODE)=+.075
	Spread(DEFAULT_FIREMODE)=0.007
	InstantHitDamage(DEFAULT_FIREMODE)=20.0
	AmmoCost(ALTFIRE_FIREMODE)=25
	FireInterval(ALTFIRE_FIREMODE)=+.135
	Spread(ALTFIRE_FIREMODE)=0.f
}
