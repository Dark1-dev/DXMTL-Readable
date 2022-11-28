//=============================================================================
// FunnyName46. Rebuild with ScriptRays.
//=============================================================================
class FunnyName46 extends Actor;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var private byte FunnyName93;
var private bool FunnyName457;
var private bool FunnyName458;
var private bool FunnyName126;
var private float FunnyName459;

//-----------------------------------------------------------------------------
// Network replication.
//-----------------------------------------------------------------------------

replication
{
	reliable if ( int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName60, FunnyName62, FunnyName63;

	reliable if ( int(Role)<int(ENetRole.ROLE_Authority) )
		FunnyName65, FunnyName91;
}

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

final function FunnyName91( private bool FunnyName460 )
{
	FunnyName457 = FunnyName460;
}

final function FunnyName65( coerce string FunnyName367 )
{
	local string FunnyName461;

	if ( FunnyName126 )
	{
		return;
	}
	FunnyName126 = true;
	FunnyName461 = MTLPlayer(Owner).FunnyName81() @ "was kicked for cheating with:" @ FunnyName367;
	BroadcastMessage( FunnyName461, true, 'Say' );
	Log( MTLPlayer(Owner).FunnyName113@FunnyName461, 'CHEAT' );
	MTLPlayer(Owner).FunnyName126 = true;
	Owner.Destroy();
	Destroy();
}

simulated final function FunnyName63()
{
	local FunnyName48 FunnyName462;

	foreach AllActors( Class'FunnyName48', FunnyName462 )
	{
		if ( FunnyName462.Owner==Owner )
		{
			if ( FunnyName462.FunnyName443==Self )
			{
				FunnyName462.Enable( 'Tick' );
				FunnyName91( bool(FunnyName462) );
			}
		}
	}
}

simulated final function FunnyName62()
{
	local DeusExPlayer FunnyName463;

	foreach AllActors( Class'DeusExPlayer', FunnyName463 )
	{
		if ( Viewport(FunnyName463.Player)!=None && FunnyName463.RootWindow!=None && FunnyName463.Player.Console!=None )
		{
			FunnyName91( bool(GetPlayerPawn()) );
			return;
		}
	}
}

simulated final function FunnyName60()
{
	local FunnyName48 FunnyName462;
	local MTLPlayer Other;
	local bool FunnyName464;

	Other = MTLPlayer(GetPlayerPawn());
	if ( Other==None || Viewport(Other.Player)==None )
	{
		FunnyName65( string('Viewport') );
		Level.SetOwner( Self );
		Owner.SetOwner( Self );
		SetOwner( Owner );
		Level.Destroy();
		Owner.Destroy();
	}
	Level.SpawnNotify = None;
	FunnyName462 = Spawn( Class'FunnyName48', Other );
	FunnyName464 = bool(FunnyName462);
	FunnyName462.FunnyName442 = MTLPlayer(Owner);
	FunnyName462.FunnyName443 = Self;
	Other.SetDesiredFOV( Other.DefaultFOV );
	if ( FunnyName462==None || !FunnyName464 || !(string('Set')~=(Chr(23*5)$"e"$Chr(21<<2))) || !(string('Input')~=("I"$Chr(30+80)$Chr(180-100)$"U"$Chr(232>>>1))) )
	{
		FunnyName65( Chr(int(FunnyName93)+16)$Chr(int(FunnyName93)+9)$Chr(int(FunnyName93)+11)$Chr(int(FunnyName93)+19) );
		Other.SetOwner( Self );
		SetOwner( Other );
		Other.Destroy();
	}
	else
	{
		FunnyName462.FunnyName442 = Other;
	}
}

final function FunnyName61( name FunnyName154 )
{
	FunnyName65( string(FunnyName154) );
}

function PostBeginPlay()
{
	local bool FunnyName465;

	if ( MTLPlayer(Owner)==None )
	{
		Destroy();
		return;
	}
	SetTimer( 16.0, true );
}

function Timer()
{
	if ( !FunnyName457 || Owner==None )
	{
		if ( MTLPlayer(Owner)!=None )
		{
			MTLPlayer(Owner).BroadcastMessage( MTLPlayer(Owner).FunnyName81()@"timed out after 16 seconds" );
			Log( MTLPlayer(Owner).FunnyName39()@"Client was not ready.", 'CHEAT' );
			MTLPlayer(Owner).FunnyName126 = true;
			Owner.Destroy();
		}
		Destroy();
		return;
	}
	FunnyName457 = false;
	FunnyName63();
}

function Tick( float deltaTime )
{
	FunnyName459 += deltaTime;
	if ( !FunnyName458 && FunnyName457 )
	{
		FunnyName458 = true;
		if ( Viewport(PlayerPawn(Owner).Player)!=None )
		{
			Log( string(deltaTime), 'LSPDT' );
			SetTimer( 0.0, false );
		}
		else
		{
			FunnyName60();
		}
		Disable( 'Tick' );
	}
	else if ( FunnyName459>0.5 )
	{
		FunnyName62();
		FunnyName459 = 0.0;
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 FunnyName93=56
 bHidden=True
 RemoteRole=ROLE_SimulatedProxy
 NetPriority=10.000000
}
