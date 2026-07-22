class KFDT_Ballistic_M110 extends KFDT_Ballistic_Rifle
    abstract;

defaultproperties
{
    WeaponDef=Class'CWP.KFWeapDef_M110_Ex'
    ModifierPerkList(0)=class'KFPerk_Sharpshooter'
    StunPower=0.0000000 //300
    KnockdownPower=0.0000000
    StumblePower=25.0000000
    GunHitPower=0.0000000
    KDamageImpulse=900.0000000
    KDeathVel=100.0000000
    KDeathUpKick=-300.0000000
}
