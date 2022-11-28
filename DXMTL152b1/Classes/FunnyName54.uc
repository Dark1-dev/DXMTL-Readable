//=============================================================================
// FunnyName54. Rebuild with ScriptRays.
//=============================================================================
class FunnyName54 extends Actor;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var byte FunnyName20;

//-----------------------------------------------------------------------------
// Network replication.
//-----------------------------------------------------------------------------

replication
{
	reliable if ( bNetInitial && int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName20;
}

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

simulated final function FunnyName1()
{
	local Actor A;
	local byte keyIndex;

	if ( int(Level.NetMode)==int(ENetMode.NM_DedicatedServer) || Class'GameInfo'.default.bLowGore )
	{
		return;
	}
	A = Spawn( Class'CBPBloodSpurt', , , Location );
	if ( A!=None )
	{
		A.RemoteRole = ROLE_None;
	}
	keyIndex = 0;
	while ( int(keyIndex)<int(FunnyName20) )
	{
		A = Spawn( Class'CBPBloodDrop', , , Location );
		if ( A!=None )
		{
			A.RemoteRole = ROLE_None;
		}
		keyIndex++;
	}
}

//-----------------------------------------------------------------------------
// state FunnyName19.
//-----------------------------------------------------------------------------

auto simulated state FunnyName19
{
Begin:

Begin:
	FunnyName1();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 FunnyName20=2
 bNetTemporary=True
 bNetOptional=True
 RemoteRole=ROLE_SimulatedProxy
 LifeSpan=1.000000
 DrawType=DT_None
 Texture=None
}
