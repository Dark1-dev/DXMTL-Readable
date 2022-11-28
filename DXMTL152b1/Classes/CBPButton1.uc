//=============================================================================
// CBPButton1. Rebuild with ScriptRays.
//=============================================================================
class CBPButton1 extends Button1;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

final function FunnyName1( Button1 TeamNum )
{
	local Mover FunnyName369;

	if ( TeamNum==None )
	{
		return;
	}
	ButtonType = TeamNum.ButtonType;
	buttonLitTime = TeamNum.buttonLitTime;
	buttonSound1 = TeamNum.buttonSound1;
	buttonSound2 = TeamNum.buttonSound2;
	bLit = TeamNum.bLit;
	bWaitForEvent = TeamNum.bWaitForEvent;
	Mesh = TeamNum.Mesh;
	moverTag = TeamNum.moverTag;
	DrawScale = TeamNum.DrawScale;
	isPressed = TeamNum.isPressed;
	SetSkin( ButtonType, bLit );
	if ( moverTag!='' )
	{
		foreach AllActors( Class'Mover', FunnyName369, moverTag )
		{
			SetBase( FunnyName369 );
			break;
		}
	}
}

simulated function Tick( float deltaTime )
{
	if ( int(Role)==int(ENetRole.ROLE_Authority) )
	{
		if ( bIsMoving && Location==lastLoc )
		{
			rpcLocation = Location;
		}
		bIsMoving = Location!=lastLoc;
		lastLoc = Location;
	}
	else
	{
		if ( Location==lastLoc && Location!=rpcLocation )
		{
			SetLocation( rpcLocation );
		}
		lastLoc = Location;
	}
	Super(DeusExDecoration).Tick( deltaTime );
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 bAlwaysRelevant=True
 NetPriority=2.700000
}
