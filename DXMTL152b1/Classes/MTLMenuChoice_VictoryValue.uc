//=============================================================================
// MTLMenuChoice_VictoryValue. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuChoice_VictoryValue extends menuchoice_victoryvalue;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function SetVictoryType( string VictoryType )
{
	local float TickPercent;

	TickPercent = float(btnSlider.winSlider.GetTickPosition()+1)/float(numTicks);
	if ( VictoryType~="Frags" )
	{
		startValue = 1.0;
		numTicks = 100;
		endValue = 100.0;
		actionText = FragLimitActionText;
		HelpText = FragLimitHelpText;
	}
	else if ( VictoryType~="Time" )
	{
		startValue = 1.0;
		numTicks = 60;
		endValue = 60.0;
		actionText = TimeLimitActionText;
		HelpText = TimeLimitHelpText;
	}
	btnAction.SetButtonText( actionText );
	btnSlider.SetTicks( numTicks, int(startValue), int(endValue) );
	btnSlider.winSlider.SetTickPosition( Clamp(int(TickPercent*float(numTicks)-float(1)),0,numTicks-1) );
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 numTicks=100
 endValue=100.000000
}
