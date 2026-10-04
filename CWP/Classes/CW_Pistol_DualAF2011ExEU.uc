//=============================================================================
// CW_Pistol_DualAF2011ExEU
//=============================================================================
// EU balance variant of Dual AF2011 Ex.
// - Applies the modeled 5% AF2011 reload slowdown to both reload conditions.
// - Keeps the existing 20% faster partial/tactical reload before that modifier.
// - Makes empty reloads 35% slower before that modifier.
//=============================================================================

class CW_Pistol_DualAF2011ExEU extends CW_Pistol_DualAF2011Ex;

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
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_AF2011DualExEU'
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'CWP.KFDT_Ballistic_AF2011DualExEU'

    SingleClass=class'CWP.CW_Pistol_AF2011ExEU'

    // Keep the AFEx attachment archetype explicitly so the EU variant uses its TracerInfos.
    AttachmentArchetypeName="AF2011_Custom_Ex.Wep_Dual_AF2001_3P_Ex"
    AttachmentArchetype=KFWeapAttach_DualBase'AF2011_Custom_Ex.Wep_Dual_AF2001_3P_Ex'

    // EU recoil range from the balance sheet.
    maxRecoilPitch=650
    minRecoilPitch=650
    maxRecoilYaw=225
    minRecoilYaw=-225
}
