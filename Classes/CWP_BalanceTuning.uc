class CWP_BalanceTuning extends Object
    config(Game)
    abstract;

var config bool bEnableRuntimeTuning;

var config float AutoMagDamage;
var config float AutoMagFireInterval;
var config float AutoMagPenetrationPower;
var config int AutoMagMagazineCapacity;
var config int AutoMagSpareAmmoCapacity;
var config int AutoMagMaxRecoilPitch;
var config int AutoMagMinRecoilPitch;
var config int AutoMagMaxRecoilYaw;
var config int AutoMagMinRecoilYaw;
var config float AutoMagRecoilRate;
var config int AutoMagRecoilMaxPitchLimit;
var config float AutoMagStunPower;
var config float AutoMagKnockdownPower;
var config float AutoMagStumblePower;
var config float AutoMagGunHitPower;

var config float DualAutoMagDamage;
var config float DualAutoMagFireInterval;
var config float DualAutoMagPenetrationPower;
var config int DualAutoMagMagazineCapacity;
var config int DualAutoMagSpareAmmoCapacity;
var config int DualAutoMagMaxRecoilPitch;
var config int DualAutoMagMinRecoilPitch;
var config int DualAutoMagMaxRecoilYaw;
var config int DualAutoMagMinRecoilYaw;
var config float DualAutoMagRecoilRate;
var config int DualAutoMagRecoilMaxPitchLimit;

var config float M107Damage;
var config float M107FireInterval;
var config float M107PenetrationPower;
var config int M107MagazineCapacity;
var config int M107SpareAmmoCapacity;
var config int M107MaxRecoilPitch;
var config int M107MinRecoilPitch;
var config int M107MaxRecoilYaw;
var config int M107MinRecoilYaw;
var config float M107RecoilRate;
var config float M107RecoilViewRotationScale;
var config int M107RecoilMaxPitchLimit;
var config float M107StunPower;
var config float M107KnockdownPower;
var config float M107StumblePower;
var config float M107GunHitPower;

var config float M110Damage;
var config float M110FireInterval;
var config float M110PenetrationPower;
var config int M110MagazineCapacity;
var config int M110SpareAmmoCapacity;
var config int M110MaxRecoilPitch;
var config int M110MinRecoilPitch;
var config int M110MaxRecoilYaw;
var config int M110MinRecoilYaw;
var config float M110RecoilRate;
var config float M110RecoilViewRotationScale;
var config int M110RecoilMaxPitchLimit;
var config float M110StunPower;
var config float M110KnockdownPower;
var config float M110StumblePower;
var config float M110GunHitPower;

var config float M24Damage;
var config float M24FireInterval;
var config float M24PenetrationPower;
var config int M24MagazineCapacity;
var config int M24SpareAmmoCapacity;
var config int M24MaxRecoilPitch;
var config int M24MinRecoilPitch;
var config int M24MaxRecoilYaw;
var config int M24MinRecoilYaw;
var config float M24RecoilRate;
var config float M24RecoilViewRotationScale;
var config int M24RecoilMaxPitchLimit;
var config float M24StunPower;
var config float M24KnockdownPower;
var config float M24StumblePower;
var config float M24GunHitPower;

static function ApplyAutoMag(CW_Pistol_AutoMag_Ex W)
{
    if (!default.bEnableRuntimeTuning || W == none)
    {
        return;
    }

    if (default.AutoMagDamage > 0) W.InstantHitDamage[0] = default.AutoMagDamage;
    if (default.AutoMagFireInterval > 0) W.FireInterval[0] = default.AutoMagFireInterval;
    if (default.AutoMagPenetrationPower > 0) W.PenetrationPower[0] = default.AutoMagPenetrationPower;
    if (default.AutoMagMagazineCapacity > 0) W.MagazineCapacity[0] = default.AutoMagMagazineCapacity;
    if (default.AutoMagSpareAmmoCapacity > 0) W.SpareAmmoCapacity[0] = default.AutoMagSpareAmmoCapacity;
    if (default.AutoMagMaxRecoilPitch > 0) W.maxRecoilPitch = default.AutoMagMaxRecoilPitch;
    if (default.AutoMagMinRecoilPitch > 0) W.minRecoilPitch = default.AutoMagMinRecoilPitch;
    if (default.AutoMagMaxRecoilYaw != 0 || default.AutoMagMinRecoilYaw != 0)
    {
        W.maxRecoilYaw = default.AutoMagMaxRecoilYaw;
        W.minRecoilYaw = default.AutoMagMinRecoilYaw;
    }
    if (default.AutoMagRecoilRate > 0) W.RecoilRate = default.AutoMagRecoilRate;
    if (default.AutoMagRecoilMaxPitchLimit > 0) W.RecoilMaxPitchLimit = default.AutoMagRecoilMaxPitchLimit;

}

