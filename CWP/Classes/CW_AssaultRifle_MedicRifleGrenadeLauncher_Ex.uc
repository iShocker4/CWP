class CW_AssaultRifle_MedicRifleGrenadeLauncher_Ex extends KFWeap_AssaultRifle_MedicRifleGrenadeLauncher;

simulated event SetWeapon()
{
    super.SetWeapon();
    class'Utils'.static.ApplyCustomSkin(self, class'KFGameContent.KFWeap_AssaultRifle_MedicRifleGrenadeLauncher');
}

defaultproperties
{
    bRechargeHealAmmo=false
    bCanRefillSecondaryAmmo=true

    // Pickup
    AmmoPickupScale[1]=2.0

    // Ammo
    InitialSpareMags[0]=2
    MagazineCapacity[0]=30
    SpareAmmoCapacity[0]=210
    AmmoPickupScale[0]=1.0

    InitialSpareMags[1]=3
    MagazineCapacity[1]=1
    SpareAmmoCapacity[1]=9

    bCanBeReloaded=true
    bReloadFromMagazine=true

    // Recoil
    maxRecoilPitch=150
    minRecoilPitch=125
    maxRecoilYaw=125
    minRecoilYaw=-125
    RecoilRate=0.11
    RecoilMaxYawLimit=500
    RecoilMinYawLimit=65035
    RecoilMaxPitchLimit=900
    RecoilMinPitchLimit=65035
    RecoilISMaxYawLimit=75
    RecoilISMinYawLimit=65460
    RecoilISMaxPitchLimit=375
    RecoilISMinPitchLimit=65460
    IronSightMeshFOVCompensationScale=1.5
    HippedRecoilModifier=1.5

    SecondaryAmmoTexture=Texture2D'ui_firemodes_tex.UI_FireModeSelect_Grenade'
    bUseGrenadeAsSecondaryAmmo=true

    // Inventory / Grouping
    InventorySize=8
    GroupPriority=125
    WeaponSelectTexture=Texture2D'WEP_UI_Medic_GrenadeLauncher_TEX.UI_WeaponSelect_MedicGrenadeLauncher'
    AssociatedPerkClasses(0)=class'KFPerk_FieldMedic'
    AssociatedPerkClasses(1)=class'KFPerk_Commando'

    // DEFAULT_FIREMODE
    FireInterval(DEFAULT_FIREMODE)=+0.12
    Spread(DEFAULT_FIREMODE)=0.0085
    InstantHitDamage(DEFAULT_FIREMODE)=47.0
    InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_MedicRifleGrenadeLauncher_Ex'
    FireOffset=(X=30,Y=4.5,Z=-5)
    SecondaryFireOffset=(X=39,Y=4.5,Z=-10)

    // ALT_FIREMODE
    FireInterval(ALTFIRE_FIREMODE)=+0.25f
    InstantHitDamage(ALTFIRE_FIREMODE)=50.0
    InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'CWP.KFDT_Ballistic_MedicRifleGrenadeLauncherImpact_Ex'
    WeaponProjectiles(ALTFIRE_FIREMODE)=class'CWP.KFProj_MedicGrenade_Mini_Ex'
    AmmoCost(ALTFIRE_FIREMODE)=1
    Spread(ALTFIRE_FIREMODE)=0.0085

    // BASH_FIREMODE
    InstantHitDamage(BASH_FIREMODE)=26
    InstantHitDamageTypes(BASH_FIREMODE)=class'CWP.KFDT_Bludgeon_MedicRifleGrenadeLauncher_Ex'

    // Upgrades disabled
    WeaponUpgrades.Empty
}
