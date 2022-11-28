//=============================================================================
// CBPBloodSpurt. Rebuild with ScriptRays.
//=============================================================================
class CBPBloodSpurt extends BloodSpurt;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

simulated final function FunnyName1()
{
	Velocity = vect(0.0,0.0,0.0);
	if ( int(Level.NetMode)!=int(ENetMode.NM_DedicatedServer) )
	{
		DrawScale -= FRand()*0.5;
		PlayAnim( 'Spurt' );
		if ( Class'GameInfo'.default.bLowGore )
		{
			Destroy();
		}
	}
}

simulated function PreBeginPlay()
{
	Super(Actor).PreBeginPlay();
}

//-----------------------------------------------------------------------------
// state Flying.
//-----------------------------------------------------------------------------

auto simulated state Flying
{
	simulated function AnimEnd()
	{
		Destroy();
	}

	simulated function BeginState()
	{
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
 bNetOptional=True
 LifeSpan=0.600000
 DrawScale=1.500000
 ScaleGlow=2.000000
 bUnlit=True
}
