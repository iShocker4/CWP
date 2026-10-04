//=============================================================================
// KFDT_Ballistic_DeagleDualExEU
//=============================================================================
// EU damage type for Dual Deagle Ex.
// The WeaponDef link keeps damage and weapon statistics associated with the EU
// WeaponDef instead of the non-EU Dual Deagle Ex definition.
//=============================================================================

class KFDT_Ballistic_DeagleDualExEU extends KFDT_Ballistic_DeagleDualEx
    abstract;

DefaultProperties
{
    WeaponDef=class'CWP.KFWeapDef_DeagleDualExEU'
}