static function ApplyDualAutoMag(CW_Pistol_DualAutoMag_Ex W)
{
    if (!default.bEnableRuntimeTuning || W == none)
    {
        return;
    }

    if (default.DualAutoMagDamage > 0)
    {
        W.InstantHitDamage[0] = default.DualAutoMagDamage;
        W.InstantHitDamage[1] = default.DualAutoMagDamage;
    }
    if (default.DualAutoMagFireInterval > 0)
    {
        W.FireInterval[0] = default.DualAutoMagFireInterval;
        W.FireInterval[1] = default.DualAutoMagFireInterval;
    }
    if (default.DualAutoMagPenetrationPower > 0)
    {
        W.PenetrationPower[0] = default.DualAutoMagPenetrationPower;
        W.PenetrationPower[1] = default.DualAutoMagPenetrationPower;
    }
    if (default.DualAutoMagMagazineCapacity > 0) W.MagazineCapacity[0] = default.DualAutoMagMagazineCapacity;
    if (default.DualAutoMagSpareAmmoCapacity > 0) W.SpareAmmoCapacity[0] = default.DualAutoMagSpareAmmoCapacity;
    if (default.DualAutoMagMaxRecoilPitch > 0) W.maxRecoilPitch = default.DualAutoMagMaxRecoilPitch;
    if (default.DualAutoMagMinRecoilPitch > 0) W.minRecoilPitch = default.DualAutoMagMinRecoilPitch;
    if (default.DualAutoMagMaxRecoilYaw != 0 || default.DualAutoMagMinRecoilYaw != 0)
    {
        W.maxRecoilYaw = default.DualAutoMagMaxRecoilYaw;
        W.minRecoilYaw = default.DualAutoMagMinRecoilYaw;
    }
    if (default.DualAutoMagRecoilRate > 0) W.RecoilRate = default.DualAutoMagRecoilRate;
    if (default.DualAutoMagRecoilMaxPitchLimit > 0) W.RecoilMaxPitchLimit = default.DualAutoMagRecoilMaxPitchLimit;

}

static function ApplyM107(CW_Rifle_M107_Ex W)
{
    if (!default.bEnableRuntimeTuning || W == none)
    {
        return;
    }

    if (default.M107Damage > 0) W.InstantHitDamage[0] = default.M107Damage;
    if (default.M107FireInterval > 0) W.FireInterval[0] = default.M107FireInterval;
    if (default.M107PenetrationPower > 0) W.PenetrationPower[0] = default.M107PenetrationPower;
    if (default.M107MagazineCapacity > 0) W.MagazineCapacity[0] = default.M107MagazineCapacity;
    if (default.M107SpareAmmoCapacity > 0) W.SpareAmmoCapacity[0] = default.M107SpareAmmoCapacity;
    if (default.M107MaxRecoilPitch > 0) W.maxRecoilPitch = default.M107MaxRecoilPitch;
    if (default.M107MinRecoilPitch > 0) W.minRecoilPitch = default.M107MinRecoilPitch;
    if (default.M107MaxRecoilYaw != 0 || default.M107MinRecoilYaw != 0)
    {
        W.maxRecoilYaw = default.M107MaxRecoilYaw;
        W.minRecoilYaw = default.M107MinRecoilYaw;
    }
    if (default.M107RecoilRate > 0) W.RecoilRate = default.M107RecoilRate;
    if (default.M107RecoilViewRotationScale > 0) W.RecoilViewRotationScale = default.M107RecoilViewRotationScale;
    if (default.M107RecoilMaxPitchLimit > 0) W.RecoilMaxPitchLimit = default.M107RecoilMaxPitchLimit;

}

