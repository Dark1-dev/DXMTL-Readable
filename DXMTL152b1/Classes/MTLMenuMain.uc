//=============================================================================
// MTLMenuMain. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuMain extends MenuMain;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function ShowVersionInfo()
{
	local TextWindow FunnyName512;

	FunnyName512 = TextWindow(NewChild(Class'TextWindow'));
	FunnyName512.SetLines( 1, 2 );
	FunnyName512.SetTextMargins( 0.0, 0.0 );
	FunnyName512.SetWindowAlignments( HALIGN_Right, VALIGN_Bottom );
	FunnyName512.SetTextColorRGB( 255, 255, 255 );
	FunnyName512.SetTextAlignments( HALIGN_Right, VALIGN_Bottom );
	FunnyName512.SetText( Player.GetDeusExVersion()$"|nSep 02 2002 DXMTL V1.52b1" );
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 buttonDefaults(3)=(Invoke=Class'DXMTL152b1.CBPMenuSettings')
 buttonDefaults(8)=(Invoke=Class'DXMTL152b1.MTLMenuMPMain')
 Title="Welcome to DXMTL!"
 ClientHeight=415
}
