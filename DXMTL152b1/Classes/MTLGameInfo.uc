//=============================================================================
// MTLGameInfo. Rebuild with ScriptRays.
//=============================================================================
class MTLGameInfo extends DeusExGameInfo;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event InitGame( string Options, out string Error )
{
	Class'FunnyName53'.static.FunnyName56( Self, Options, Error );
}

function PostBeginPlay()
{
	FunnyName49(Level.SpawnNotify).FunnyName1();
	Super.PostBeginPlay();
}

function ScoreKill( Pawn Killer, Pawn Other )
{
}

function Killed( Pawn Killer, Pawn Other, name damageType )
{
	Super.Killed( Killer, Other, damageType );
	BaseMutator.ScoreKill( Killer, Other );
}

function bool ApproveClass( Class<PlayerPawn> SpawnClass )
{
	return true;
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

event PlayerPawn Login( string Portal, string Options, out string Error, Class<PlayerPawn> SpawnClass )
{
	local string FunnyName364, FunnyName365;
	local DeusExPlayer Player;
	local NavigationPoint StartSpot;
	local byte InTeam;
	local DumpLocation dump;
	local int FunnyName366;

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
	Player = DeusExPlayer(Super(GameInfo).Login(Portal,Options,Error,SpawnClass));
	if ( Player!=None )
	{
		Player.UpdateURL( "Class", string(SpawnClass), true );
		Player.SaveConfig();
	}
	if ( Player!=None && !HasOption(Options,string('LoadGame')) )
	{
		Player.ResetPlayerToDefaults();
		dump = Player.CreateDumpLocationObject();
		if ( dump!=None && dump.HasLocationBeenSaved() )
		{
			dump.LoadLocation();
			Player.Pause();
			Player.SetLocation( dump.currentDumpLocation.Location );
			Player.SetRotation( dump.currentDumpLocation.ViewRotation );
			Player.ViewRotation = dump.currentDumpLocation.ViewRotation;
			Player.ClientSetRotation( dump.currentDumpLocation.ViewRotation );
			CriticalDelete( dump );
		}
		else
		{
			InTeam = byte(GetIntOption(Options,"Team",0));
			if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
			{
				StartSpot = FindPlayerStart( None, InTeam, Portal );
			}
			else
			{
				StartSpot = FindPlayerStart( Player, InTeam, Portal );
			}
			Player.SetLocation( StartSpot.Location );
			Player.SetRotation( StartSpot.Rotation );
			Player.ViewRotation = StartSpot.Rotation;
			Player.ClientSetRotation( Player.Rotation );
		}
	}
	return Player;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 DefaultPlayerClass=Class'DXMTL152b1.MTLJCDenton'
 GameReplicationInfoClass=Class'DXMTL152b1.MTLGRI'
}
