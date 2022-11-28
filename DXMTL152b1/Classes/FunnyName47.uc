//=============================================================================
// FunnyName47. Rebuild with ScriptRays.
//=============================================================================
class FunnyName47 extends Actor;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var FunnyName47 FunnyName213;
var FunnyName47 FunnyName212;
var AugmentationManager FunnyName466;
var SkillManager FunnyName467;
var string FunnyName154;
var string FunnyName468;
var float FunnyName469;
var float FunnyName470;
var float FunnyName471;
var float FunnyName472;
var int FunnyName155;
var int FunnyName473;
var int FunnyName474;
var int FunnyName475;
var int FunnyName476;
var int FunnyName477;
var int FunnyName478;
var int FunnyName479;
var int FunnyName480;
var int FunnyName481;
var int FunnyName482;
var bool FunnyName483;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

final function FunnyName64( MTLPlayer Player )
{
	local Inventory FunnyName199;
	local DeusExWeapon FunnyName484;

	if ( Player==None || Player.PlayerReplicationInfo==None )
	{
		Destroy();
		return;
	}
	FunnyName468 = Player.FunnyName113;
	if ( FunnyName468=="" || FunnyName468=="0.0.0.0" )
	{
		Destroy();
		return;
	}
	FunnyName483 = Player.FunnyName126;
	FunnyName469 = Player.PlayerReplicationInfo.Score;
	FunnyName470 = Player.PlayerReplicationInfo.Deaths;
	FunnyName471 = Player.PlayerReplicationInfo.Streak;
	FunnyName154 = Player.PlayerReplicationInfo.PlayerName;
	FunnyName155 = Player.PlayerReplicationInfo.PlayerID;
	FunnyName473 = int(Player.PlayerReplicationInfo.Team);
	if ( Player.IsInState('Dying') )
	{
		FunnyName474 = 0;
	}
	else
	{
		FunnyName474 = Player.Health;
	}
	FunnyName475 = Player.HealthHead;
	FunnyName476 = Player.HealthTorso;
	FunnyName477 = Player.HealthLegLeft;
	FunnyName478 = Player.HealthLegRight;
	FunnyName479 = Player.HealthArmLeft;
	FunnyName480 = Player.HealthArmRight;
	FunnyName472 = Player.Energy;
	if ( FunnyName474<=0 || FunnyName475<=0 || FunnyName476<=0 || FunnyName483 )
	{
		return;
	}
	FunnyName481 = Player.SkillPointsTotal;
	FunnyName482 = Player.SkillPointsAvail;
	while ( Player.Inventory!=None )
	{
		FunnyName199 = Player.Inventory;
		FunnyName484 = DeusExWeapon(FunnyName199);
		if ( FunnyName484!=None && FunnyName484.AmmoName!=FunnyName484.AmmoNames[0] )
		{
			FunnyName484.LoadAmmo( 0 );
		}
		Player.DeleteInventory( FunnyName199 );
		if ( !FunnyName199.IsA('ChargedPickup') || !ChargedPickup(FunnyName199).IsActive() )
		{
			FunnyName14( FunnyName199 );
		}
		else
		{
			FunnyName199.Destroy();
		}
	}
	FunnyName466 = Player.AugmentationSystem;
	if ( FunnyName466!=None )
	{
		FunnyName466.DeactivateAll();
		FunnyName466.SetPlayer( None );
		FunnyName466.SetOwner( Self );
	}
	Player.AugmentationSystem = None;
	FunnyName467 = Player.SkillSystem;
	if ( FunnyName467!=None )
	{
		FunnyName467.SetPlayer( None );
		FunnyName467.SetOwner( Self );
	}
	Player.SkillSystem = None;
}

