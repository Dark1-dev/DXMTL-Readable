//=============================================================================
// MTLGRI. Rebuild with ScriptRays.
//=============================================================================
class MTLGRI extends GameReplicationInfo;

//-----------------------------------------------------------------------------
// Structures.
//-----------------------------------------------------------------------------

struct ssmsg
{
	var Color c1;
	var string s1;
	var string s2;
	var string s3;
	var string s4;
	var string s5;
	var string s6;
	var string s7;
	var string s8;
	var string s9;
	var string s10;
	var bool b3;
	var bool b1;
};

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var Color MOTDColor;
var transient ssmsg smsg0;

//-----------------------------------------------------------------------------
// Network replication.
//-----------------------------------------------------------------------------

replication
{
	reliable if ( bNetInitial && int(Role)==int(ENetRole.ROLE_Authority) )
		smsg0;
}

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function PreBeginPlay()
{
	local DeusExLevelInfo FunnyName342;

	Super.PreBeginPlay();
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		return;
	}
	smsg0.c1 = MOTDColor;
	smsg0.s1 = ServerName;
	smsg0.s2 = MOTDLine1;
	smsg0.s3 = MOTDLine2;
	smsg0.s4 = MOTDLine3;
	smsg0.s5 = MOTDLine4;
	smsg0.s6 = AdminName;
	smsg0.s7 = AdminEmail;
	foreach AllActors( Class'DeusExLevelInfo', FunnyName342 )
	{
		break;
	}
	if ( FunnyName342!=None )
	{
		smsg0.s8 = FunnyName342.MapName;
		smsg0.s9 = FunnyName342.MapAuthor;
		smsg0.s10 = FunnyName342.MissionLocation;
		if ( smsg0.s8!="" || smsg0.s9!="" || smsg0.s10!="" )
		{
			smsg0.b3 = true;
		}
	}
	smsg0.b1 = true;
}

simulated function Timer()
{
	local PlayerReplicationInfo FunnyName343;
	local int keyIndex, FunnyName344;

	if ( int(Level.NetMode)==int(ENetMode.NM_Client) )
	{
		if ( Level.TimeSeconds-SecondCount>=Level.TimeDilation )
		{
			ElapsedTime++;
			if ( RemainingMinute!=0 )
			{
				RemainingTime = RemainingMinute;
				RemainingMinute = 0;
			}
			if ( RemainingTime>0 && !bStopCountDown )
			{
				RemainingTime--;
			}
			SecondCount += Level.TimeDilation;
		}
	}
	for ( keyIndex=0; keyIndex<32; keyIndex++ )
	{
		PRIArray[keyIndex] = None;
	}
	keyIndex = 0;
	foreach AllActors( Class'PlayerReplicationInfo', FunnyName343 )
	{
		PRIArray[keyIndex++] = FunnyName343;
		if ( keyIndex>=32 )
		{
			break;
		}
	}
	UpdateTimer = 0.0;
	for ( keyIndex=0; keyIndex<32; keyIndex++ )
	{
		if ( PRIArray[keyIndex]!=None )
		{
			FunnyName344 += int(PRIArray[keyIndex].Score);
		}
	}
	SumFrags = FunnyName344;
	if ( Level.Game!=None )
	{
		NumPlayers = Level.Game.NumPlayers;
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 MOTDColor=(R=48,G=48,B=255)
 NetPriority=1.100000
}
