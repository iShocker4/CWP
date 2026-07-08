class Custom_KFDT_Ballistic_Hemogoblin_NoBleed_Ex extends KFDT_Ballistic_Rifle abstract;

var class<Actor> TubeAttachClass;
var class<KFDamageType> BleedDamageType;

static simulated function bool CanDismemberHitZone( name InHitZoneName )
{
	if( super.CanDismemberHitZone( InHitZoneName ) )
	{
		return true;
	}

	switch ( InHitZoneName )
	{
	case 'lupperarm':
	case 'rupperarm':
	case 'chest':
	case 'heart':
		return true;
	}

	return false;
}

static simulated function bool CanDismemberHitZoneWhileAlive(name InHitZoneName)
{
	return false;
}

static function PlayImpactHitEffects(KFPawn P, vector HitLocation, vector HitDirection, byte HitZoneIndex, optional Pawn HitInstigator)
{
	local Actor TubeAttachment;
	local Vector StickLocation;
	local Rotator StickRotation;
	local name BoneName;
	local WorldInfo WI;
	local KFPawn RetracePawn;
	local Vector RetraceLocation;
	local Vector RetraceNormal;
	local TraceHitInfo HitInfo;

	WI = class'WorldInfo'.static.GetWorldInfo();
	if (P != none && HitZoneIndex > 0 && HitZoneIndex < P.HitZones.Length && WI != none && WI.NetMode != NM_DedicatedServer)
	{
		foreach WI.TraceActors(class'KFPawn', RetracePawn, RetraceLocation, RetraceNormal, HitLocation + HitDirection * 50, HitLocation - HitDirection * 50, vect(0, 0, 0), HitInfo, 1)
		{
			if (P == RetracePawn)
			{
				HitLocation = RetraceLocation;
				HitDirection = -RetraceNormal;
				break;
			}
		}

		TubeAttachment = P.Spawn(default.TubeAttachClass, P, , HitLocation, Rotator(HitDirection));
		if (TubeAttachment != none)
		{
			BoneName = P.HitZones[HitZoneIndex].BoneName;
			P.Mesh.TransformToBoneSpace(BoneName, TubeAttachment.Location, TubeAttachment.Rotation, StickLocation, StickRotation);
			TubeAttachment.SetBase(P, , P.Mesh, BoneName);
			TubeAttachment.SetRelativeLocation(StickLocation);
			TubeAttachment.SetRelativeRotation(StickRotation);
		}
	}
}

static function ApplySecondaryDamage( KFPawn Victim, int DamageTaken, optional Controller InstigatedBy )
{
	local class<KFDamageType> ToxicDT;
	local KFPawn_Monster KFM;

	ToxicDT = class'KFDT_Dart_Toxic'.static.GetMedicToxicDmgType( DamageTaken, InstigatedBy );
	if ( ToxicDT != None )
	{
		Victim.ApplyDamageOverTime(DamageTaken, InstigatedBy, ToxicDT);
	}

	if (default.BleedDamageType.default.DoT_Type != DOT_None)
	{
		KFM = KFPawn_Monster(Victim);
		if (KFM == none)
		{
			return;
		}
		KFM.ApplyDamageOverTime(DamageTaken, InstigatedBy, class'Custom_KFDT_Bleeding_Hemogoblin_Ex');
		KFM.AdjustMovementSpeed(0.8);
	}
}

DefaultProperties
{
	KDamageImpulse=3000
	KDeathUpKick=800
	KDeathVel=500
	StumblePower=130
	GunHitPower=5
	HeadDestructionDamageScale=5
	BleedDamageType=class'Custom_KFDT_Bleeding_Hemogoblin_Ex'
	WeaponDef=class'KFWeapDef_Hemogoblin_NoBleed_Ex'
	ModifierPerkList(0)=class'KFPerk_FieldMedic'
	TubeAttachClass=class'KFWeapActor_Hemogoblin_Tube'
}
