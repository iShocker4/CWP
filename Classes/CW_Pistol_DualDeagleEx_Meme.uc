class CW_Pistol_DualDeagleEx_Meme extends CW_Pistol_DualDeagleEx;

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleDualEx_Meme'
	InstantHitDamageTypes(ALTFIRE_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleDualEx_Meme'
	InstantHitDamage(DEFAULT_FIREMODE)=115.0000
	InstantHitDamage(ALTFIRE_FIREMODE)=115.0000

	// Ammo
	MagazineCapacity[0]=24

	// 650 RPM for both fire modes.
	FireInterval(DEFAULT_FIREMODE)=+0.0923077
	FireInterval(ALTFIRE_FIREMODE)=+0.0923077

	// 50% lower recoil than the base Dual Evil Deagle.
	maxRecoilPitch=325
	minRecoilPitch=325

	// Link the Meme single and dual variants.
	SingleClass=class'CWP.CW_Pistol_DeagleEx_Meme'
}
