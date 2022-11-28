//=============================================================================
// CBPMenuChoice_MultiHelp. Rebuild with ScriptRays.
//=============================================================================
class CBPMenuChoice_MultiHelp extends menuchoice_multihelp;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function LoadSetting()
{
	SetValue( int(Player.bHelpMessages) );
}

function SaveSetting()
{
	local bool TeamNum;

	TeamNum = bool(GetValue());
	if ( Player.bHelpMessages!=TeamNum )
	{
		Player.bHelpMessages = TeamNum;
		Player.SaveConfig();
	}
}

function ResetToDefault()
{
	CurrentValue = defaultValue;
	SaveSetting();
	LoadSetting();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 configSetting=""
}
