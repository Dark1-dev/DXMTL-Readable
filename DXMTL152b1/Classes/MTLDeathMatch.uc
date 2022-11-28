//=============================================================================
// MTLDeathMatch. Rebuild with ScriptRays.
//=============================================================================
class MTLDeathMatch extends DeathMatchGame;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var MTLManager FunnyName345;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event InitGame( string Options, out string Error )
{
	Class'FunnyName53'.static.FunnyName56( Self, Options, Error );
}

function PreBeginPlay()
{
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		if ( FunnyName345==None )
		{
			FunnyName345 = Spawn( Class'MTLManager' );
		}
		FunnyName345.FunnyName409 = Self;
	}
	Super.PreBeginPlay();
}

function PostBeginPlay()
{
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		FunnyName49(Level.SpawnNotify).FunnyName1();
	}
	Super.PostBeginPlay();
}

function bool ApproveClass( Class<PlayerPawn> SpawnClass )
{
	return true;
}

function ScoreKill( Pawn Killer, Pawn Other )
{
}

function Killed( Pawn Killer, Pawn Other, name damageType )
{
	Super.Killed( Killer, Other, damageType );
	BaseMutator.ScoreKill( Killer, Other );
}

function ChangeOption( out string Options, string OptionKey, string newValue )
{
	local string NewOptions, CurOption, CurKey, CurValue;

	NewOptions = "";
	while ( GrabOption(Options,CurOption) )
	{
		GetKeyValue( CurOption, CurKey, CurValue );
		if ( CurKey~=OptionKey )
		{
			CurValue = newValue;
		}
		NewOptions = NewOptions $ "?" $ CurKey $ "=" $ CurValue;
	}
	Options = NewOptions;
}

event PreLogin( string Options, string Address, out string Error, out string FailCode )
{
	Super.PreLogin( Options, Address, Error, FailCode );
	if ( Error=="" )
	{
	}
	if ( Len(Options)>800 || HasOption(Options,string('LoadGame')) )
	{
		Error = "PreLogin Failed.";
	}
}

event PlayerPawn Login( string Portal, string Options, out string Error, Class<PlayerPawn> SpawnClass )
{
	local MTLPlayer FunnyName351;
	local string FunnyName364, FunnyName365;
	local int FunnyName366;

	if ( MaxPlayers>0 && NumPlayers>=MaxPlayers )
	{
		Error = TooManyPlayers;
		return None;
	}
	SpawnClass = DefaultPlayerClass;
	FunnyName364 = ParseOption( Options, "Class" );
	FunnyName366 = InStr( FunnyName364, "." );
	if ( FunnyName366!=-1 )
	{
		FunnyName365 = mid( FunnyName364, FunnyName366+1 );
		FunnyName364 = Left( FunnyName364, FunnyName366 );
	}
	else
	{
		FunnyName365 = FunnyName364;
		FunnyName364 = "";
	}
	if ( FunnyName365~="MPNSF" || FunnyName365~="MTLNSF" )
	{
		SpawnClass = Class'MTLNSF';
	}
	else if ( FunnyName365~="MPUNATCO" || FunnyName365~="MTLUNATCO" )
	{
		SpawnClass = Class'MTLUNATCO';
	}
	else if ( FunnyName365~="MPMJ12" || FunnyName365~="MTLMJ12" )
	{
		SpawnClass = Class'MTLMJ12';
	}
	ChangeOption( Options, "Class", string(SpawnClass) );
	FunnyName351 = MTLPlayer(Super.Login(Portal,Options,Error,SpawnClass));
	if ( FunnyName351!=None )
	{
		FunnyName351.FunnyName83( FunnyName351.PlayerReplicationInfo.PlayerName );
	}
	return FunnyName351;
}

function SetupAbilities( DeusExPlayer aPlayer )
{
	local MTLPlayer FunnyName351;

	FunnyName351 = MTLPlayer(aPlayer);
	if ( FunnyName351==None )
	{
		return;
	}
	if ( FunnyName351.FunnyName127 )
	{
		FunnyName351.FunnyName127 = false;
		return;
	}
	FunnyName351.SkillPointsAvail = SkillsAvail;
	FunnyName351.SkillPointsTotal = SkillsAvail;
	if ( bAugsAllowed )
	{
		GrantAugs( FunnyName351, InitialAugs );
	}
}

event PostLogin( PlayerPawn NewPlayer )
{
	local MTLPlayer FunnyName351;

	FunnyName351 = MTLPlayer(NewPlayer);
	FunnyName351.FunnyName113 = Class'FunnyName53'.static.FunnyName90( FunnyName351 );
	FunnyName351.FunnyName112 = FunnyName345;
	if ( FunnyName351.bAdmin )
	{
		FunnyName351.PlayerReplicationInfo.bAdmin = true;
		Log( FunnyName351.FunnyName39(), 'AdminLogin' );
	}
	FunnyName345.FunnyName68( FunnyName351 );
	Super.PostLogin( FunnyName351 );
}

function Logout( Pawn Exiting )
{
	Super.Logout( Exiting );
	if ( Exiting.IsA('PlayerPawn') && !Exiting.IsA('Spectator') && PlayerPawn(Exiting).GameReplicationInfo==None )
	{
		NumPlayers++;
	}
}

function bool SetEndCams( string FunnyName367 )
{
	local Pawn Player, FunnyName368;

	GetWinningPlayer( FunnyName368 );
	for ( Player=Level.PawnList; Player!=None; Player=Player.nextPawn )
	{
		if ( Player.IsA('PlayerPawn') )
		{
			PlayerPawn(Player).bBehindView = true;
			PlayerPawn(Player).ViewTarget = FunnyName368;
		}
		Player.ClientGameEnded();
		Player.GotoState( 'GameEnded' );
	}
	return true;
}

simulated function RefreshScoreArray( DeusExPlayer NewPlayer )
{
	local int i, FunnyName362;
	local PlayerReplicationInfo lpri;
	local PlayerPawn pp;

	if ( NewPlayer==None )
	{
		return;
	}
	pp = NewPlayer.GetPlayerPawn();
	if ( pp==None || pp.GameReplicationInfo==None )
	{
		return;
	}
	scorePlayers = 0;
	for ( i=0; i<32; i++ )
	{
		lpri = pp.GameReplicationInfo.PRIArray[i];
		if ( lpri!=None && (!lpri.bIsSpectator || lpri.bWaitingPlayer) )
		{
			scoreArray[scorePlayers].PlayerName = lpri.PlayerName;
			scoreArray[scorePlayers].Score = lpri.Score;
			scoreArray[scorePlayers].Deaths = lpri.Deaths;
			scoreArray[scorePlayers].Streak = lpri.Streak;
			scoreArray[scorePlayers].Team = int(lpri.Team);
			scoreArray[scorePlayers].PlayerID = lpri.PlayerID;
			scorePlayers++;
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 DefaultPlayerClass=Class'DXMTL152b1.MTLJCDenton'
 GameReplicationInfoClass=Class'DXMTL152b1.MTLGRI'
 NetPriority=10.000000
}
