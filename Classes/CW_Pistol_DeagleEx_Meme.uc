class CW_Pistol_DeagleEx_Meme extends CW_Pistol_DeagleEx;

DefaultProperties
{
	InstantHitDamageTypes(DEFAULT_FIREMODE)=class'CWP.KFDT_Ballistic_DeagleEx_Meme'
	InstantHitDamage(DEFAULT_FIREMODE)=115.0000

	// Ammo
	MagazineCapacity[0]=12

	// 650 RPM
	FireInterval(DEFAULT_FIREMODE)=+0.0923077

	// Link the Meme single and dual variants.
	DualClass=class'CWP.CW_Pistol_DualDeagleEx_Meme'
}
