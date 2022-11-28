//=============================================================================
// CBPMenuChoice_Connection. Rebuild with ScriptRays.
//=============================================================================
class CBPMenuChoice_Connection extends MenuUIChoiceEnum;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var int ConnectionSpeeds[8];
var localized string ConnectionNames[8];

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event InitWindow()
{
	Super.InitWindow();
	SetActionButtonWidth( 153 );
	btnAction.SetHelpText( HelpText );
}

function UpdateInfoButton()
{
	if ( btnInfo!=None )
	{
		btnInfo.SetButtonText( enumText[CurrentValue] );
	}
}

function PopulateConnectionSpeeds()
{
	local int FunnyName525, keyIndex;

	ConnectionSpeeds[7] = Class'Player'.default.ConfiguredInternetSpeed;
	keyIndex = 7;
	for ( FunnyName525=0; FunnyName525<8; FunnyName525++ )
	{
		enumText[FunnyName525] = ConnectionNames[FunnyName525] @ "(" $ string(ConnectionSpeeds[FunnyName525]) $ ")";
		if ( FunnyName525!=7 && ConnectionSpeeds[FunnyName525]==ConnectionSpeeds[7] )
		{
			keyIndex = FunnyName525;
		}
	}
	SetValue( keyIndex );
}

function SaveSetting()
{
	local bool FunnyName526;

	if ( ConnectionSpeeds[CurrentValue]!=ConnectionSpeeds[7] )
	{
		Class'Player'.default.ConfiguredInternetSpeed = ConnectionSpeeds[CurrentValue];
		Class'Player'.static.StaticSaveConfig();
		if ( MTLPlayer(Player)!=None && int(Player.Level.NetMode)==int(ENetMode.NM_Client) )
		{
			MTLPlayer(Player).FunnyName98( ConnectionSpeeds[CurrentValue] );
		}
	}
}

function LoadSetting()
{
	PopulateConnectionSpeeds();
}

function ResetToDefault()
{
	CurrentValue = defaultValue;
	SaveSetting();
	LoadSetting();
}

function string GetModuleName( int FunnyName525 )
{
	return string(ConnectionSpeeds[FunnyName525]);
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 ConnectionSpeeds(0)=1600
 ConnectionSpeeds(1)=2600
 ConnectionSpeeds(2)=3200
 ConnectionSpeeds(3)=5200
 ConnectionSpeeds(4)=10000
 ConnectionSpeeds(5)=15000
 ConnectionSpeeds(6)=20000
 ConnectionNames(0)="33.6k"
 ConnectionNames(1)="56k-Low"
 ConnectionNames(2)="56k-High"
 ConnectionNames(3)="ISDN"
 ConnectionNames(4)="DSL"
 ConnectionNames(5)="Cable"
 ConnectionNames(6)="T1/LAN"
 ConnectionNames(7)="Custom"
 defaultValue=1
 defaultInfoWidth=153
 defaultInfoPosX=170
 HelpText="Type of Internet Connection"
 actionText="Connection Type"
}
