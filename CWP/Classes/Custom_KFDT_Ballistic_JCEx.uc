//=============================================================================
// Custom_KFDT_Ballistic_JCEx
//=============================================================================
// Damage type สำหรับปืน JC (Jackal & Casull) — นำเข้าจาก AGST mod
//=============================================================================

class Custom_KFDT_Ballistic_JCEx extends KFDT_Ballistic_Handgun
	abstract;

static simulated function bool CanDismemberHitZone(name InHitZoneName)
{
	if (super.CanDismemberHitZone(InHitZoneName))
	{
		return true;
	}
	switch (InHitZoneName)
	{
		case 'lupperarm':
		case 'rupperarm':
		case 'chest':
		case 'heart':
			return true;
	}

	return false;
}

defaultproperties
{
	WeaponDef=Class'CWP.KFWeapDef_JCEx'
	ModifierPerkList(0)=class'KFPerk_Gunslinger'
	KnockdownPower=0.0000000
	StumblePower=0.0000000
	GunHitPower=150.0000000
	KDamageImpulse=2500.0000000
	KDeathVel=250.0000000
	KDeathUpKick=-500.0000000
}
