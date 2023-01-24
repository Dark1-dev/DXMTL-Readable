//=============================================================================
// CBPMenuScreenAugSetup. Rebuild with ScriptRays.
//=============================================================================
class CBPMenuScreenAugSetup extends menuscreenaugsetup;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function SaveSettings()
{
	local DeusExPlayer Player;
	local LevelInfo L;
	local int keyIndex;

	Super.SaveSettings();
	L = Player.GetEntryLevel();
	if ( L!=None )
	{
		foreach L.AllActors( Class'DeusExPlayer', Player )
		{
			for ( keyIndex=0; keyIndex<9; keyIndex++ )
			{
				Player.AugPrefs[keyIndex] = Player.AugPrefs[keyIndex];
			}
			Player.SaveConfig();
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
