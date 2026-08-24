class KFDT_Ballistic_M24 extends KFDT_Ballistic_Rifle
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
            return true;
    }

    return false;
}

defaultproperties
{
    WeaponDef=Class'CWP.KFWeapDef_M24_Ex'
    ModifierPerkList(0)=class'KFPerk_Sharpshooter'
    StunPower=0.0000000 //300
    KnockdownPower=0.0000000
    StumblePower=0.0000000
    GunHitPower=150.0000000
    KDamageImpulse=2750.0000000
    KDeathVel=450.0000000
    KDeathUpKick=750.0000000
}
