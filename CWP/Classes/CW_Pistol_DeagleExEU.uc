//=============================================================================
// CW_Pistol_DeagleExEU
//=============================================================================
// EU balance variant of Deagle Ex.
// - Keeps the existing 20% faster partial/tactical reload.
// - Makes empty reloads 20% slower.
// - Fixes vertical recoil at the upper boundary.
//=============================================================================

class CW_Pistol_DeagleExEU extends CW_Pistol_DeagleEx;

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
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleExEU'

    maxRecoilPitch=650
    minRecoilPitch=650

    DualClass=class'CWP.CW_Pistol_DualDeagleExEU'
}
