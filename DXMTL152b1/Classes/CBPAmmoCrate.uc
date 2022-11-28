//=============================================================================
// CBPAmmoCrate. Rebuild with ScriptRays.
//=============================================================================
class CBPAmmoCrate extends ammocrate;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function PreBeginPlay()
{
	bInvincible = Class'MTLManager'.default.bInvincibleAmmoCrates;
	Super.PreBeginPlay();
}

function Frob( Actor Frobber, Inventory frobWith )
{
	local DeusExPlayer Player;
	local Inventory CurInventory;

	Player = DeusExPlayer(Frobber);
	if ( Player!=None )
	{
		for ( CurInventory=Player.Inventory; CurInventory!=None; CurInventory=CurInventory.Inventory )
		{
			if ( CurInventory.IsA('DeusExWeapon') && !CurInventory.IsA('WeaponLAM') && !CurInventory.IsA('WeaponEMPGrenade') && !CurInventory.IsA('WeaponGasGrenade') )
			{
				RestockWeapon( Player, DeusExWeapon(CurInventory) );
			}
		}
		Player.ClientMessage( AmmoReceived );
		PlaySound( Sound'DeusExSounds.Generic.WeaponPickup', SLOT_None, 0.5+FRand()*0.25, , 256.0, 0.95+FRand()*0.1 );
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 bInvincible=True
}
