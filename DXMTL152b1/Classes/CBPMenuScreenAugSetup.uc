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
	local LevelInfo FunnyName320;
	local int keyIndex;

	Super.SaveSettings();
	FunnyName320 = Player.GetEntryLevel();
	if ( FunnyName320!=None )
	{
		foreach FunnyName320.AllActors( Class'DeusExPlayer', Player )
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
