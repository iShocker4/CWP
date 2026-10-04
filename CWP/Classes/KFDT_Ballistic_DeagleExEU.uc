//=============================================================================
// KFDT_Ballistic_DeagleExEU
//=============================================================================
// EU damage type for single Deagle Ex.
// The WeaponDef link keeps damage and weapon statistics associated with the
// EU WeaponDef instead of the non-EU Deagle Ex definition.
//=============================================================================

class KFDT_Ballistic_DeagleExEU extends KFDT_Ballistic_DeagleEx
    abstract;

DefaultProperties
{
    WeaponDef=class'CWP.KFWeapDef_DeagleExEU'
}
