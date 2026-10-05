//=============================================================================
// KFDT_Ballistic_AF2011DualEx
//=============================================================================
// Package-owned damage type for the non-EU Dual AF2011 Ex.
// Keeping a dedicated WeaponDef link makes scoreboard and match-stat entries
// identify the dual weapon instead of falling back to the single AF2011 Ex.
//=============================================================================

class KFDT_Ballistic_AF2011DualEx extends KFDT_Ballistic_AF2011Ex
    abstract
    hidedropdown;

defaultproperties
{
    WeaponDef=class'CWP.KFWeapDef_AF2011DualEx'
}
