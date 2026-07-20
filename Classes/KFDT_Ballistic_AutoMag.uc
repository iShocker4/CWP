class KFDT_Ballistic_AutoMag extends KFDT_Ballistic_Handgun
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
    WeaponDef=Class'CWP.KFWeapDef_AutoMag_Ex'
    ModifierPerkList(0)=class'KFPerk_Gunslinger'
    ModifierPerkList(1)=class'KFPerk_Sharpshooter'
    KnockdownPower=0.0000000
    StumblePower=0.0000000
    GunHitPower=150.0000000
    KDamageImpulse=2500.0000000
    KDeathVel=250.0000000
    KDeathUpKick=-500.0000000
}
