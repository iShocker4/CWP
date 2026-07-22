class KFDT_Ballistic_M107 extends KFDT_Ballistic_Rifle
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
    WeaponDef=Class'CWP.KFWeapDef_M107_Ex'
    ModifierPerkList(0)=class'KFPerk_Sharpshooter'
    StunPower=0.0000000
    KnockdownPower=0.0000000
    StumblePower=0.0000000 //350
    GunHitPower=300.0000000
    KDamageImpulse=2250.0000000
    KDeathVel=250.0000000
    KDeathUpKick=-400.0000000
}
