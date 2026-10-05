//=============================================================================
// KFDT_Ballistic_AF2011DualEx_AT
//=============================================================================
// Package-owned damage type for the Dual AF2011 Ex AT.
//=============================================================================

class KFDT_Ballistic_AF2011DualEx_AT extends KFDT_Ballistic_AF2011Ex_AT
    abstract
    hidedropdown;

defaultproperties
{
    WeaponDef=class'CWP.KFWeapDef_AF2011DualEx_AT'
}
