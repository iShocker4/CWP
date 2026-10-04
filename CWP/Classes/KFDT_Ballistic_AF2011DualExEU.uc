//=============================================================================
// KFDT_Ballistic_AF2011DualExEU
//=============================================================================
// EU damage type for Dual AF2011 Ex.
// The WeaponDef link keeps damage and weapon statistics associated with the
// EU Dual WeaponDef instead of the non-EU AF2011 Ex definition.
//=============================================================================

class KFDT_Ballistic_AF2011DualExEU extends KFDT_Ballistic_AF2011Ex
    abstract
    hidedropdown;

DefaultProperties
{
    WeaponDef=class'CWP.KFWeapDef_AF2011DualExEU'
}
