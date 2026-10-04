//=============================================================================
// CW_Pistol_AF2011ExEU
//=============================================================================
// EU balance variant of AF2011 Ex.
// - Applies the modeled 5% AF2011 reload slowdown to both reload conditions.
// - Keeps the existing 20% faster partial/tactical reload before that modifier.
// - Makes empty reloads 35% slower before that modifier.
// - Uses the EU vertical and horizontal recoil ranges.
//=============================================================================

class CW_Pistol_AF2011ExEU extends CW_Pistol_AF2011Ex;

simulated function float GetReloadRateScale()
{
    local float ReloadRateScale;

    ReloadRateScale = Super.GetReloadRateScale();
    if (AmmoCount[0] > 0)
    {
        return ReloadRateScale * 1.05f;
    }

    return ReloadRateScale * 1.35f * 1.05f;
}

DefaultProperties
{
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_AF2011ExEU'
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'CWP.KFDT_Ballistic_AF2011ExEU'

    maxRecoilPitch=650
    minRecoilPitch=650
    maxRecoilYaw=225
    minRecoilYaw=-225

    DualClass=class'CWP.CW_Pistol_DualAF2011ExEU'
}
