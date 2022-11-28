//=============================================================================
// MTLMOTD. Rebuild with ScriptRays.
//=============================================================================
class MTLMOTD extends Actor;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var localized string l_welcome;
var localized string l_adminname;
var localized string l_adminemail;
var localized string l_mapname;
var localized string l_mapauthor;
var localized string l_mlocation;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function PostBeginPlay()
{
	SetTimer( 0.5, true );
}

function Timer()
{
	local HUDMissionStartTextDisplay FunnyName404;
	local MTLGRI FunnyName405;
	local DeusExPlayer FunnyName406;

	FunnyName406 = DeusExPlayer(Owner);
	if ( FunnyName406==None )
	{
		SetTimer( 0.0, false );
		return;
	}
	if ( FunnyName406.RootWindow!=None && DeusExRootWindow(FunnyName406.RootWindow).HUD!=None )
	{
		FunnyName404 = DeusExRootWindow(FunnyName406.RootWindow).HUD.startDisplay;
	}
	FunnyName405 = MTLGRI(FunnyName406.GameReplicationInfo);
	if ( FunnyName404!=None && FunnyName405!=None && FunnyName405.smsg0.b1 )
	{
		FunnyName404.Message = "";
		FunnyName404.charIndex = 0;
		FunnyName404.winText.SetText( "" );
		FunnyName404.winTextShadow.SetText( "" );
		FunnyName404.winText.SetTextColor( FunnyName405.smsg0.c1 );
		FunnyName404.displayTime = 5.0;
		FunnyName404.perCharDelay = 0.3;
		FunnyName404.AddMessage( " " );
		FunnyName404.AddMessage( " " );
		if ( FunnyName405.smsg0.s1!="" )
		{
			FunnyName404.AddMessage( l_welcome@FunnyName405.smsg0.s1 );
		}
		else
		{
			FunnyName404.AddMessage( l_welcome@Level.GetAddressURL() );
		}
		FunnyName404.AddMessage( " " );
		FunnyName404.AddMessage( FunnyName405.smsg0.s2 );
		FunnyName404.AddMessage( FunnyName405.smsg0.s3 );
		FunnyName404.AddMessage( FunnyName405.smsg0.s4 );
		FunnyName404.AddMessage( FunnyName405.smsg0.s5 );
		FunnyName404.AddMessage( " " );
		if ( FunnyName405.smsg0.s6!="" )
		{
			FunnyName404.AddMessage( l_adminname@FunnyName405.smsg0.s6 );
		}
		if ( FunnyName405.smsg0.s7!="" )
		{
			FunnyName404.AddMessage( l_adminemail@FunnyName405.smsg0.s7 );
		}
		if ( FunnyName405.smsg0.b3 )
		{
			FunnyName404.AddMessage( " " );
			if ( FunnyName405.smsg0.s8!="" )
			{
				FunnyName404.AddMessage( l_mapname@FunnyName405.smsg0.s8 );
			}
			if ( FunnyName405.smsg0.s9!="" )
			{
				FunnyName404.AddMessage( l_mapauthor@FunnyName405.smsg0.s9 );
			}
			if ( FunnyName405.smsg0.s10!="" )
			{
				FunnyName404.AddMessage( l_mlocation@FunnyName405.smsg0.s10 );
			}
		}
		FunnyName404.StartMessage();
		SetTimer( 0.0, false );
		return;
	}
}

function Tick( float deltaTime )
{
	local DeusExLevelInfo FunnyName342;

	foreach AllActors( Class'DeusExLevelInfo', FunnyName342 )
	{
		break;
	}
	if ( FunnyName342!=None )
	{
		FunnyName342.missionNumber = 7;
		FunnyName342.bMultiPlayerMap = true;
		FunnyName342.ConversationPackage = Class'DeusExLevelInfo'.default.ConversationPackage;
		Disable( 'Tick' );
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 l_welcome="Welcome to"
 l_adminname="Admin Name:"
 l_adminemail="Admin Email:"
 l_mapname="Map Name:"
 l_mapauthor="Map Author:"
 l_mlocation="Mission Location:"
 bHidden=True
 RemoteRole=ROLE_None
 LifeSpan=10.000000
}