final function bool FunnyName15( MTLPlayer Player )
{
	local Inventory FunnyName199;

	if ( Player==None || Player.PlayerReplicationInfo==None )
	{
		return false;
	}
	if ( Player.FunnyName113!=FunnyName468 || !(Player.PlayerReplicationInfo.PlayerName~=FunnyName154) )
	{
		if ( FunnyName212!=None )
		{
			if ( FunnyName212.FunnyName15(Player) )
			{
				return true;
			}
		}
		if ( Player.FunnyName113!=FunnyName468 )
		{
			return false;
		}
	}
	if ( !(Player.PlayerReplicationInfo.PlayerName~=FunnyName154) )
	{
		Player.FunnyName86( FunnyName154, FunnyName155 );
	}
	Player.Level.Game.ChangeTeam( Player, FunnyName473 );
	Player.PlayerReplicationInfo.Deaths = FunnyName470;
	if ( FunnyName483 )
	{
		Destroy();
		return true;
	}
	Player.PlayerReplicationInfo.Score = FunnyName469;
	Player.PlayerReplicationInfo.Streak = FunnyName471;
	if ( FunnyName474<=0 || FunnyName475<=0 || FunnyName476<=0 )
	{
		Destroy();
		return true;
	}
	Player.FunnyName127 = true;
	Player.Health = FunnyName474;
	Player.HealthHead = FunnyName475;
	Player.HealthTorso = FunnyName476;
	Player.HealthLegLeft = FunnyName477;
	Player.HealthLegRight = FunnyName478;
	Player.HealthArmLeft = FunnyName479;
	Player.HealthArmRight = FunnyName480;
	Player.Energy = FunnyName472;
	Player.SkillPointsTotal = FunnyName481;
	Player.SkillPointsAvail = FunnyName482;
	while ( Player.Inventory!=None )
	{
		FunnyName199 = Player.Inventory;
		Player.DeleteInventory( FunnyName199 );
		FunnyName199.Destroy();
	}
	if ( Player.AugmentationSystem!=None && FunnyName466!=None )
	{
		Player.AugmentationSystem.Destroy();
	}
	if ( Player.SkillSystem!=None && FunnyName467!=None )
	{
		Player.SkillSystem.Destroy();
	}
	while ( Inventory!=None )
	{
		FunnyName199 = Inventory;
		FunnyName16( FunnyName199 );
		Player.AddInventory( FunnyName199 );
	}
	if ( FunnyName466!=None )
	{
		FunnyName466.SetPlayer( Player );
		FunnyName466.SetOwner( Player );
		Player.AugmentationSystem = FunnyName466;
		FunnyName466 = None;
	}
	if ( FunnyName467!=None )
	{
		FunnyName467.SetPlayer( Player );
		FunnyName467.SetOwner( Player );
		Player.SkillSystem = FunnyName467;
		FunnyName467 = None;
	}
	Destroy();
	return true;
}

function Destroyed()
{
	local Inventory FunnyName199;

	if ( FunnyName213!=None )
	{
		FunnyName213.FunnyName212 = FunnyName212;
	}
	if ( FunnyName212!=None )
	{
		FunnyName212.FunnyName213 = FunnyName213;
	}
	while ( Inventory!=None )
	{
		FunnyName199 = Inventory;
		FunnyName16( FunnyName199 );
		FunnyName199.Destroy();
	}
	if ( FunnyName466!=None )
	{
		FunnyName466.Destroy();
	}
	if ( FunnyName467!=None )
	{
		FunnyName467.Destroy();
	}
	Super.Destroyed();
}

final function bool FunnyName14( Inventory FunnyName199 )
{
	local Inventory CurInventory;

	if ( FunnyName199==None )
	{
		return false;
	}
	for ( CurInventory=Inventory; CurInventory!=None; CurInventory=CurInventory.Inventory )
	{
		if ( CurInventory==FunnyName199 )
		{
			return false;
		}
	}
	FunnyName199.SetOwner( Self );
	FunnyName199.Inventory = Inventory;
	FunnyName199.InitialState = 'Idle2';
	FunnyName199.GotoState( 'Idle2' );
	Inventory = FunnyName199;
	return true;
}

final function FunnyName16( Inventory FunnyName199 )
{
	local Actor FunnyName485;

	if ( FunnyName199==None )
	{
		return;
	}
	for ( FunnyName485=Self; FunnyName485!=None; FunnyName485=FunnyName485.Inventory )
	{
		if ( FunnyName485.Inventory==FunnyName199 )
		{
			FunnyName485.Inventory = FunnyName199.Inventory;
			break;
		}
	}
	FunnyName199.SetOwner( None );
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 bHidden=True
 RemoteRole=ROLE_None
 LifeSpan=360.000000
}
