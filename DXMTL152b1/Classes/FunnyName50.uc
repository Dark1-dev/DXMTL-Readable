//=============================================================================
// FunnyName50. Rebuild with ScriptRays.
//=============================================================================
class FunnyName50 extends Actor;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var MTLPlayer FunnyName420;
var MTLPlayer FunnyName421;
var private float FunnyName69;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function Tick( float DeltaTime )
{
	FunnyName420 = MTLPlayer(GetPlayerPawn());
	if ( FunnyName421==None || FunnyName420==None || FunnyName421==FunnyName420 )
	{
		Destroy();
	}
	else
	{
		FunnyName18();
		FunnyName17( DeltaTime );
	}
}

final function FunnyName18()
{
	if ( FunnyName421.NintendoImmunityTimeLeft>0.0 )
	{
		FunnyName421.DrawInvulnShield();
		if ( FunnyName421.invulnSph!=None )
		{
			FunnyName421.invulnSph.LifeSpan = FunnyName421.NintendoImmunityTimeLeft;
		}
	}
	else if ( FunnyName421.invulnSph!=None )
	{
		FunnyName421.invulnSph.Destroy();
		FunnyName421.invulnSph = None;
	}
}

final function FunnyName17( float DeltaTime )
{
	local DeusExRootWindow FunnyName172;
	local vector FunnyName201;
	local float FunnyName422;

	FunnyName69 = Abs( FunnyName69 )+DeltaTime;
	FunnyName421.bHidden = false;
	if ( int(FunnyName421.FunnyName122)==0 )
	{
		FunnyName69 = 0.0;
		FunnyName421.CreateShadow();
		FunnyName421.ScaleGlow = FunnyName421.default.ScaleGlow;
		return;
	}
	else
	{
		FunnyName421.KillShadow();
		if ( int(FunnyName421.FunnyName122)>=2 )
		{
			FunnyName421.bHidden = true;
			return;
		}
	}
	if ( TeamDMGame(FunnyName420.DXGame)!=None && TeamDMGame(FunnyName420.DXGame).ArePlayersAllied(FunnyName421,FunnyName420) )
	{
		FunnyName421.ScaleGlow = 0.25;
	}
	else
	{
		FunnyName421.ScaleGlow = FunnyName421.default.ScaleGlow*(0.01/FunnyName69);
		if ( FunnyName421.ScaleGlow<=0.02 )
		{
			FunnyName421.ScaleGlow = 0.0;
			FunnyName421.bHidden = true;
			FunnyName172 = DeusExRootWindow(FunnyName420.RootWindow);
			if ( FunnyName172!=None && FunnyName172.HUD!=None && FunnyName172.HUD.augDisplay!=None && FunnyName172.HUD.augDisplay.bVisionActive )
			{
				FunnyName201 = FunnyName420.Location;
				FunnyName201.Z += FunnyName420.BaseEyeHeight;
				FunnyName422 = VSize( FunnyName421.Location-FunnyName201 );
				if ( FunnyName422<=FunnyName172.HUD.augDisplay.visionLevelValue )
				{
					FunnyName421.bHidden = false;
				}
			}
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 FunnyName69=10.000000
 bHidden=True
 RemoteRole=ROLE_None
}
