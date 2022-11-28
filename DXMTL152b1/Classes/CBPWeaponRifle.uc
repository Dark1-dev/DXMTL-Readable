//=============================================================================
// CBPWeaponRifle. Rebuild with ScriptRays.
//=============================================================================
class CBPWeaponRifle extends WeaponRifle;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var private float FunnyName390;
var private float FunnyName391;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

simulated final function FunnyName5()
{
	Class'FunnyName53'.static.FunnyName11( Self, FunnyName390, FunnyName391, reloadTime );
}

simulated final function float FunnyName95( float FunnyName392 )
{
	return FunnyName392*(1.0-FunnyName391);
}

simulated function Tick( float deltaTime )
{
	if ( IsInState('DownWeapon') || IsInState('SimDownweapon') )
	{
		FunnyName390 += deltaTime;
	}
	Super.Tick( deltaTime );
}

simulated function MuzzleFlashLight()
{
	if ( Pawn(Owner)!=None )
	{
		Super.MuzzleFlashLight();
	}
}

simulated function ClientReload()
{
	if ( !IsInState('SimReload') )
	{
		Super.ClientReload();
	}
}

function ReloadAmmo()
{
	Class'FunnyName53'.static.FunnyName12( Self );
}

function ScopeOn()
{
	if ( bHasScope && !bZoomed && Owner!=None && Owner.IsA('DeusExPlayer') )
	{
		bZoomed = true;
		if ( IsInState('Reload') )
		{
			ClipCount = 0;
		}
		RefreshScopeDisplay( DeusExPlayer(Owner), false, bZoomed );
		if ( !IsInState('FunnyName2') )
		{
			GotoState( 'FunnyName2' );
		}
	}
}

simulated function RefreshScopeDisplay(DeusExPlayer player, bool bInstant, bool bScopeOn)
{
	if ( player==None || player.RootWindow==None )
	{
		return;
	}
	if ( bScopeOn )
	{
		DeusExRootWindow(player.RootWindow).scopeView.ActivateView( ScopeFOV, false, bInstant );
		if ( !IsInState('FunnyName2') )
		{
			GotoState( 'FunnyName2' );
		}
	}
	else
	{
		DeusExRootWindow(player.RootWindow).scopeView.DeactivateView();
	}
}

//-----------------------------------------------------------------------------
// state FunnyName2.
//-----------------------------------------------------------------------------

simulated state FunnyName2
{
	function Fire( float Value ); // Possible ignored non probe named function.
	function AltFire( float Value ); // Possible ignored non probe named function.
	function bool ClientFire( float Value ); // Possible ignored non probe named function.
	function ClientReFire( float Value ); // Possible ignored non probe named function.

Begin:

Begin:
	Sleep( 0.035 );
	if ( int(Level.NetMode)==int(ENetMode.NM_Client) )
	{
		GotoState( 'SimIdle' );
	}
	else
	{
		GotoState( 'Idle' );
	}
}

//-----------------------------------------------------------------------------
// state FunnyName6.
//-----------------------------------------------------------------------------

simulated state FunnyName6
{
	function Fire( float Value ); // Possible ignored non probe named function.
	function AltFire( float Value ); // Possible ignored non probe named function.
	function bool ClientFire( float Value ); // Possible ignored non probe named function.
	function ClientReFire( float Value ); // Possible ignored non probe named function.

Begin:

Begin:
	ScopeOn();
}

//-----------------------------------------------------------------------------
// state Reload.
//-----------------------------------------------------------------------------

state Reload
{
	function float GetReloadTime()
	{
		return FunnyName95( Super.GetReloadTime() );
	}

	function EndState()
	{
		FunnyName391 = 0.0;
		Super.EndState();
	}
}

//-----------------------------------------------------------------------------
// state SimReload.
//-----------------------------------------------------------------------------

simulated state SimReload
{
	simulated function float GetSimReloadTime()
	{
		return FunnyName95( Super.GetSimReloadTime() );
	}

	simulated function EndState()
	{
		FunnyName391 = 0.0;
		Super.EndState();
	}

Begin:

Begin:
	if ( bWasInFiring )
	{
		if ( bHasMuzzleFlash )
		{
			EraseMuzzleFlashTexture();
		}
		FinishAnim();
	}
	bInProcess = false;
	bFiring = false;
	bWasZoomed = bZoomed;
	if ( bWasZoomed )
	{
		ScopeOff();
	}
	Owner.PlaySound( CockingSound, SLOT_None, , , 1024.0 );
	PlayAnim( 'ReloadBegin' );
	FinishAnim();
	LoopAnim( 'Reload' );
	Sleep( GetSimReloadTime() );
	Owner.PlaySound( AltFireSound, SLOT_None, , , 1024.0 );
	ServerDoneReloading();
	PlayAnim( 'ReloadEnd' );
	FinishAnim();
	if ( bWasZoomed )
	{
		GotoState( 'FunnyName6' );
	}
	GotoState( 'SimIdle' );
}

//-----------------------------------------------------------------------------
// state SimDownweapon.
//-----------------------------------------------------------------------------

simulated state SimDownweapon
{
	simulated function BeginState()
	{
		RefreshScopeDisplay( DeusExPlayer(Owner), false, false );
		Super.BeginState();
	}
}

//-----------------------------------------------------------------------------
// state DownWeapon.
//-----------------------------------------------------------------------------

state DownWeapon
{
	function Fire( float Value ); // Possible ignored non probe named function.
	function AltFire( float Value ); // Possible ignored non probe named function.

Begin:

Begin:
	Class'FunnyName53'.static.FunnyName13( Self );
	FinishAnim();
	bOnlyOwnerSee = false;
	if ( Pawn(Owner)!=None )
	{
		Pawn(Owner).ChangedWeapon();
	}
}

//-----------------------------------------------------------------------------
// state Active.
//-----------------------------------------------------------------------------

state Active
{
	function BeginState()
	{
		FunnyName5();
		Super.BeginState();
	}
}

//-----------------------------------------------------------------------------
// state SimActive.
//-----------------------------------------------------------------------------

simulated state SimActive
{
	simulated function BeginState()
	{
		FunnyName5();
		SimClipCount = ClipCount;
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
