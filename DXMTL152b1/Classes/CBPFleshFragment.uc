//=============================================================================
// CBPFleshFragment. Rebuild with ScriptRays.
//=============================================================================
class CBPFleshFragment extends FleshFragment;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var float FunnyName71;
var float time;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

simulated final function FunnyName1()
{
	local vector FunnyName238;

	if ( int(Level.NetMode)!=int(ENetMode.NM_DedicatedServer) )
	{
		Velocity = VRand()*float(300);
		FunnyName238 = Velocity;
		FunnyName238.Z = 0.0;
		SetRotation( Rotator(FunnyName238) );
		DrawScale = FRand()*1.1+1.1;
		if ( Class'GameInfo'.default.bLowGore )
		{
			Destroy();
		}
	}
}

simulated function Tick( float deltaTime )
{
	local CBPBloodDrop FunnyName398;

	if ( int(Level.NetMode)==int(ENetMode.NM_DedicatedServer) )
	{
		Disable( 'Tick' );
		return;
	}
	Super(Actor).Tick( deltaTime );
	time += deltaTime;
	if ( time<0.064 )
	{
		return;
	}
	if ( !IsInState('Dying') )
	{
		if ( FRand()<FunnyName71 )
		{
			FunnyName398 = Spawn( Class'CBPBloodDrop', , , Location );
			if ( FunnyName398!=None )
			{
				FunnyName398.RemoteRole = ROLE_None;
			}
		}
		FunnyName71 -= time*0.1;
	}
	time = 0.0;
}

//-----------------------------------------------------------------------------
// state Flying.
//-----------------------------------------------------------------------------

auto simulated state Flying
{
	simulated function BeginState()
	{
		Super(Object).BeginState();
	}

Begin:

Begin:
	FunnyName1();
}

//-----------------------------------------------------------------------------
// state Dying.
//-----------------------------------------------------------------------------

simulated state Dying
{
	simulated function BeginState()
	{
		Super.BeginState();
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 FunnyName71=0.500000
}
