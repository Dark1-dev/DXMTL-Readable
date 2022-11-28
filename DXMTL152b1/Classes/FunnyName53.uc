//=============================================================================
// FunnyName53. Rebuild with ScriptRays.
//=============================================================================
class FunnyName53 extends Object
	abstract;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

static final function string FunnyName90( PlayerPawn Player )
{
	local string SkinName;
	local int keyIndex;

	if ( Player!=None )
	{
		SkinName = Player.GetPlayerNetworkAddress();
		keyIndex = InStr( SkinName, ":" );
		if ( keyIndex!=-1 )
		{
			SkinName = Left( SkinName, keyIndex );
		}
	}
	return SkinName;
}

static final function bool FunnyName57( MTLPlayer Player, Class<MTLPlayer> FunnyName358 )
{
	local int FunnyName529;

	if ( Player==None || FunnyName358==None || FunnyName358.default.Mesh==None )
	{
		return false;
	}
	for ( FunnyName529=0; FunnyName529<8; FunnyName529++ )
	{
		Player.MultiSkins[FunnyName529] = FunnyName358.default.MultiSkins[FunnyName529];
	}
	Player.FunnyName108[0] = Player.MultiSkins[5];
	Player.FunnyName108[1] = Player.MultiSkins[6];
	Player.FunnyName108[2] = Player.MultiSkins[7];
	Player.FunnyName125 = true;
	Player.FunnyName105 = FunnyName358.default.FunnyName105;
	Player.CarcassType = FunnyName358.default.CarcassType;
	Player.Mesh = FunnyName358.default.Mesh;
	Player.Texture = FunnyName358.default.Texture;
	Player.JumpSound = FunnyName358.default.JumpSound;
	Player.HitSound1 = FunnyName358.default.HitSound1;
	Player.HitSound2 = FunnyName358.default.HitSound2;
	Player.Land = FunnyName358.default.Land;
	Player.Die = FunnyName358.default.Die;
	Player.DrawScale = FunnyName358.default.DrawScale;
	Player.bIsFemale = FunnyName358.default.bIsFemale;
	Player.PlayerSkin = FunnyName358.default.PlayerSkin;
	return true;
}

