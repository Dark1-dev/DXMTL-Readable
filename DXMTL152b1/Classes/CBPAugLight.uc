//=============================================================================
// CBPAugLight. Rebuild with ScriptRays.
//=============================================================================
class CBPAugLight extends AugLight;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var FunnyName43 b1;
var FunnyName43 b2;

//-----------------------------------------------------------------------------
// Network replication.
//-----------------------------------------------------------------------------

replication
{
	reliable if ( bNetOwner && int(Role)==int(ENetRole.ROLE_Authority) )
		b1, b2;
}

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

final function FunnyName26()
{
	if ( b1!=None )
	{
		b1.Destroy();
	}
	if ( b2!=None )
	{
		b2.Destroy();
	}
	b1 = None;
	b2 = None;
}

function PreTravel()
{
	FunnyName26();
}

function Deactivate()
{
	Super(Augmentation).Deactivate();
	FunnyName26();
}

simulated final function FunnyName25()
{
	local vector HitNormal, HitLocation, FunnyName276, FunnyName279;

	if ( b1!=None && Player!=None )
	{
		FunnyName276 = Player.Location;
		FunnyName276.Z += Player.BaseEyeHeight;
		FunnyName279 = FunnyName276+LevelValues[CurrentLevel]*Vector(Player.ViewRotation);
		Trace( HitLocation, HitNormal, FunnyName279, FunnyName276, true );
		if ( HitLocation==vect(0.0,0.0,0.0) )
		{
			HitLocation = FunnyName279;
		}
		b1.SetLocation( HitLocation-Vector(Player.ViewRotation)*float(64) );
		b1.LightRadius = byte(FClamp(VSize(HitLocation-FunnyName276)/LevelValues[CurrentLevel],0.0,1.0)*5.12+4.0);
		b1.LightType = LT_Steady;
	}
}

simulated final function FunnyName24()
{
	if ( b2!=None && Player!=None )
	{
		b2.SetLocation( Player.Location+vect(0.0,0.0,1.0)*Player.BaseEyeHeight+vect(1.0,1.0,0.0)*Vector(Player.Rotation)*Player.CollisionRadius*1.5 );
	}
}

//-----------------------------------------------------------------------------
// state Active.
//-----------------------------------------------------------------------------

simulated state Active
{
	simulated function Tick( float deltaTime )
	{
		if ( !bIsActive && int(Role)<int(ENetRole.ROLE_Authority) )
		{
			GotoState( 'Inactive' );
		}
		else
		{
			FunnyName25();
			FunnyName24();
		}
	}

	function BeginState()
	{
		Super(Object).BeginState();
		b1 = Spawn( Class'FunnyName43', Player, '', Player.Location );
		if ( b1!=None )
		{
			AIStartEvent( 'Beam', EAITYPE_Visual );
			FunnyName25();
		}
		b2 = Spawn( Class'FunnyName43', Player, '', Player.Location );
		if ( b2!=None )
		{
			b2.LightBrightness = 220;
			FunnyName24();
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 RemoteRole=ROLE_SimulatedProxy
}
