//=============================================================================
// KFWeapDef_MosinNagant
//=============================================================================
// A lightweight container for basic weapon properties that can be safely
// accessed without a weapon actor (UI, remote clients).
//=============================================================================
// Killing Floor 2
// Copyright (C) 2019 Tripwire Interactive LLC
//=============================================================================

class KFWeapDef_MosinNagantEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Rifle_MosinNagantEx", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Rifle_MosinNagantEx"
	ImagePath="wep_ui_mosin_tex.UI_WeaponSelect_MosinNagant"

	BuyPrice=2500
	AmmoPricePerMag=42

	EffectiveRange=90
}
