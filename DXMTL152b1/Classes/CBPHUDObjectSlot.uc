//=============================================================================
// CBPHUDObjectSlot. Rebuild with ScriptRays.
//=============================================================================
class CBPHUDObjectSlot extends HUDObjectSlot;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function UpdateItemText()
{
	local DeusExWeapon weapon;

	itemText = "";
	if ( Item==None )
	{
		return;
	}
	weapon = DeusExWeapon(Item);
	if ( weapon!=None && weapon.AmmoType!=None )
	{
		if ( weapon.IsA('WeaponNanoVirusGrenade') || weapon.IsA('WeaponGasGrenade') || weapon.IsA('WeaponEMPGrenade') || weapon.IsA('WeaponLAM') )
		{
			if ( weapon.AmmoType.AmmoAmount>1 )
			{
				itemText = CountLabel @ string(weapon.AmmoType.AmmoAmount);
			}
		}
		else if ( weapon.AmmoName!=Class'AmmoNone' && !weapon.bHandToHand && int(weapon.ReloadCount)!=0 )
		{
			itemText = weapon.AmmoType.beltDescription;
		}
	}
	else if ( Item.IsA('DeusExPickup') && !Item.IsA('NanoKeyRing') && DeusExPickup(Item).NumCopies>1 )
	{
		itemText = DeusExPickup(Item).CountLabel @ string(DeusExPickup(Item).NumCopies);
	}
}

function DrawHUDIcon( GC GC )
{
	if ( Item!=None && Item.Icon!=None )
	{
		GC.SetStyle( DSTY_Masked );
		GC.SetTileColorRGB( 255, 255, 255 );
		GC.DrawTexture( float(slotIconX), float(slotIconY), float(slotFillWidth), float(slotFillHeight), 0.0, 0.0, Item.Icon );
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
