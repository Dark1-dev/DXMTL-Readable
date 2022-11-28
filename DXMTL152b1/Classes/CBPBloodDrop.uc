//=============================================================================
// CBPBloodDrop. Rebuild with ScriptRays.
//=============================================================================
class CBPBloodDrop extends BloodDrop;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

simulated final function FunnyName1()
{
	if ( int(Level.NetMode)!=int(ENetMode.NM_DedicatedServer) )
	{
		Velocity = VRand()*float(100);
		DrawScale = 1.0+FRand();
		SetRotation( Rotator(Velocity) );
		if ( Class'GameInfo'.default.bLowGore )
		{
			Destroy();
		}
	}
}

simulated final function FunnyName70( rotator FunnyName238 )
{
	if ( int(Level.NetMode)!=int(ENetMode.NM_DedicatedServer) )
	{
		Spawn( Class'CBPBloodSplat', , , Location, FunnyName238 );
		Destroy();
	}
}

simulated function Tick( float deltaTime )
{
	if ( int(Level.NetMode)==int(ENetMode.NM_DedicatedServer) )
	{
		Disable( 'Tick' );
		return;
	}
	if ( Velocity==vect(0.0,0.0,0.0) )
	{
		FunnyName70( rot(16384,0,0) );
	}
	else
	{
		SetRotation( Rotator(Velocity) );
	}
}

simulated function PreBeginPlay()
{
	Super(Actor).PreBeginPlay();
}

simulated function PostBeginPlay()
{
	Super(Fragment).PostBeginPlay();
}

//-----------------------------------------------------------------------------
// state Flying.
//-----------------------------------------------------------------------------

simulated state Flying
{
	simulated function HitWall( vector HitNormal, Actor Wall )
	{
		FunnyName70( Rotator(HitNormal) );
	}

	simulated function BeginState()
	{
		Super(Object).BeginState();
	}

Begin:

Begin:
	FunnyName1();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 bNetTemporary=True
 LifeSpan=5.000000
 DrawScale=1.500000
 ScaleGlow=2.000000
 bUnlit=True
 NetUpdateFrequency=100.000000
}
