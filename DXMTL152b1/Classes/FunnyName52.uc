//=============================================================================
// FunnyName52. Rebuild with ScriptRays.
//=============================================================================
class FunnyName52 extends Actor;

//-----------------------------------------------------------------------------
// Constants.
//-----------------------------------------------------------------------------

const FunnyName429 = 10.0;
const FunnyName430 = 0.1;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var DeusExPlayer FunnyName423;
var int FunnyName424;
var int FunnyName425;
var int FunnyName426;
var bool FunnyName427;
var bool FunnyName428;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event Destroyed()
{
	if ( FunnyName423!=None )
	{
		FunnyName423.bNintendoImmunity = false;
		FunnyName423.NintendoImmunityTimeLeft = 0.0;
		FunnyName423 = None;
	}
	Super.Destroyed();
}

final function FunnyName92( float FunnyName431, float FunnyName432 )
{
	FunnyName423 = DeusExPlayer(Owner);
	if ( FunnyName423!=None )
	{
		FunnyName428 = FunnyName423.bAdmin || FunnyName431<0.0;
		FunnyName426 = Max( int(FunnyName431*10.0), 0 );
		FunnyName424 = int(FunnyName432*10.0);
		FunnyName425 = FunnyName424;
		FunnyName423.bNintendoImmunity = false;
		FunnyName423.NintendoImmunityTimeLeft = float(FunnyName424+FunnyName426)*0.1;
		if ( FunnyName426==0 && !FunnyName428 )
		{
			FunnyName427 = true;
		}
		SetTimer( 0.1, true );
	}
	else
	{
		Destroy();
	}
}

function Timer()
{
	local int FunnyName433;

	if ( Level.Game.bGameEnded || FunnyName423==None || FunnyName423.IsInState('Dying') || FunnyName423.Health<=0 || FunnyName423.bSpyDroneActive )
	{
		Destroy();
		return;
	}
	if ( !FunnyName427 )
	{
		if ( Location.X!=FunnyName423.Location.X || Location.Y!=FunnyName423.Location.Y || !FunnyName428 && --FunnyName426<=0 )
		{
			FunnyName427 = true;
			FunnyName423.NintendoImmunityTimeLeft = float(FunnyName424)*0.1;
			return;
		}
		if ( FunnyName428 )
		{
			FunnyName423.NintendoImmunityTimeLeft = 60.0;
		}
		else
		{
			FunnyName423.NintendoImmunityTimeLeft -= 0.1;
		}
	}
	else
	{
		FunnyName433 = 1;
		if ( FunnyName423.AugmentationSystem!=None && FunnyName423.AugmentationSystem.NumAugsActive()>0 )
		{
			FunnyName433 += FunnyName433;
		}
		if ( FunnyName423.inHand!=None )
		{
			FunnyName433 *= float(3);
		}
		if ( FunnyName423.Weapon!=None )
		{
			FunnyName433 += FunnyName433;
		}
		FunnyName423.NintendoImmunityTimeLeft -= 0.1*float(FunnyName433);
		FunnyName424 -= FunnyName433;
		if ( FunnyName424<=0 )
		{
			Destroy();
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 bHidden=True
 RemoteRole=ROLE_None
}
