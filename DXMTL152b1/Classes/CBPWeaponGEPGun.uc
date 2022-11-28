//=============================================================================
// CBPWeaponGEPGun. Rebuild with ScriptRays.
//=============================================================================
class CBPWeaponGEPGun extends WeaponGEPGun;

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
	Class'FunnyName53'.static.FunnyName11( Self, FunnyName390, FunnyName391, 1.6 );
}

simulated function Tick( float deltaTime )
{
	if ( IsInState('DownWeapon') || IsInState('SimDownweapon') )
	{
		FunnyName390 += deltaTime;
	}
	Super.Tick( deltaTime );
}

function CycleAmmo()
{
	if ( !IsInState('Reload') )
	{
		Super.CycleAmmo();
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
