//=============================================================================
// CBPHUDObjectBelt. Rebuild with ScriptRays.
//=============================================================================
class CBPHUDObjectBelt extends HUDObjectBelt;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function CreateSlots()
{
	local int keyIndex;
	local RadioBoxWindow winRadio;

	winRadio = RadioBoxWindow(NewChild(Class'RadioBoxWindow'));
	winRadio.SetSize( 504.0, 54.0 );
	winRadio.SetPos( 10.0, 6.0 );
	winRadio.bOneCheck = false;
	winSlots = TileWindow(winRadio.NewChild(Class'TileWindow'));
	winSlots.SetMargins( 0.0, 0.0 );
	winSlots.SetMinorSpacing( 0.0 );
	winSlots.SetOrder( ORDER_LeftThenUp );
	for ( keyIndex=0; keyIndex<10; keyIndex++ )
	{
		objects[keyIndex] = HUDObjectSlot(winSlots.NewChild(Class'CBPHUDObjectSlot'));
		objects[keyIndex].SetObjectNumber( keyIndex );
		objects[keyIndex].Lower();
		if ( keyIndex==0 )
		{
			objects[keyIndex].SetWidth( 44.0 );
		}
	}
	objects[0].Lower();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
