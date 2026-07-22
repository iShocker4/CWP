class CW_DroppedPickup_Ex extends KFDroppedPickup;

var private const LinearColor LowAmmoPickupColor;

event Landed(Vector HitNormal, Actor FloorActor)
{
	bForceNetUpdate = TRUE;
	bNetDirty = true;
	NetUpdateFrequency = 2.f;
	AddToNavigation();
}

simulated event FellOutOfWorld(class<DamageType> dmgType)
{
	SetLocation(Instigator.Location + vect(0,0.5,5));
	SetPhysics(PHYS_Falling);
}

auto state Pickup
{
	function bool ValidTouch(Pawn Other)
	{
		local Actor HitA;
		local vector HitLocation, HitNormal;
		local TraceHitInfo HitInfo;
		local bool bHitWall;
		
		if (Other == None || !Other.bCanPickupInventory || !Other.IsAliveAndWell() || (Other.DrivenVehicle == None && Other.Controller == None))
		{
			return false;
		}
		
		if (`TimeSince(CreationTime) < PickupDelay)
		{
			return false;
		}
		if ( Other == Instigator )
		{
			if( (bUseLowHealthDelay && (Instigator.Health / Instigator.HealthMax) <= 0.2f && `TimeSince(CreationTime) < 1.f)
			|| `TimeSince(CreationTime) < 0.1f )
			{
				return false;
			}
		}
		
		foreach Other.TraceActors( class'Actor', HitA, HitLocation, HitNormal, MyCylinderComp.GetPosition() + vect(0,0,10), Other.Location, vect(1,1,1), HitInfo )
		{
			if ( IsTouchBlockedBy(HitA, HitInfo.HitComponent) )
			{
				if (MyMeshComp == None)
				{
					return false;
				}
				else
				{
					bHitWall = true;
					break;
				}
			}
		}
		if (bHitWall)
		{
			foreach Other.TraceActors( class'Actor', HitA, HitLocation, HitNormal, MyMeshComp.Bounds.Origin + vect(0,0,10), Other.Location, vect(1,1,1), HitInfo )
			{
				if ( IsTouchBlockedBy(HitA, HitInfo.HitComponent) )
				{
					return false;
				}
			}
		}
		
		if (WorldInfo.Game.PickupQuery(Other, Inventory.class, self))
		{
			return true;
		}
		else
		{
			SetTimer(0.5,false,nameof(CheckTouching));
		}
		return false;
	}
	
	function BeginState(Name PreviousStateName)
	{
		SetTimer(LifeSpan - 1, false);
	}
	
	function CheckTouching()
	{
		local Pawn P;
		
		foreach TouchingActors(class'Pawn', P)
		{
			Touch( P, None, Location, vect(0,0,1) );
		}
	}
} 

simulated function SetPickupMesh(PrimitiveComponent NewPickupMesh)
{
	super.SetPickupMesh(NewPickupMesh);

	if (Role == ROLE_Authority) 
	{
		if (KFWeapon(Inventory).GetAmmoPercentage() < 0.25 && KFWeapon(Inventory).HasAnyAmmo())
		{
			SetLowAmmoMaterial();
		}
	}
}

simulated function SetLowAmmoMaterial()
{
	local MaterialInstanceConstant MeshMIC;

	if (MyMeshComp != none)
	{
		MeshMIC = MyMeshComp.CreateAndSetMaterialInstanceConstant(0);
		if (MeshMIC != none)
		{
			MeshMIC.SetVectorParameterValue('GlowColor', LowAmmoPickupColor);
		}
	}
}

defaultproperties
{
	// Pickup behavior
	bUseLowHealthDelay=false

	// Content
	LowAmmoPickupColor=(R=1.0000000,G=0.9700000,B=0.3600000,A=1.0000000)
}
