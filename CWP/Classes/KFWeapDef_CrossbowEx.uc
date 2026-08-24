//=============================================================================
// KFWeapDef_CrossbowEx
//=============================================================================
// นิยามอาวุธ (Weapon Definition) สำหรับร้านค้า — Crossbow Custom (Sharpshooter)
// กำหนดชื่อ, รายละเอียด, ราคา, ภาพ และคลาสอาวุธที่จะ spawn
//=============================================================================

class KFWeapDef_CrossbowEx extends KFWeaponDefinition abstract;

static function string GetItemDescription()
{
	return Localize("CW_Bow_CrossbowEx", "ItemDescription", "CWP");
}

DefaultProperties
{
	WeaponClassPath="CWP.CW_Bow_CrossbowEx"
	ImagePath="WEP_UI_Crossbow_TEX.UI_WeaponSelect_Crossbow"

	BuyPrice=650
	AmmoPricePerMag=11

	EffectiveRange=80
}
