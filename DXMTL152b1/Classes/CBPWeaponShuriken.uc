//=============================================================================
// CBPWeaponShuriken. Rebuild with ScriptRays.
//=============================================================================
class CBPWeaponShuriken extends WeaponShuriken;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function ServerHandleNotify( bool bInstantHit, Class<Projectile> ProjClass, float projSpeed, bool bWarn )
{
	if ( AmmoType.UseAmmo(1) )
	{
		ProjectileFire( ProjectileClass, ProjectileSpeed, bWarnTarget );
	}
	if ( AmmoType.AmmoAmount<=0 && !Class'MTLManager'.default.bKnife_KeepPlaceholder )
	{
		Destroy();
	}
}

simulated function HandToHandAttack()
{
	if ( AmmoType.AmmoAmount>0 )
	{
		if ( DeusExPlayer(Owner)==DeusExPlayer(GetPlayerPawn()) )
		{
			ServerHandleNotify( false, None, 0.0, false );
		}
	}
}

simulated function OwnerHandToHandAttack()
{
}

simulated function bool ClientFire( float Value )
{
	local bool bWaitOnAnim;

	if ( Owner==None )
	{
		GotoState( 'SimIdle' );
		return false;
	}
	if ( Region.Zone.bWaterZone )
	{
		if ( Pawn(Owner)!=None )
		{
			Pawn(Owner).ClientMessage( msgNotWorking );
		}
		return false;
	}
	if ( !bLooping )
	{
		bWaitOnAnim = IsAnimating() && (AnimSequence=='Select' || AnimSequence=='Shoot' || AnimSequence=='ReloadBegin' || AnimSequence=='Reload' || AnimSequence=='ReloadEnd' || AnimSequence=='Down');
	}
	else
	{
		bWaitOnAnim = false;
		bLooping = false;
	}
	if ( Owner.IsA('DeusExPlayer') && DeusExPlayer(Owner).NintendoImmunityTimeLeft>0.01 || !bClientReadyToFire || bInProcess || bWaitOnAnim )
	{
		DeusExPlayer(Owner).bJustFired = false;
		bPointing = false;
		bFiring = false;
		return false;
	}
	ServerForceFire();
	if ( AmmoType.AmmoAmount<=0 )
	{
		GotoState( 'SimIdle' );
		return false;
	}
	bClientReadyToFire = false;
	bInProcess = true;
	GotoState( 'ClientFiring' );
	bPointing = true;
	if ( PlayerPawn(Owner)!=None )
	{
		PlayerPawn(Owner).PlayFiring();
	}
	PlaySelectiveFiring();
	PlayFiringSound();
	return true;
}

function Fire( float Value )
{
	local bool bListenClient;

	if ( Owner==None )
	{
		GotoState( 'Idle' );
		return;
	}
	bListenClient = Owner.IsA( 'DeusExPlayer' ) && DeusExPlayer(Owner).PlayerIsListenClient();
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		if ( Owner.IsA('DeusExPlayer') && DeusExPlayer(Owner).NintendoImmunityTimeLeft>0.01 || !bClientReady && !bListenClient )
		{
			DeusExPlayer(Owner).bJustFired = false;
			bReadyToFire = true;
			bPointing = false;
			bFiring = false;
			return;
		}
	}
	if ( Region.Zone.bWaterZone )
	{
		if ( Pawn(Owner)!=None )
		{
			Pawn(Owner).ClientMessage( msgNotWorking );
		}
		GotoState( 'Idle' );
		return;
	}
	if ( AmmoType.AmmoAmount<=0 )
	{
		GotoState( 'Idle' );
		return;
	}
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) && !bListenClient )
	{
		bClientReady = false;
	}
	bReadyToFire = false;
	GotoState( 'NormalFire' );
	bPointing = true;
	if ( Owner.IsA('PlayerPawn') )
	{
		PlayerPawn(Owner).PlayFiring();
	}
	PlaySelectiveFiring();
	PlayFiringSound();
	if ( DeusExPlayer(Owner)!=None )
	{
		DeusExPlayer(Owner).UpdateBeltText( Self );
	}
}

//-----------------------------------------------------------------------------
// state NormalFire.
//-----------------------------------------------------------------------------

state NormalFire
{
	function AnimEnd()
	{
		if ( AmmoType.AmmoAmount<=0 )
		{
			GotoState( 'Idle' );
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 ProjectileClass=Class'DXMTL152b1.CBPShuriken'
}