static final function FunnyName56( GameInfo FunnyName530, string Options, out string Error )
{
	local FunnyName49 FunnyName531;
	local Mutator FunnyName532;
	local Class<Mutator> FunnyName533;
	local string FunnyName534, FunnyName535;
	local int keyIndex;

	Log( "InitGame:"@Left(Options,800), 'DXMTL' );
	FunnyName530.Level.Game = FunnyName530;
	FunnyName530.MaxPlayers = Clamp( FunnyName530.GetIntOption(Options,string('MaxPlayers'),FunnyName530.MaxPlayers), 1, 32 );
	FunnyName534 = FunnyName530.ParseOption( Options, string('Difficulty') );
	if ( FunnyName534!="" )
	{
		FunnyName530.Difficulty = byte(int(FunnyName534));
	}
	FunnyName534 = FunnyName530.ParseOption( Options, string('GameSpeed') );
	if ( FunnyName534!="" )
	{
		Log( string('GameSpeed')@FunnyName534, 'DXMTL' );
		FunnyName530.SetGameSpeed( float(FunnyName534) );
	}
	FunnyName530.BaseMutator = FunnyName530.Spawn( Class'CBPMutator' );
	assert(FunnyName530.BaseMutator!=None);
	Log( "Base Mutator:"@string(FunnyName530.BaseMutator), 'DXMTL' );
	if ( FunnyName530.IsA('DeusExMPGame') )
	{
		FunnyName532 = FunnyName530.Spawn( Class'AntiCheat1' );
		assert(AntiCheat1(FunnyName532)!=None);
		FunnyName530.BaseMutator.AddMutator( FunnyName532 );
		CBPMutator(FunnyName530.BaseMutator).AddCBPMutator( CBPMutator(FunnyName532) );
	}
	FunnyName534 = FunnyName530.ParseOption( Options, string('Mutator') );
	if ( FunnyName534!="" )
	{
		Log( string('Mutators')@Left(FunnyName534,800), 'DXMTL' );
		while ( FunnyName534!="" )
		{
			keyIndex = InStr( FunnyName534, "," );
			if ( keyIndex>0 )
			{
				FunnyName535 = Left( FunnyName534, keyIndex );
				FunnyName534 = mid( FunnyName534, keyIndex+1 );
			}
			else
			{
				FunnyName535 = FunnyName534;
				FunnyName534 = "";
			}
			FunnyName533 = Class<Mutator>(FunnyName530.DynamicLoadObject(FunnyName535,Class'Class',true));
			if ( FunnyName533!=None && FunnyName533!=Class'Mutator' && FunnyName533!=Class'CBPMutator' )
			{
				Log( "Add mutator"@string(FunnyName533), 'DXMTL' );
				FunnyName532 = FunnyName530.Spawn( FunnyName533 );
				FunnyName530.BaseMutator.AddMutator( FunnyName532 );
				CBPMutator(FunnyName530.BaseMutator).AddCBPMutator( CBPMutator(FunnyName532) );
			}
		}
	}
	FunnyName534 = FunnyName530.ParseOption( Options, string('AdminPassword') );
	if ( FunnyName534!="" )
	{
		FunnyName530.ConsoleCommand( string('Set')@string('GameInfo')@string('AdminPassword')@FunnyName534 );
	}
	FunnyName534 = FunnyName530.ParseOption( Options, string('GamePassword') );
	if ( FunnyName534!="" )
	{
		FunnyName530.ConsoleCommand( string('Set')@string('GameInfo')@string('GamePassword')@FunnyName534 );
		Log( string('GamePassword')@FunnyName534, 'DXMTL' );
	}
	Class'SpawnNotify'.default.RemoteRole = ROLE_None;
	FunnyName531 = FunnyName530.Spawn( Class'FunnyName49' );
	assert(FunnyName531!=None);
}

static final function FunnyName12( DeusExWeapon weapon )
{
	if ( int(weapon.ReloadCount)==0 )
	{
		if ( Pawn(weapon.Owner)!=None )
		{
			Pawn(weapon.Owner).ClientMessage( weapon.msgCannotBeReloaded );
		}
	}
	else if ( !weapon.IsInState('Reload') )
	{
		weapon.ClipCount = int(weapon.ReloadCount);
		weapon.TweenAnim( 'Still', 0.1 );
		weapon.GotoState( 'Reload' );
	}
}

static simulated final function FunnyName11( DeusExWeapon weapon, out float FunnyName390, out float FunnyName391, float FunnyName536 )
{
	if ( weapon.MustReload() && weapon.CanReload() )
	{
		FunnyName391 = FClamp( FunnyName390*0.425/FMax(FunnyName536+weapon.GetWeaponSkill()*FunnyName536,0.1), 0.0, 1.0 );
		FunnyName390 = 0.0;
		if ( FunnyName391==1.0 )
		{
			weapon.ClipCount = 0;
			weapon.ServerDoneReloading();
			FunnyName391 = 0.0;
		}
	}
	else
	{
		FunnyName391 = 0.0;
	}
	FunnyName390 = 0.0;
}

static final function FunnyName13( DeusExWeapon weapon )
{
	weapon.ScopeOff();
	weapon.LaserOff();
	if ( int(weapon.Level.NetMode)==int(ENetMode.NM_DedicatedServer) || int(weapon.Level.NetMode)==int(ENetMode.NM_ListenServer) && DeusExPlayer(weapon.Owner)!=None && !DeusExPlayer(weapon.Owner).PlayerIsListenClient() )
	{
		weapon.ClientDownWeapon();
	}
	weapon.TweenDown();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
