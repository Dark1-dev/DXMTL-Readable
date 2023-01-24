//=============================================================================
// MTLMenuMain. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuMain extends MenuMain;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function ShowVersionInfo()
{
	local TextWindow version;

	version = TextWindow(NewChild(Class'TextWindow'));
	version.SetLines( 1, 2 );
	version.SetTextMargins( 0.0, 0.0 );
	version.SetWindowAlignments( HALIGN_Right, VALIGN_Bottom );
	version.SetTextColorRGB( 255, 255, 255 );
	version.SetTextAlignments( HALIGN_Right, VALIGN_Bottom );
	version.SetText( Player.GetDeusExVersion()$"|nSep 02 2002 DXMTL V1.52b1" );
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