static function ApplyM110(CW_Rifle_M110_Ex W)
{
    if (!default.bEnableRuntimeTuning || W == none)
    {
        return;
    }

    if (default.M110Damage > 0) W.InstantHitDamage[0] = default.M110Damage;
    if (default.M110FireInterval > 0) W.FireInterval[0] = default.M110FireInterval;
    if (default.M110PenetrationPower > 0) W.PenetrationPower[0] = default.M110PenetrationPower;
    if (default.M110MagazineCapacity > 0) W.MagazineCapacity[0] = default.M110MagazineCapacity;
    if (default.M110SpareAmmoCapacity > 0) W.SpareAmmoCapacity[0] = default.M110SpareAmmoCapacity;
    if (default.M110MaxRecoilPitch > 0) W.maxRecoilPitch = default.M110MaxRecoilPitch;
    if (default.M110MinRecoilPitch > 0) W.minRecoilPitch = default.M110MinRecoilPitch;
    if (default.M110MaxRecoilYaw != 0 || default.M110MinRecoilYaw != 0)
    {
        W.maxRecoilYaw = default.M110MaxRecoilYaw;
        W.minRecoilYaw = default.M110MinRecoilYaw;
    }
    if (default.M110RecoilRate > 0) W.RecoilRate = default.M110RecoilRate;
    if (default.M110RecoilViewRotationScale > 0) W.RecoilViewRotationScale = default.M110RecoilViewRotationScale;
    if (default.M110RecoilMaxPitchLimit > 0) W.RecoilMaxPitchLimit = default.M110RecoilMaxPitchLimit;

}

static function ApplyM24(CW_Rifle_M24_Ex W)
{
    if (!default.bEnableRuntimeTuning || W == none)
    {
        return;
    }

    if (default.M24Damage > 0) W.InstantHitDamage[0] = default.M24Damage;
    if (default.M24FireInterval > 0) W.FireInterval[0] = default.M24FireInterval;
    if (default.M24PenetrationPower > 0) W.PenetrationPower[0] = default.M24PenetrationPower;
    if (default.M24MagazineCapacity > 0) W.MagazineCapacity[0] = default.M24MagazineCapacity;
    if (default.M24SpareAmmoCapacity > 0) W.SpareAmmoCapacity[0] = default.M24SpareAmmoCapacity;
    if (default.M24MaxRecoilPitch > 0) W.maxRecoilPitch = default.M24MaxRecoilPitch;
    if (default.M24MinRecoilPitch > 0) W.minRecoilPitch = default.M24MinRecoilPitch;
    if (default.M24MaxRecoilYaw != 0 || default.M24MinRecoilYaw != 0)
    {
        W.maxRecoilYaw = default.M24MaxRecoilYaw;
        W.minRecoilYaw = default.M24MinRecoilYaw;
    }
    if (default.M24RecoilRate > 0) W.RecoilRate = default.M24RecoilRate;
    if (default.M24RecoilViewRotationScale > 0) W.RecoilViewRotationScale = default.M24RecoilViewRotationScale;
    if (default.M24RecoilMaxPitchLimit > 0) W.RecoilMaxPitchLimit = default.M24RecoilMaxPitchLimit;

}

static function float GetAutoMagAfflictionPower(EAfflictionType AfflictionType, float InPower)
{
    if (!default.bEnableRuntimeTuning)
    {
        return InPower;
    }

    switch (AfflictionType)
    {
        case AF_Knockdown:
            return default.AutoMagKnockdownPower;
        case AF_Stumble:
            return default.AutoMagStumblePower;
        case AF_Stun:
            return default.AutoMagStunPower;
        case AF_GunHit:
            return default.AutoMagGunHitPower;
    }

    return InPower;
}

static function float GetM107AfflictionPower(EAfflictionType AfflictionType, float InPower)
{
    if (!default.bEnableRuntimeTuning)
    {
        return InPower;
    }

    switch (AfflictionType)
    {
        case AF_Knockdown:
            return default.M107KnockdownPower;
        case AF_Stumble:
            return default.M107StumblePower;
        case AF_Stun:
            return default.M107StunPower;
        case AF_GunHit:
            return default.M107GunHitPower;
    }

    return InPower;
}

static function float GetM110AfflictionPower(EAfflictionType AfflictionType, float InPower)
{
    if (!default.bEnableRuntimeTuning)
    {
        return InPower;
    }

    switch (AfflictionType)
    {
        case AF_Knockdown:
            return default.M110KnockdownPower;
        case AF_Stumble:
            return default.M110StumblePower;
        case AF_Stun:
            return default.M110StunPower;
        case AF_GunHit:
            return default.M110GunHitPower;
    }

    return InPower;
}

static function float GetM24AfflictionPower(EAfflictionType AfflictionType, float InPower)
{
    if (!default.bEnableRuntimeTuning)
    {
        return InPower;
    }

    switch (AfflictionType)
    {
        case AF_Knockdown:
            return default.M24KnockdownPower;
        case AF_Stumble:
            return default.M24StumblePower;
        case AF_Stun:
            return default.M24StunPower;
        case AF_GunHit:
            return default.M24GunHitPower;
    }

    return InPower;
}
