//=============================================================================
// FunnyName55. Rebuild with ScriptRays.
//=============================================================================
class FunnyName55 extends Actor;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var FunnyName55 FunnyName213;
var FunnyName55 FunnyName212;
var DeusExMover FunnyName188;
var float FunnyName486;
var bool FunnyName487;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

final function FunnyName59( DeusExMover FunnyName369 )
{
	FunnyName188 = FunnyName369;
	FunnyName486 = FunnyName369.TimeSinceReset;
}

function Tick( float deltaTime )
{
	if ( FunnyName188==None )
	{
		Disable( 'Tick' );
		return;
	}
	FunnyName486 += deltaTime;
	if ( !FunnyName188.bPicking && FunnyName486>FunnyName188.TimeToReset )
	{
		FunnyName487 = true;
	}
	if ( FunnyName487 )
	{
		FunnyName188.bLocked = true;
		FunnyName188.lockStrength = FunnyName188.initiallockStrength;
		FunnyName188.bFrobbable = false;
		if ( int(FunnyName188.KeyNum)==0 )
		{
			if ( !FunnyName188.bInterpolating )
			{
				FunnyName188.bFrobbable = true;
				Destroy();
			}
		}
		else
		{
			FunnyName188.DoClose();
		}
	}
}

function Destroyed()
{
	if ( FunnyName213!=None )
	{
		FunnyName213.FunnyName212 = FunnyName212;
	}
	if ( FunnyName212!=None )
	{
		FunnyName212.FunnyName213 = FunnyName213;
	}
	Super.Destroyed();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 bHidden=True
 RemoteRole=ROLE_None
}
