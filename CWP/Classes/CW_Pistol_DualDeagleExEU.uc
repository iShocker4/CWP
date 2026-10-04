//=============================================================================
// CW_Pistol_DualDeagleExEU
//=============================================================================
// EU balance variant of Dual Deagle Ex.
// - Keeps the existing 20% faster partial/tactical reload.
// - Makes empty reloads 20% slower.
//=============================================================================

class CW_Pistol_DualDeagleExEU extends CW_Pistol_DualDeagleEx;

simulated function float GetReloadRateScale()
{
    local float ReloadRateScale;

    ReloadRateScale = Super.GetReloadRateScale();
    if (AmmoCount[0] > 0)
    {
        return ReloadRateScale;
    }

    return ReloadRateScale * 1.2f;
}

DefaultProperties
{
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleDualExEU'
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleDualExEU'

    SingleClass=class'CWP.CW_Pistol_DeagleExEU'

    // Fix vertical recoil at the upper boundary.
    maxRecoilPitch=650
    minRecoilPitch=650

    // EU balance sheet: reduce dual Deagle fire rate from 545 to 500 RPM.
    FireInterval(DEFAULT_FIREMODE)=+0.12
    FireInterval(ALTFIRE_FIREMODE)=+0.12
}
