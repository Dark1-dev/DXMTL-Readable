//=============================================================================
// MTLMenuChoice_VictoryType. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuChoice_VictoryType extends menuchoice_victorytype;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var MTLMenuScreenHostGame hostparent;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function SetValue( int NewValue )
{
	Super(MenuUIChoiceEnum).SetValue( NewValue );
	if ( hostparent!=None && hostparent.VictoryValueChoice!=None )
	{
		hostparent.VictoryValueChoice.SetVictoryType( GetModuleName(NewValue) );
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
