//=============================================================================
// MTLManager. Rebuild with ScriptRays.
//=============================================================================
class MTLManager extends Actor
	config(DXMTL);

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var globalconfig int iBytesPerSec;
var globalconfig int iBytesPerFive;
var globalconfig int iMsgPerSec;
var globalconfig int iMsgPerFive;
var globalconfig int iMaxNumOfSpams;
var globalconfig int iSpawnMassLimit;
var globalconfig bool bAllowAdminGet;
var globalconfig bool bAllowAdminSet;
var globalconfig bool bAllowSummon;
var globalconfig bool bAllowSpawnMass;
var globalconfig bool bAllowGetPlayerIP;
var globalconfig bool bKnife_FullRefill;
var globalconfig bool bKnife_KeepPlaceholder;
var globalconfig bool bInvincibleAmmoCrates;
var FunnyName47 FunnyName407;
var FunnyName55 FunnyName408;
var GameInfo FunnyName409;
var MTLPlayer FunnyName410;
var bool FunnyName411;

//-----------------------------------------------------------------------------
// Network replication.
//-----------------------------------------------------------------------------

replication
{
	reliable if ( int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName409;
}

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function PreBeginPlay()
{
	local bool FunnyName412;

	if ( FunnyName411 )
	{
		return;
	}
	iMaxNumOfSpams = Max( iMaxNumOfSpams, 1 );
	iSpawnMassLimit = Clamp( iSpawnMassLimit, 1, 250 );
	SaveConfig();
	if ( int(Level.NetMode)==int(ENetMode.NM_ListenServer) )
	{
		SetTimer( 0.5, true );
	}
	FunnyName407 = Spawn( Class'FunnyName47', Self );
	FunnyName407.LifeSpan = 0.0;
	FunnyName407.FunnyName468 = "LIST";
	FunnyName408 = Spawn( Class'FunnyName55', Self );
	FunnyName411 = true;
}

function Timer()
{
	FunnyName410 = MTLPlayer(GetPlayerPawn());
	if ( FunnyName410==None )
	{
		return;
	}
	FunnyName410.FunnyName112 = Self;
	FunnyName410.Spawn( Class'MTLMOTD', FunnyName410 );
	SetTimer( 0.0, false );
}

simulated function PostBeginPlay()
{
	local ZoneInfo FunnyName413;

	if ( int(Level.NetMode)!=int(ENetMode.NM_Client) )
	{
		return;
	}
	FunnyName410 = MTLPlayer(GetPlayerPawn());
	if ( FunnyName410==None )
	{
		return;
	}
	FunnyName410.FunnyName112 = Self;
	FunnyName410.Spawn( Class'MTLMOTD', FunnyName410 );
	foreach AllActors( Class'ZoneInfo', FunnyName413 )
	{
		FunnyName413.LinkToSkybox();
		if ( FunnyName413.IsA('SkyZoneInfo') )
		{
			Log( "SkyZoneInfo Repaired!", 'DXMTL' );
		}
	}
}

simulated function Tick( float deltaTime )
{
	if ( Level.Game==None && FunnyName409!=None )
	{
		Level.Game = FunnyName409;
	}
}

final function FunnyName22( MTLPlayer Player )
{
	local FunnyName47 FunnyName414, FunnyName415;
	local int FunnyName416;

	if ( FunnyName407!=None )
	{
		for ( FunnyName414=FunnyName407.FunnyName212; FunnyName414!=None; FunnyName414=FunnyName414.FunnyName212 )
		{
			FunnyName416++;
			FunnyName415 = FunnyName414;
		}
		if ( FunnyName416>=Level.Game.MaxPlayers+2 )
		{
			FunnyName415.Destroy();
		}
		FunnyName414 = Spawn( Class'FunnyName47', Self );
		FunnyName414.FunnyName213 = FunnyName407;
		FunnyName414.FunnyName212 = FunnyName407.FunnyName212;
		if ( FunnyName407.FunnyName212!=None )
		{
			FunnyName407.FunnyName212.FunnyName213 = FunnyName414;
		}
		FunnyName407.FunnyName212 = FunnyName414;
		FunnyName414.FunnyName64( Player );
	}
}

final function FunnyName68( MTLPlayer Player )
{
	if ( FunnyName407!=None )
	{
		FunnyName407.FunnyName15( Player );
	}
}

final function FunnyName23( DeusExMover FunnyName369, out FunnyName55 FunnyName417 )
{
	local FunnyName55 FunnyName418;

	FunnyName418 = Spawn( Class'FunnyName55', Self );
	FunnyName418.FunnyName213 = FunnyName417;
	FunnyName417.FunnyName212 = FunnyName418;
	FunnyName417 = FunnyName418;
	FunnyName417.FunnyName59( FunnyName369 );
}

final function FunnyName21( DeusExMover FunnyName369 )
{
	local FunnyName55 FunnyName417;
	local DeusExMover FunnyName419;

	if ( FunnyName369.bInitialLocked && !FunnyName369.bLocked && FunnyName369.initiallockStrength>0.0 )
	{
		for ( FunnyName417=FunnyName408; FunnyName417!=None; FunnyName417=FunnyName417.FunnyName212 )
		{
			if ( FunnyName417.FunnyName188==FunnyName369 )
			{
				break;
			}
			if ( FunnyName417.FunnyName212==None )
			{
				FunnyName23( FunnyName369, FunnyName417 );
				if ( FunnyName369.Tag!='' && FunnyName369.Tag!='DeusExMover' )
				{
					foreach AllActors( Class'DeusExMover', FunnyName419, FunnyName369.Tag )
					{
						if ( FunnyName419!=FunnyName369 )
						{
							FunnyName23( FunnyName419, FunnyName417 );
						}
					}
				}
				break;
			}
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 iBytesPerSec=350
 iBytesPerFive=1000
 iMsgPerSec=5
 iMsgPerFive=15
 iMaxNumOfSpams=4
 iSpawnMassLimit=100
 bAllowAdminSet=True
 bAllowSummon=True
 bAllowSpawnMass=True
 bAllowGetPlayerIP=True
 bKnife_FullRefill=True
 bKnife_KeepPlaceholder=True
 bInvincibleAmmoCrates=True
 bHidden=True
 RemoteRole=ROLE_SimulatedProxy
 bAlwaysRelevant=True
 NetPriority=10.000000
}
