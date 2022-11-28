//=============================================================================
// MTLMenuScreenPlayerSetup. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuScreenPlayerSetup extends menuscreenplayersetup;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var MTLMenuChoice_Class FunnyName509;
var CBPMenuChoice_Connection FunnyName510;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function CreateClassChoice()
{
	FunnyName509 = MTLMenuChoice_Class(winClient.NewChild(Class'MTLMenuChoice_Class'));
	FunnyName509.SetPos( 6.0, 120.0 );
	FunnyName509.SetSize( 153.0, 213.0 );
}

function CreateHelpChoice()
{
	HelpChoice = menuchoice_multihelp(winClient.NewChild(Class'CBPMenuChoice_MultiHelp'));
	HelpChoice.SetPos( 6.0, 81.0 );
}

function CreateConnectionChoice()
{
	FunnyName510 = CBPMenuChoice_Connection(winClient.NewChild(Class'CBPMenuChoice_Connection'));
	FunnyName510.SetPos( 6.0, 54.0 );
}

function CreateTeamChoice()
{
	TeamChoice = menuchoice_team(winClient.NewChild(Class'CBPMenuChoice_Team'));
	TeamChoice.SetPos( 176.0, 120.0 );
	TeamChoice.SetSize( 153.0, 213.0 );
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 filterString=""
}
