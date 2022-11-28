//=============================================================================
// CBPMenuChoice_Team. Rebuild with ScriptRays.
//=============================================================================
class CBPMenuChoice_Team extends menuchoice_team;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var string FunnyName522;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function SetInitialTeam()
{
}

function SetValue( int newValue )
{
	CurrentValue = newValue;
	UpdateInfoButton();
	UpdatePortrait();
}

function SaveSetting()
{
	local string SkinName;

	SkinName = GetModuleName( CurrentValue );
	Player.ChangeTeam( int(SkinName) );
	if ( !(SkinName~=FunnyName522) )
	{
		Player.UpdateURL( "Team", SkinName, true );
		Player.SaveConfig();
	}
}

function LoadSetting()
{
	local int typeIndex;

	FunnyName522 = Player.GetDefaultURL( "Team" );
	typeIndex = int(GetModuleName(int(FunnyName522)));
	if ( typeIndex==128 )
	{
		typeIndex = 2;
	}
	SetValue( typeIndex );
	SaveSetting();
}

function ResetToDefault()
{
	CurrentValue = defaultValue;
	SaveSetting();
	LoadSetting();
}

function string GetModuleName( int TeamIndex )
{
	if ( TeamIndex==0 )
	{
		return string(0);
	}
	if ( TeamIndex==1 )
	{
		return string(1);
	}
	return string(128);
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
