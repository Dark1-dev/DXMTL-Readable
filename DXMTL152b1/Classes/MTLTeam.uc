//=============================================================================
// MTLTeam. Rebuild with ScriptRays.
//=============================================================================
class MTLTeam extends TeamDMGame;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var Class<MTLPlayer> FunnyName32;
var Class<MTLPlayer> FunnyName31;
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
	local int FunnyName352;
	local string FunnyName353;

	if ( MaxPlayers>0 && NumPlayers>=MaxPlayers )
	{
		Error = TooManyPlayers;
		return None;
	}
	FunnyName352 = 128;
	if ( HasOption(Options,"Team") )
	{
		FunnyName353 = ParseOption( Options, "Team" );
		if ( FunnyName353!="" )
		{
			FunnyName352 = int(FunnyName353);
		}
	}
	if ( !ApproveTeam(FunnyName352) )
	{
		FunnyName352 = 128;
	}
	if ( FunnyName352==128 )
	{
		FunnyName352 = GetAutoTeam();
	}
	if ( FunnyName352==1 )
	{
		SpawnClass = FunnyName31;
	}
	else
	{
		SpawnClass = FunnyName32;
	}
	ChangeOption( Options, "Class", string(SpawnClass) );
	ChangeOption( Options, "Team", string(FunnyName352) );
	FunnyName351 = MTLPlayer(Super(DeusExMPGame).Login(Portal,Options,Error,SpawnClass));
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

function SetTeam( DeusExPlayer NewPlayer )
{
	if ( NewPlayer.IsA(FunnyName32.Name) )
	{
		NewPlayer.PlayerReplicationInfo.Team = 0;
		NewPlayer.MultiplayerNotifyMsg( NewPlayer.0 );
	}
	else if ( NewPlayer.IsA(FunnyName31.Name) )
	{
		NewPlayer.PlayerReplicationInfo.Team = 1;
		NewPlayer.MultiplayerNotifyMsg( NewPlayer.1 );
	}
	else
	{
		Log( "Warning: Player:"$string(NewPlayer)$" has chosen an invalid team!" );
	}
}

function bool ChangeTeam( Pawn PawnToChange, int NewTeam )
{
	local Class<MTLPlayer> FunnyName358;
	local MTLPlayer FunnyName359;

	if ( !ApproveTeam(NewTeam) )
	{
		NewTeam = 128;
	}
	if ( NewTeam==128 )
	{
		if ( PlayerPawn(PawnToChange)!=None )
		{
			NewTeam = int(PlayerPawn(PawnToChange).PlayerReplicationInfo.Team);
		}
		else
		{
			return false;
		}
	}
	if ( !Super(DeusExMPGame).ChangeTeam(PawnToChange,NewTeam) )
	{
		return false;
	}
	FunnyName359 = MTLPlayer(PawnToChange);
	if ( FunnyName359==None )
	{
		return false;
	}
	if ( NewTeam==0 )
	{
		FunnyName358 = FunnyName32;
	}
	else if ( NewTeam==1 )
	{
		FunnyName358 = FunnyName31;
	}
	else
	{
		return false;
	}
	return Class'FunnyName53'.static.FunnyName57( FunnyName359, FunnyName358 );
}

simulated function bool ArePlayersAllied( DeusExPlayer FirstPlayer, DeusExPlayer SecondPlayer )
{
	if ( FirstPlayer==None || SecondPlayer==None || FirstPlayer.PlayerReplicationInfo==None || SecondPlayer.PlayerReplicationInfo==None )
	{
		return false;
	}
	return int(FirstPlayer.PlayerReplicationInfo.Team)==int(SecondPlayer.PlayerReplicationInfo.Team);
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
 FunnyName32=Class'DXMTL152b1.MTLUNATCO'
 FunnyName31=Class'DXMTL152b1.MTLNSF'
 DefaultPlayerClass=Class'DXMTL152b1.MTLUNATCO'
 GameReplicationInfoClass=Class'DXMTL152b1.MTLGRI'
 NetPriority=10.000000
}
