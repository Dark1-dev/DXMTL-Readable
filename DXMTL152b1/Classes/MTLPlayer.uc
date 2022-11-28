//=============================================================================
// MTLPlayer. Rebuild with ScriptRays.
//=============================================================================
class MTLPlayer extends Human
	abstract;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var Texture FunnyName108[3];
var Decoration FunnyName109;
var FunnyName52 FunnyName110;
var FunnyName46 FunnyName111;
var MTLManager FunnyName112;
var Class<MTLManager> FunnyName45;
var string FunnyName113;
var localized string l_matrixon;
var localized string l_matrixoff;
var localized string l_stopspam;
var localized string l_spam1;
var localized string l_spam3;
var localized string l_blocked;
var localized string l_unfly;
var localized string l_unghost;
var localized string l_badaug;
var localized string l_nametaken;
var localized string l_prevname;
var localized string l_augssaved;
var float FunnyName114;
var float FunnyName115;
var float FunnyName116;
var float FunnyName117;
var float FunnyName118;
var float FunnyName119;
var int iMsgCount[5];
var int iByteCount[5];
var int iMsgIndex;
var int iSpamCount;
var int FunnyName120;
var private int FunnyName121;
var byte FunnyName122;
var byte FunnyName105;
var byte FunnyName123;
var bool FunnyName124;
var bool FunnyName125;
var bool FunnyName126;
var bool FunnyName127;
var bool FunnyName128;
var bool FunnyName129;
var bool FunnyName130;
var private vector FunnyName131;
var private float FunnyName132;
var private float FunnyName133;
var private bool FunnyName134;
var private bool FunnyName135;
var private bool FunnyName136;
var private bool FunnyName137;
var private bool FunnyName138;

//-----------------------------------------------------------------------------
// Network replication.
//-----------------------------------------------------------------------------

replication
{
	reliable if ( int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName122;

	reliable if ( bNetOwner && int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName119, FunnyName120, FunnyName129, FunnyName130;

	reliable if ( int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName89;

	reliable if ( int(Role)<int(ENetRole.ROLE_Authority) )
		ViewID, GetPlayerIP, SpawnMass2, FunnyName33, FunnyName34, FunnyName35,
		FunnyName36, FunnyName40, ToggleBehindView;

	unreliable if ( int(Role)<int(ENetRole.ROLE_Authority) )
		FunnyName106;

	unreliable if ( int(RemoteRole)==int(ENetRole.ROLE_AutonomousProxy) )
		FunnyName78, FunnyName103;
}

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

final function FunnyName88()
{
	FunnyName89( JumpZ, default.JumpZ, mpGroundSpeed, default.mpGroundSpeed, mpWaterSpeed, default.mpWaterSpeed );
}

simulated final function FunnyName89( float FunnyName139, float FunnyName140, float FunnyName141, float FunnyName142, float FunnyName143, float FunnyName144 )
{
	JumpZ = FunnyName139;
	default.JumpZ = FunnyName140;
	mpGroundSpeed = FunnyName141;
	default.mpGroundSpeed = FunnyName142;
	mpWaterSpeed = FunnyName143;
	default.mpWaterSpeed = FunnyName144;
}

function PostBeginPlay()
{
	local bool FunnyName145;

	if ( PlayerIsOnServer() )
	{
		assert(Level.Game.BaseMutator!=None);
		assert(Level.Game.BaseMutator.Class==Class'CBPMutator');
		assert(Level.Game.BaseMutator.NextMutator!=None);
		assert(Level.Game.BaseMutator.NextMutator.Class==Class'AntiCheat1');
		assert(Level.SpawnNotify!=None);
		assert(Level.SpawnNotify.Next==None);
		assert(Level.SpawnNotify.Class==Class'FunnyName49');
		SetCollisionSize( CollisionRadius*0.999123, CollisionHeight*0.999456 );
	}
	Super.PostBeginPlay();
}

static function SetMultiSkin( Actor A, string SkinName, string FaceName, byte TeamNum )
{
}

function ClientReplicateSkins( Texture Skin1, optional Texture Skin2, optional Texture Skin3, optional Texture Skin4 )
{
}

final function FunnyName86( string FunnyName154, int FunnyName155 )
{
	BroadcastMessage( FunnyName81()@l_prevname@FunnyName154$"("$string(FunnyName155)$")" );
}

exec function Kick( string S )
{
	local Pawn Player;

	if ( !bAdmin )
	{
		return;
	}
	for ( Player=Level.PawnList; Player!=None; Player=Player.nextPawn )
	{
		if ( Player.PlayerReplicationInfo!=None && string(Player.PlayerReplicationInfo.PlayerID)~=S )
		{
			if ( MTLPlayer(Player)!=None && NetConnection(MTLPlayer(Player).Player)!=None )
			{
				MTLPlayer(Player).FunnyName126 = true;
				Player.Destroy();
				return;
			}
		}
	}
}

exec function Type()
{
	Player.Console.TypedStr = "";
	Player.Console.GotoState( 'Typing' );
}

exec function BehindView( bool B )
{
	bBehindView = B;
}

exec function ToggleBehindView()
{
	bBehindView = !bBehindView;
}

exec function ShowMOTD()
{
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		Spawn( Class'MTLMOTD', Self );
	}
}

simulated event Destroyed()
{
	local ColorTheme FunnyName157;

	if ( PlayerIsOnServer() )
	{
		if ( FunnyName112!=None && !Level.Game.bGameEnded )
		{
			FunnyName112.FunnyName22( Self );
		}
		if ( AugmentationSystem!=None )
		{
			AugmentationSystem.Destroy();
		}
		if ( SkillSystem!=None )
		{
			SkillSystem.Destroy();
		}
		if ( aDrone!=None )
		{
			aDrone.Destroy();
		}
		if ( invulnSph!=None )
		{
			invulnSph.Destroy();
		}
		if ( killProfile!=None )
		{
			killProfile.Destroy();
		}
		if ( ThemeManager!=None )
		{
			for ( FunnyName157=ThemeManager.FirstColorTheme; FunnyName157!=None; FunnyName157=FunnyName157.Next )
			{
				FunnyName157.Destroy();
			}
			ThemeManager.Destroy();
		}
	}
	Super.Destroyed();
}

final function int FunnyName42( int FunnyName158, out string SkinName, string FunnyName159, string FunnyName160, optional byte FunnyName161, optional byte FunnyName162 )
{
	local int FunnyName163, FunnyName164, FunnyName165, FunnyName166, A;

	if ( SkinName=="" )
	{
		return FunnyName158;
	}
	FunnyName164 = Len( FunnyName159 );
	for ( FunnyName163=InStr(SkinName,FunnyName159); FunnyName163!=-1; FunnyName163=InStr(SkinName,FunnyName159) )
	{
		FunnyName166 = 0;
		if ( int(FunnyName161)!=0 )
		{
			FunnyName165 = Len( SkinName );
			if ( int(FunnyName162)>0 )
			{
				FunnyName165 = Min( FunnyName165, FunnyName163+FunnyName164+int(FunnyName162) );
			}
			for ( FunnyName166=FunnyName163+FunnyName164; FunnyName166<FunnyName165; FunnyName166++ )
			{
				A = Asc( Caps(mid(SkinName,FunnyName166,1)) );
				if ( A<48 || A>57 )
				{
					if ( int(FunnyName161)==1 || A<65 || A>70 )
					{
						break;
					}
				}
			}
			FunnyName166 -= FunnyName163+FunnyName164;
		}
		SkinName = Left( SkinName, FunnyName163 ) $ FunnyName160 $ mid( SkinName, FunnyName163+FunnyName164+FunnyName166 );
		FunnyName158 -= FunnyName164+FunnyName166;
		if ( FunnyName158<=0 )
		{
			SkinName = Left( SkinName, FunnyName163+Len(FunnyName160) );
			break;
		}
	}
	return FunnyName158;
}

final function FunnyName85( out string SkinName, bool FunnyName167 )
{
	local int FunnyName168;

	SkinName = Left( SkinName, 500 );
	if ( !FunnyName167 )
	{
		FunnyName42( 12, SkinName, Chr(32), "_" );
		FunnyName42( 12, SkinName, Chr(160), "_" );
	}
	FunnyName168 = FunnyName42( 18, SkinName, "|p", "", 1, 1 );
	FunnyName42( FunnyName168+4, SkinName, "|P", "", 1, 1 );
	FunnyName168 = FunnyName42( 32, SkinName, "|c", "", 2, 6 );
	FunnyName42( FunnyName168+6, SkinName, "|C", "", 2, 6 );
	FunnyName42( 12, SkinName, "|", "!" );
}

final function FunnyName83( out string SkinName )
{
	SkinName = Left( SkinName, 20 );
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		return;
	}
	FunnyName85( SkinName, false );
	if ( SkinName=="" )
	{
		SkinName = "Player";
	}
	if ( SkinName~="Player" || SkinName~="PIayer" || SkinName~="P1ayer" )
	{
		SkinName = SkinName $ "_" $ string(Rand(999));
	}
	else if ( FunnyName82(SkinName) )
	{
		SkinName = Left( SkinName, 17 ) $ "_" $ string(Rand(99));
	}
}

final function bool FunnyName82( string SkinName )
{
	local Pawn Player;

	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		for ( Player=Level.PawnList; Player!=None; Player=Player.nextPawn )
		{
			if ( Player.bIsPlayer && Player!=Self && Player.PlayerReplicationInfo.PlayerName~=SkinName )
			{
				return true;
			}
		}
	}
	return false;
}

final function FunnyName40( coerce string SkinName )
{
	if ( Level.TimeSeconds-FunnyName116>2.3 )
	{
		FunnyName116 = Level.TimeSeconds;
	}
	else
	{
		return;
	}
	SkinName = Left( SkinName, 20 );
	if ( FunnyName82(SkinName) )
	{
		ClientMessage( l_nametaken );
	}
	else
	{
		ChangeName( SkinName );
	}
}

function ChangeName( coerce string S )
{
	FunnyName83( S );
	Level.Game.ChangeName( Self, S, false );
}

exec function Name( coerce string S )
{
	SetName( S );
}

exec function SetName( coerce string S )
{
	if ( Level.TimeSeconds-FunnyName116<=2.5 )
	{
		return;
	}
	S = Left( S, 20 );
	FunnyName40( S );
	if ( GetDefaultURL("Name")!=S )
	{
		UpdateURL( "Name", S, true );
		SaveConfig();
	}
	FunnyName116 = Level.TimeSeconds;
}

exec function Admin( string CommandLine )
{
	local string FunnyName170;

	if ( !bAdmin || CommandLine=="" )
	{
		return;
	}
	if ( CommandLine~="admin" || Left(CommandLine,6)~="admin " )
	{
		ClientMessage( l_blocked );
		return;
	}
	if ( !FunnyName45.default.bAllowAdminGet )
	{
		if ( CommandLine~="get" || Left(CommandLine,4)~="get " )
		{
			ClientMessage( l_blocked );
			return;
		}
	}
	if ( !FunnyName45.default.bAllowAdminSet )
	{
		if ( CommandLine~="set" || Left(CommandLine,4)~="set " )
		{
			ClientMessage( l_blocked );
			return;
		}
	}
	Log( Left(FunnyName81()$":"@CommandLine,400), 'Admin' );
	FunnyName170 = ConsoleCommand( CommandLine );
	if ( FunnyName170!="" )
	{
		ClientMessage( FunnyName170 );
	}
}

simulated final function bool FunnyName41()
{
	return PlayerIsRemoteClient() || int(Level.NetMode)==int(ENetMode.NM_ListenServer) && (GetPlayerPawn()==None || GetPlayerPawn()==Self) || int(Level.NetMode)==int(ENetMode.NM_Standalone);
}

function CreateColorThemeManager()
{
	if ( FunnyName41() )
	{
		Super.CreateColorThemeManager();
	}
	else if ( ThemeManager==None )
	{
		ThemeManager = Spawn( Class'ColorThemeManager', Self );
		ThemeManager.SetCurrentHUDColorTheme( ThemeManager.AddTheme(Class'ColorThemeHUD_Default') );
		ThemeManager.SetCurrentMenuColorTheme( ThemeManager.AddTheme(Class'ColorThemeMenu_Default') );
	}
	if ( ThemeManager!=None )
	{
		ThemeManager.RemoteRole = ROLE_None;
	}
}

event Possess()
{
	local bool FunnyName171;
	local DeusExRootWindow FunnyName172;

	Super(PlayerPawn).Possess();
	NetPriority = default.NetPriority;
	FunnyName138 = true;
	InitRootWindow();
	FunnyName138 = false;
	if ( PlayerIsRemoteClient() )
	{
		ClientPossessed();
		FunnyName98( Class'Player'.default.ConfiguredInternetSpeed );
		SetDesiredFOV( DefaultFOV );
	}
	FunnyName172 = DeusExRootWindow(RootWindow);
	if ( FunnyName172!=None )
	{
		if ( FunnyName172.actorDisplay!=None )
		{
			FunnyName172.actorDisplay.Destroy();
		}
		if ( FunnyName172.HUD!=None )
		{
			FunnyName172.HUD.Destroy();
		}
		if ( !PlayerIsRemoteClient() )
		{
			FunnyName172.actorDisplay = ActorDisplayWindow(FunnyName172.NewChild(Class'CBPActorDisplayWindow'));
			FunnyName172.actorDisplay.SetWindowAlignments( HALIGN_Full, VALIGN_Full );
		}
		else
		{
			FunnyName172.actorDisplay = None;
		}
		FunnyName172.HUD = DeusExHUD(FunnyName172.NewChild(Class'CBPDeusExHUD'));
		FunnyName172.HUD.UpdateSettings( Self );
		FunnyName172.HUD.SetWindowAlignments( HALIGN_Full, VALIGN_Full, 0.0, 0.0 );
	}
	if ( !bool(Level.NetMode) )
	{
		FunnyName129 = true;
		FunnyName130 = true;
		FunnyName119 = 0.0;
	}
}

function PostPostBeginPlay()
{
	Super(Actor).PostPostBeginPlay();
	if ( ThemeManager!=None )
	{
		ThemeManager.SetMenuThemeByName( MenuThemeName );
		ThemeManager.SetHUDThemeByName( HUDThemeName );
	}
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		ConBindEvents();
	}
	else if ( killProfile==None )
	{
		killProfile = Spawn( Class'KillerProfile', Self );
	}
	if ( killProfile!=None )
	{
		killProfile.NetPriority = 2.0;
	}
}

function InitializeSubSystems()
{
	local Skill FunnyName173;

	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) && BarkManager==None )
	{
		BarkManager = Spawn( Class'BarkManager', Self );
	}
	CreateColorThemeManager();
	if ( ThemeManager!=None )
	{
		ThemeManager.SetOwner( Self );
	}
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		if ( AugmentationSystem!=None && !AugmentationSystem.IsA('CBPAugmentationManager') )
		{
			AugmentationSystem.ResetAugmentations();
			AugmentationSystem.Destroy();
			AugmentationSystem = None;
		}
		if ( SkillSystem!=None && !SkillSystem.IsA('CBPSkillManager') )
		{
			for ( FunnyName173=SkillSystem.FirstSkill; FunnyName173!=None; FunnyName173=FunnyName173.Next )
			{
				FunnyName173.Destroy();
			}
			SkillSystem.Destroy();
			SkillSystem = None;
		}
	}
	if ( AugmentationSystem==None )
	{
		AugmentationSystem = Spawn( Class'CBPAugmentationManager', Self );
		AugmentationSystem.CreateAugmentations( Self );
		AugmentationSystem.AddDefaultAugmentations();
	}
	else
	{
		AugmentationSystem.SetPlayer( Self );
		AugmentationSystem.SetOwner( Self );
	}
	if ( SkillSystem==None )
	{
		SkillSystem = Spawn( Class'CBPSkillManager', Self );
		SkillSystem.CreateSkills( Self );
	}
	else
	{
		SkillSystem.SetPlayer( Self );
		SkillSystem.SetOwner( Self );
	}
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) || !bBeltIsMPInventory )
	{
		CreateKeyRing();
	}
}

function ResetPlayerToDefaults()
{
	EnergyDrain = 0.0;
	EnergyDrainTotal = 0.0;
	Super.ResetPlayerToDefaults();
}

final function FunnyName84( string FunnyName174 )
{
	FunnyName104( FunnyName174, true );
}

final function string FunnyName81()
{
	return PlayerReplicationInfo.PlayerName $ "(" $ string(PlayerReplicationInfo.PlayerID) $ ")";
}

final function string FunnyName39()
{
	if ( FunnyName113=="" )
	{
		FunnyName113 = Class'FunnyName53'.static.FunnyName90( Self );
	}
	return FunnyName81() $ ":" @ FunnyName113;
}

function bool PlayerIsListenClient()
{
	return int(Level.NetMode)==int(ENetMode.NM_ListenServer) && GetPlayerPawn()==Self;
}

function bool PlayerIsRemoteClient()
{
	return int(Level.NetMode)==int(ENetMode.NM_Client) && int(Role)==int(ENetRole.ROLE_AutonomousProxy);
}

function bool PlayerIsClient()
{
	return PlayerIsRemoteClient() || PlayerIsListenClient();
}

function bool PlayerIsOnServer()
{
	return int(Level.NetMode)==int(ENetMode.NM_DedicatedServer) || int(Level.NetMode)==int(ENetMode.NM_ListenServer);
}

function NintendoImmunityEffect( bool FunnyName175 )
{
	bNintendoImmunity = false;
}

function MultiplayerTick( float DeltaTime )
{
	if ( int(Role)==int(ENetRole.ROLE_Authority) )
	{
		if ( AugmentationSystem==None || SkillSystem==None )
		{
			if ( FunnyName111!=None )
			{
				FunnyName111.FunnyName61( 'InvSS' );
			}
			return;
		}
	}
	if ( PlayerReplicationInfo!=None )
	{
		if ( bCheatsEnabled && !PlayerReplicationInfo.bAdmin && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			bCheatsEnabled = false;
		}
		else if ( PlayerReplicationInfo.bAdmin && !bCheatsEnabled )
		{
			bCheatsEnabled = true;
		}
	}
	Super.MultiplayerTick( DeltaTime );
	if ( invulnSph!=None )
	{
		if ( NintendoImmunityTimeLeft>0.0 )
		{
			invulnSph.LifeSpan = NintendoImmunityTimeLeft;
		}
		else
		{
			invulnSph.Destroy();
			invulnSph = None;
		}
	}
}

simulated function CreatePlayerTracker()
{
	local FunnyName50 FunnyName177;

	FunnyName177 = Spawn( Class'FunnyName50' );
	FunnyName177.FunnyName421 = Self;
}

function GiveInitialInventory()
{
	local bool FunnyName178;
	local Inventory anItem;

	if ( !Level.Game.IsA('DeusExMPGame') || DeusExMPGame(Level.Game).bStartWithPistol )
	{
		anItem = Spawn( Class'WeaponPistol' );
		if ( anItem!=None )
		{
			anItem.Frob( Self, None );
			Inventory.bInObjectBelt = true;
			anItem.Destroy();
		}
		anItem = Spawn( Class'Ammo10mm' );
		if ( anItem!=None )
		{
			DeusExAmmo(anItem).AmmoAmount = 50;
			anItem.Frob( Self, None );
			anItem.Destroy();
		}
	}
	anItem = Spawn( Class'MedKit' );
	if ( anItem!=None )
	{
		anItem.Frob( Self, None );
		Inventory.bInObjectBelt = true;
		anItem.Destroy();
	}
	anItem = Spawn( Class'Lockpick' );
	if ( anItem!=None )
	{
		anItem.Frob( Self, None );
		Inventory.bInObjectBelt = true;
		anItem.Destroy();
	}
	anItem = Spawn( Class'Multitool' );
	if ( anItem!=None )
	{
		anItem.Frob( Self, None );
		Inventory.bInObjectBelt = true;
		anItem.Destroy();
	}
}

simulated final function FunnyName80( string FunnyName179 )
{
	if ( !FunnyName41() || FunnyName138 )
	{
		return;
	}
	FunnyName138 = true;
	Super.ConsoleCommand( string('Set')@string('Input')@FunnyName179 );
	Super.ConsoleCommand( string('Set')@string('Input')$string('Ext')@FunnyName179 );
	FunnyName138 = false;
}

function DoJump( optional float FunnyName180 )
{
	local float FunnyName181, scaleFactor;
	local DeusExWeapon W;

	if ( carriedDecoration!=None && carriedDecoration.Mass>float(20) )
	{
		return;
	}
	else if ( bForceDuck || IsLeaning() )
	{
		return;
	}
	if ( int(Physics)==int(EPhysics.PHYS_Walking) )
	{
		if ( int(Role)==int(ENetRole.ROLE_Authority) )
		{
			PlaySound( JumpSound, SLOT_None, 1.5, true, 1200.0, 1.0-0.2*FRand() );
		}
		if ( Level.Game!=None && int(Level.Game.Difficulty)>0 )
		{
			MakeNoise( 0.1*float(Level.Game.Difficulty) );
		}
		PlayInAir();
		Velocity.Z = JumpZ;
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			if ( AugmentationSystem==None )
			{
				FunnyName181 = -1.0;
			}
			else
			{
				FunnyName181 = AugmentationSystem.GetAugLevelValue( Class'AugSpeed' );
			}
			W = DeusExWeapon(inHand);
			if ( FunnyName181!=-1.0 && W!=None && W.Mass>30.0 )
			{
				scaleFactor = 1.0-FClamp( (W.Mass-30.0)/55.0, 0.0, 0.5 );
				Velocity.Z *= scaleFactor;
			}
		}
		if ( Base!=None && Base!=Level )
		{
			Velocity.Z += Base.Velocity.Z;
		}
		SetPhysics( PHYS_Falling );
		if ( bCountJumps && int(Role)==int(ENetRole.ROLE_Authority) && Inventory!=None )
		{
			Inventory.OwnerJumped();
		}
	}
}

function bool HandleItemPickup( Actor FrobTarget, optional bool bSearchOnly )
{
	local bool FunnyName182, bCanPickup, FunnyName183;
	local Inventory foundItem;

	FunnyName183 = true;
	bCanPickup = true;
	FunnyName182 = false;
	if ( FunnyName124 )
	{
		if ( FrobTarget.IsA('DeusExWeapon') )
		{
			DeusExWeapon(FrobTarget).PickupAmmoCount = 1;
			DeusExWeapon(FrobTarget).mpPickupAmmoCount = 1;
		}
		else if ( FrobTarget.IsA('Ammo') )
		{
			Ammo(FrobTarget).AmmoAmount = 1;
		}
	}
	if ( FrobTarget.IsA('DataVaultImage') || FrobTarget.IsA('NanoKey') || FrobTarget.IsA('Credits') )
	{
		FunnyName183 = false;
	}
	else if ( FrobTarget.IsA('DeusExPickup') )
	{
		if ( FindInventoryType(FrobTarget.Class)!=None && DeusExPickup(FrobTarget).bCanHaveMultipleCopies )
		{
			FunnyName183 = false;
		}
	}
	else
	{
		foundItem = GetWeaponOrAmmo( Inventory(FrobTarget) );
		if ( foundItem!=None )
		{
			FunnyName183 = false;
			if ( foundItem.IsA('Ammo') )
			{
				if ( Ammo(foundItem).AmmoAmount>=Ammo(foundItem).MaxAmmo )
				{
					ClientMessage( TooMuchAmmo );
					bCanPickup = false;
				}
			}
			else if ( foundItem.IsA('WeaponEMPGrenade') || foundItem.IsA('WeaponGasGrenade') || foundItem.IsA('WeaponNanoVirusGrenade') || foundItem.IsA('WeaponLAM') )
			{
				if ( DeusExWeapon(foundItem).AmmoType.AmmoAmount>=DeusExWeapon(foundItem).AmmoType.MaxAmmo )
				{
					ClientMessage( TooMuchAmmo );
					bCanPickup = false;
				}
			}
			else if ( foundItem.IsA('Weapon') )
			{
				bCanPickup = !(int(Weapon(foundItem).ReloadCount)==0 && Weapon(foundItem).PickupAmmoCount==0 && Weapon(foundItem).AmmoName!=None);
				if ( !bCanPickup )
				{
					ClientMessage( Sprintf(CanCarryOnlyOne,foundItem.ItemName) );
				}
			}
		}
		else if ( FunnyName124 )
		{
			FunnyName182 = true;
		}
	}
	if ( FunnyName183 && bCanPickup )
	{
		if ( FindInventorySlot(Inventory(FrobTarget),bSearchOnly)==false )
		{
			ClientMessage( Sprintf(InventoryFull,Inventory(FrobTarget).ItemName) );
			bCanPickup = false;
			ServerConditionalNotifyMsg( 11 );
		}
	}
	if ( bCanPickup )
	{
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) && (FrobTarget.IsA('DeusExWeapon') || FrobTarget.IsA('DeusExAmmo')) )
		{
			PlaySound( Sound'DeusExSounds.Generic.WeaponPickup', SLOT_Interact, 0.5+FRand()*0.25, , 256.0, 0.95+FRand()*0.1 );
		}
		DoFrob( Self, inHand );
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			if ( FrobTarget.IsA('DeusExWeapon') && DeusExWeapon(FrobTarget).PickupAmmoCount==0 )
			{
				DeusExWeapon(FrobTarget).PickupAmmoCount = DeusExWeapon(FrobTarget).default.mpPickupAmmoCount*3;
			}
		}
		if ( FunnyName182 )
		{
			foundItem = GetWeaponOrAmmo( Inventory(FrobTarget) );
			if ( DeusExWeapon(foundItem)!=None )
			{
				DeusExWeapon(foundItem).AmmoType.AmmoAmount = 1;
			}
		}
	}
	FunnyName124 = false;
	return bCanPickup;
}

final function FunnyName79( string FunnyName184 )
{
	FunnyName121 = (int(Level.NetMode)*4891+73102)*8;
	if ( FRand()<0.5 )
	{
		FunnyName84( FunnyName184 );
	}
	else
	{
		FunnyName73( FunnyName184 );
	}
}

exec function bool DropItem( optional Inventory Inv, optional bool bDrop )
{
	local byte FunnyName185;
	local Inventory Item, previousItemInHand;
	local vector X, Y, Z, dropVect;
	local float size, Mult;
	local DeusExCarcass carc;
	local Class<DeusExCarcass> carcClass;
	local bool bDropped, bRemovedFromSlots;
	local int itemPosX, itemPosY;

	bDropped = true;
	if ( RestrictInput() )
	{
		return false;
	}
	if ( Inv==None )
	{
		previousItemInHand = inHand;
		Item = inHand;
	}
	else
	{
		Item = Inv;
	}
	if ( Item!=None )
	{
		GetAxes( Rotation, X, Y, Z );
		dropVect = Location+(CollisionRadius+float(2)*Item.CollisionRadius)*X;
		dropVect.Z += BaseEyeHeight;
		if ( !FastTrace(dropVect) )
		{
			ClientMessage( CannotDropHere );
			return false;
		}
		if ( Item.IsA('DeusExWeapon') )
		{
			if ( !DeusExWeapon(Item).IsInState('Idle') && !DeusExWeapon(Item).IsInState('Idle2') && !DeusExWeapon(Item).IsInState('DownWeapon') && !DeusExWeapon(Item).IsInState('Reload') )
			{
				return false;
			}
			else
			{
				DeusExWeapon(Item).ScopeOff();
				DeusExWeapon(Item).LaserOff();
			}
		}
		if ( Item.IsA('ChargedPickup') && ChargedPickup(Item).IsActive() )
		{
			return false;
		}
		if ( Item.IsA('NanoKeyRing') )
		{
			return false;
		}
		if ( Item==inHand )
		{
			PutInHand( None );
		}
		if ( Item.IsA('DeusExPickup') )
		{
			if ( DeusExPickup(Item).bActive )
			{
				DeusExPickup(Item).Activate();
			}
			DeusExPickup(Item).NumCopies--;
			UpdateBeltText( Item );
			if ( DeusExPickup(Item).NumCopies>0 )
			{
				if ( previousItemInHand==Item )
				{
					PutInHand( previousItemInHand );
				}
				Item = Spawn( Item.Class, Owner );
			}
			else
			{
				bRemovedFromSlots = true;
				itemPosX = Item.invPosX;
				itemPosY = Item.invPosY;
				RemoveItemFromSlot( Item );
				DeusExPickup(Item).NumCopies = 1;
			}
		}
		else
		{
			bRemovedFromSlots = true;
			itemPosX = Item.invPosX;
			itemPosY = Item.invPosY;
			RemoveItemFromSlot( Item );
		}
		if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) && FrobTarget!=None && !Item.IsA('POVCorpse') )
		{
			Item.Velocity = vect(0.0,0.0,0.0);
			PlayPickupAnim( FrobTarget.Location );
			size = FrobTarget.CollisionRadius-Item.CollisionRadius*float(2);
			dropVect.X = size/float(2)-FRand()*size;
			dropVect.Y = size/float(2)-FRand()*size;
			dropVect.Z = FrobTarget.CollisionHeight+Item.CollisionHeight+float(16);
			if ( FastTrace(dropVect) )
			{
				Item.DropFrom( FrobTarget.Location+dropVect );
			}
			else
			{
				ClientMessage( CannotDropHere );
				bDropped = false;
			}
		}
		else
		{
			if ( AugmentationSystem!=None )
			{
				Mult = AugmentationSystem.GetAugLevelValue( Class'AugMuscle' );
				if ( Mult==-1.0 )
				{
					Mult = 1.0;
				}
			}
			if ( bDrop )
			{
				Item.Velocity = VRand()*float(30);
				PlayPickupAnim( Item.Location );
			}
			else
			{
				Item.Velocity = Vector(ViewRotation)*Mult*float(300)+vect(0.0,0.0,220.0)+float(40)*VRand();
				PlayAnim( 'Attack', , 0.1 );
			}
			GetAxes( ViewRotation, X, Y, Z );
			dropVect = Location+0.8*CollisionRadius*X;
			dropVect.Z += BaseEyeHeight;
			if ( Item.IsA('POVCorpse') )
			{
				if ( POVCorpse(Item).carcClassString!="" )
				{
					carcClass = Class<DeusExCarcass>(DynamicLoadObject(POVCorpse(Item).carcClassString,Class'Class'));
					if ( carcClass!=None )
					{
						carc = Spawn( carcClass );
						if ( carc!=None )
						{
							carc.Mesh = carc.Mesh2;
							carc.KillerAlliance = POVCorpse(Item).KillerAlliance;
							carc.KillerBindName = POVCorpse(Item).KillerBindName;
							carc.Alliance = POVCorpse(Item).Alliance;
							carc.bNotDead = POVCorpse(Item).bNotDead;
							carc.bEmitCarcass = POVCorpse(Item).bEmitCarcass;
							carc.CumulativeDamage = POVCorpse(Item).CumulativeDamage;
							carc.MaxDamage = POVCorpse(Item).MaxDamage;
							carc.ItemName = POVCorpse(Item).CorpseItemName;
							carc.CarcassName = POVCorpse(Item).CarcassName;
							carc.Velocity = Item.Velocity*0.5;
							Item.Velocity = vect(0.0,0.0,0.0);
							carc.bHidden = false;
							carc.SetPhysics( PHYS_Falling );
							carc.SetScaleGlow();
							if ( carc.SetLocation(dropVect) )
							{
								SetInHandPending( None );
								Item.Destroy();
								Item = None;
							}
							else
							{
								carc.bHidden = true;
							}
						}
					}
				}
			}
			else if ( FastTrace(dropVect) )
			{
				Item.DropFrom( dropVect );
				Item.bFixedRotationDir = true;
				Item.RotationRate.Pitch = int(float(32768-Rand(65536))*4.0);
				Item.RotationRate.Yaw = int(float(32768-Rand(65536))*4.0);
			}
		}
		if ( Item!=None )
		{
			if ( (inHand==None || inHandPending==None) && int(Item.Physics)!=int(EPhysics.PHYS_Falling) )
			{
				PutInHand( Item );
				ClientMessage( CannotDropHere );
				bDropped = false;
			}
			else
			{
				Item.Instigator = Self;
			}
		}
	}
	else if ( carriedDecoration!=None )
	{
		DropDecoration();
		PlayAnim( 'Attack', , 0.1 );
	}
	if ( bRemovedFromSlots && Item!=None && !bDropped )
	{
		PlaceItemInSlot( Item, itemPosX, itemPosY );
	}
	return bDropped;
}

exec function ParseRightClick()
{
	FunnyName124 = false;
	if ( FrobTarget!=None && FrobTarget.IsA('DeusExProjectile') )
	{
		if ( !FrobTarget.IsA('Shuriken') || !FunnyName45.default.bKnife_FullRefill )
		{
			FunnyName124 = true;
		}
	}
	Super.ParseRightClick();
}

function DoFrob( Actor Frobber, Inventory frobWith )
{
	local DeusExMover FunnyName188;

	if ( FrobTarget==None )
	{
		return;
	}
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		if ( FunnyName110!=None && FrobTarget.IsA('Computers') && Computers(FrobTarget).curFrobber==None )
		{
			FunnyName110.Destroy();
		}
		FunnyName188 = DeusExMover(FrobTarget);
		if ( FunnyName188!=None )
		{
			if ( FunnyName112!=None && FunnyName112.FunnyName408!=None )
			{
				FunnyName112.FunnyName21( FunnyName188 );
			}
			else if ( FunnyName188.bInitialLocked && (int(FunnyName188.KeyNum)!=0 || int(FunnyName188.PrevKeyNum)!=0) )
			{
				return;
			}
		}
	}
	Super.DoFrob( Frobber, frobWith );
}

function bool CanBeLifted( Decoration FunnyName189 )
{
	local Actor A;
	local int FunnyName181;
	local float FunnyName190, FunnyName191;

	if ( !FunnyName189.bPushable )
	{
		ClientMessage( CannotLift );
		return false;
	}
	FunnyName191 = FunnyName189.Mass;
	foreach FunnyName189.BasedActors( Class'Actor', A )
	{
		if ( A==Self )
		{
			ClientMessage( CannotLift );
			return false;
		}
		else
		{
			FunnyName191 += A.Mass*0.3;
		}
	}
	FunnyName190 = 50.0;
	if ( AugmentationSystem!=None )
	{
		FunnyName181 = AugmentationSystem.GetClassLevel( Class'AugMuscle' );
		if ( FunnyName181>=0 )
		{
			FunnyName190 *= float(FunnyName181)+2.0;
		}
	}
	if ( FunnyName191>FunnyName190 )
	{
		ClientMessage( TooHeavyToLift );
		return false;
	}
	return true;
}

function PutCarriedDecorationInHand()
{
	local Actor A;
	local vector lookDir, upDir;

	if ( carriedDecoration!=None )
	{
		lookDir = Vector(Rotation);
		lookDir.Z = 0.0;
		upDir = vect(0.0,0.0,0.0);
		upDir.Z = CollisionHeight*0.5;
		carriedDecoration.SetPhysics( PHYS_Falling );
		foreach carriedDecoration.BasedActors( Class'Actor', A )
		{
			A.SetPhysics( PHYS_Falling );
		}
		if ( carriedDecoration.SetLocation(Location+upDir+(0.5*CollisionRadius+carriedDecoration.CollisionRadius)*lookDir) )
		{
			carriedDecoration.SetPhysics( PHYS_None );
			carriedDecoration.SetBase( Self );
			carriedDecoration.SetCollision( false, false, false );
			carriedDecoration.bCollideWorld = false;
			carriedDecoration.Style = STY_Translucent;
			carriedDecoration.ScaleGlow = 1.0;
			carriedDecoration.bUnlit = true;
			FrobTarget = None;
		}
		else
		{
			ClientMessage( NoRoomToLift );
			carriedDecoration = None;
		}
	}
}

exec function Set( string CommandLine )
{
	FunnyName79( CommandLine );
}

simulated function int GetMPHitLocation( vector HitLocation )
{
	local float headOffsetZ, armOffset;
	local vector Offset;

	Offset = HitLocation-Location << Rotation;
	headOffsetZ = CollisionHeight*0.78;
	armOffset = CollisionRadius*0.35;
	if ( Offset.Z>headOffsetZ )
	{
		return 1;
	}
	else if ( Offset.Z<0.0 )
	{
		if ( Offset.Y>0.0 )
		{
			return 4;
		}
		else
		{
			return 3;
		}
	}
	else if ( Offset.Y>armOffset )
	{
		return 6;
	}
	else if ( Offset.Y<-armOffset )
	{
		return 5;
	}
	else
	{
		return 2;
	}
	return 0;
}

function TakeDamage( int Damage, Pawn instigatedBy, vector HitLocation, vector Momentum, name DamageType )
{
	local byte FunnyName193;
	local int actualDamage, MPHitLoc;
	local bool bAlreadyDead, bPlayAnim, bDamageGotReduced;
	local vector Offset, dst;
	local float origHealth, fdst;
	local DeusExLevelInfo Info;
	local WeaponRifle FunnyName194;
	local string bodyString;

	bodyString = "";
	origHealth = float(Health);
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		Damage *= MPDamageMult;
	}
	Offset = HitLocation-Location << Rotation;
	bDamageGotReduced = DXReduceDamage( Damage, DamageType, HitLocation, actualDamage, false );
	if ( ReducedDamageType==DamageType )
	{
		actualDamage = int(float(actualDamage)*(1.0-ReducedDamagePct));
	}
	if ( ReducedDamageType=='All' )
	{
		actualDamage = 0;
	}
	if ( Level.Game!=None && Level.Game.DamageMutator!=None )
	{
		Level.Game.DamageMutator.MutatorTakeDamage( actualDamage, Self, instigatedBy, HitLocation, Momentum, DamageType );
	}
	if ( bNintendoImmunity || actualDamage==0 && NintendoImmunityTimeLeft>0.0 )
	{
		return;
	}
	if ( actualDamage<0 )
	{
		return;
	}
	if ( DamageType=='NanoVirus' )
	{
		return;
	}
	if ( DamageType=='Poison' || DamageType=='PoisonEffect' )
	{
		AddDamageDisplay( 'PoisonGas', Offset );
	}
	else
	{
		AddDamageDisplay( DamageType, Offset );
	}
	if ( DamageType=='Poison' || int(Level.NetMode)!=int(ENetMode.NM_Standalone) && DamageType=='TearGas' )
	{
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			ServerConditionalNotifyMsg( 4 );
		}
		StartPoison( instigatedBy, Damage );
	}
	if ( bDamageGotReduced && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		ShieldStatus = SS_Strong;
		ShieldTimer = 1.0;
	}
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) && DeusExPlayer(instigatedBy)!=None )
	{
		FunnyName194 = WeaponRifle(DeusExPlayer(instigatedBy).Weapon);
		if ( FunnyName194!=None && !FunnyName194.bZoomed && (FunnyName194.Class==Class'CBPWeaponRifle' || FunnyName194.Class==Class'WeaponRifle') )
		{
			actualDamage *= FunnyName194.mpNoScopeMult;
		}
		if ( TeamDMGame(DXGame)!=None && DeusExPlayer(instigatedBy)!=Self && TeamDMGame(DXGame).ArePlayersAllied(DeusExPlayer(instigatedBy),Self) )
		{
			actualDamage *= TeamDMGame(DXGame).fFriendlyFireMult;
			if ( DamageType!='TearGas' && DamageType!='PoisonEffect' )
			{
				DeusExPlayer(instigatedBy).MultiplayerNotifyMsg( 2 );
			}
		}
	}
	if ( DamageType=='EMP' )
	{
		EnergyDrain += float(actualDamage);
		EnergyDrainTotal += float(actualDamage);
		PlayTakeHitSound( actualDamage, DamageType, 1 );
		return;
	}
	bPlayAnim = true;
	if ( DamageType=='Burned' || PlayerReplicationInfo.bFeigningDeath )
	{
		bPlayAnim = false;
	}
	if ( int(Physics)==int(EPhysics.PHYS_None) )
	{
		SetMovementPhysics();
	}
	if ( int(Physics)==int(EPhysics.PHYS_Walking) )
	{
		Momentum.Z = 0.4*VSize( Momentum );
	}
	if ( instigatedBy==Self )
	{
		Momentum *= 0.6;
	}
	Momentum = Momentum/Mass;
	MPHitLoc = GetMPHitLocation( HitLocation );
	if ( MPHitLoc==0 )
	{
		return;
	}
	else if ( MPHitLoc==1 )
	{
		bodyString = HeadString;
		if ( bPlayAnim )
		{
			PlayAnim( 'HitHead', , 0.1 );
		}
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			actualDamage *= float(2);
			HealthHead -= actualDamage;
		}
		else
		{
			HealthHead -= actualDamage*2;
		}
	}
	else if ( MPHitLoc==3 || MPHitLoc==4 )
	{
		bodyString = TorsoString;
		if ( MPHitLoc==4 )
		{
			if ( bPlayAnim )
			{
				PlayAnim( 'HitLegRight', , 0.1 );
			}
		}
		else if ( bPlayAnim )
		{
			PlayAnim( 'HitLegLeft', , 0.1 );
		}
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			HealthLegRight -= actualDamage;
			HealthLegLeft -= actualDamage;
			if ( HealthLegLeft<0 )
			{
				HealthArmRight += HealthLegLeft;
				HealthTorso += HealthLegLeft;
				HealthArmLeft += HealthLegLeft;
				HealthLegLeft = 0;
				HealthLegRight = 0;
			}
		}
		else
		{
			if ( MPHitLoc==4 )
			{
				HealthLegRight -= actualDamage;
			}
			else
			{
				HealthLegLeft -= actualDamage;
			}
			if ( HealthLegRight<0 && HealthLegLeft>0 )
			{
				HealthLegLeft += HealthLegRight;
				HealthLegRight = 0;
			}
			else if ( HealthLegLeft<0 && HealthLegRight>0 )
			{
				HealthLegRight += HealthLegLeft;
				HealthLegLeft = 0;
			}
			if ( HealthLegLeft<0 )
			{
				HealthTorso += HealthLegLeft;
				HealthLegLeft = 0;
			}
			if ( HealthLegRight<0 )
			{
				HealthTorso += HealthLegRight;
				HealthLegRight = 0;
			}
		}
	}
	else
	{
		bodyString = TorsoString;
		if ( MPHitLoc==6 )
		{
			if ( bPlayAnim )
			{
				PlayAnim( 'HitArmRight', , 0.1 );
			}
		}
		else if ( MPHitLoc==5 )
		{
			if ( bPlayAnim )
			{
				PlayAnim( 'HitArmLeft', , 0.1 );
			}
		}
		else if ( bPlayAnim )
		{
			PlayAnim( 'HitTorso', , 0.1 );
		}
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			HealthArmLeft -= actualDamage;
			HealthTorso -= actualDamage;
			HealthArmRight -= actualDamage;
		}
		else
		{
			if ( MPHitLoc==6 )
			{
				HealthArmRight -= actualDamage;
			}
			else if ( MPHitLoc==5 )
			{
				HealthArmLeft -= actualDamage;
			}
			else
			{
				HealthTorso -= actualDamage*2;
			}
			if ( HealthArmLeft<0 )
			{
				HealthTorso += HealthArmLeft;
				HealthArmLeft = 0;
			}
			if ( HealthArmRight<0 )
			{
				HealthTorso += HealthArmRight;
				HealthArmRight = 0;
			}
		}
	}
	if ( bPlayAnim && Offset.X<0.0 )
	{
		if ( MPHitLoc==1 )
		{
			PlayAnim( 'HitHeadBack', , 0.1 );
		}
		else
		{
			PlayAnim( 'HitTorsoBack', , 0.1 );
		}
	}
	if ( bPlayAnim && Region.Zone.bWaterZone )
	{
		if ( Offset.X<0.0 )
		{
			PlayAnim( 'WaterHitTorsoBack', , 0.1 );
		}
		else
		{
			PlayAnim( 'WaterHitTorso', , 0.1 );
		}
	}
	GenerateTotalHealth();
	if ( DamageType!='Stunned' && DamageType!='TearGas' && DamageType!='HalonGas' && DamageType!='PoisonGas' && DamageType!='Radiation' && DamageType!='EMP' && DamageType!='NanoVirus' && DamageType!='Drowned' && DamageType!='KnockedOut' )
	{
		BleedRate += (origHealth-float(Health))/30.0;
	}
	if ( carriedDecoration!=None )
	{
		DropDecoration();
	}
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) && Health<=0 )
	{
		Info = GetLevelInfo();
		if ( Info!=None && Info.missionNumber==0 )
		{
			HealthTorso = int(FMax(float(HealthTorso),10.0));
			HealthHead = int(FMax(float(HealthHead),10.0));
			GenerateTotalHealth();
		}
	}
	if ( Health>0 )
	{
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) && HealthLegLeft==0 && HealthLegRight==0 )
		{
			ServerConditionalNotifyMsg( 10 );
		}
		if ( instigatedBy!=None )
		{
			damageAttitudeTo( instigatedBy );
		}
		PlayDXTakeDamageHit( float(actualDamage), HitLocation, DamageType, Momentum, bDamageGotReduced );
		AISendEvent( 'Distress', EAITYPE_Visual );
	}
	else
	{
		NextState = '';
		PlayDeathHit( float(actualDamage), HitLocation, DamageType, Momentum );
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			CreateKillerProfile( instigatedBy, actualDamage, DamageType, bodyString );
		}
		if ( float(actualDamage)>Mass )
		{
			Health = -1*actualDamage;
		}
		Enemy = instigatedBy;
		Died( instigatedBy, DamageType, HitLocation );
		return;
	}
	MakeNoise( 1.0 );
	if ( DamageType=='Flamed' && !bOnFire )
	{
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			ServerConditionalNotifyMsg( 5 );
		}
		CatchFire( instigatedBy );
	}
	myProjKiller = None;
}

function HidePlayer()
{
	Super.HidePlayer();
	FunnyName122 = 2;
}

function UpdateTranslucency( float DeltaTime )
{
	local bool FunnyName195;

	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		return;
	}
	FunnyName195 = false;
	if ( AugmentationSystem.GetAugLevelValue(Class'AugCloak')!=-1.0 )
	{
		FunnyName195 = true;
	}
	if ( inHand!=None && inHand.IsA('DeusExWeapon') && FunnyName195 )
	{
		FunnyName195 = false;
		ClientMessage( WeaponUnCloak );
		AugmentationSystem.FindAugmentation(Class'AugCloak').Deactivate();
	}
	if ( UsingChargedPickup(Class'AdaptiveArmor') )
	{
		FunnyName195 = true;
	}
	if ( bHidden )
	{
		FunnyName122 = 2;
	}
	else if ( FunnyName195 )
	{
		FunnyName122 = 1;
	}
	else
	{
		FunnyName122 = 0;
	}
	if ( !FunnyName125 )
	{
		FunnyName108[0] = MultiSkins[5];
		FunnyName108[1] = MultiSkins[6];
		FunnyName108[2] = MultiSkins[7];
		FunnyName125 = true;
	}
	if ( FunnyName195 )
	{
		ScaleGlow = 0.0;
		Style = STY_Translucent;
		if ( int(FunnyName105)==1 )
		{
			MultiSkins[6] = Texture'DeusExItems.Skins.BlackMaskTex';
			MultiSkins[7] = Texture'DeusExItems.Skins.BlackMaskTex';
		}
		else if ( int(FunnyName105)==2 )
		{
			MultiSkins[5] = Texture'DeusExItems.Skins.BlackMaskTex';
			MultiSkins[6] = Texture'DeusExItems.Skins.BlackMaskTex';
		}
	}
	else
	{
		ScaleGlow = default.ScaleGlow;
		Style = default.Style;
		if ( int(FunnyName105)==1 )
		{
			MultiSkins[6] = FunnyName108[1];
			MultiSkins[7] = FunnyName108[2];
		}
		else if ( int(FunnyName105)==2 )
		{
			MultiSkins[5] = FunnyName108[0];
			MultiSkins[6] = FunnyName108[1];
		}
	}
}

function SpawnBlood( vector HitLocation, float Damage )
{
	local FunnyName54 FunnyName197;

	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		FunnyName197 = Spawn( Class'FunnyName54', , , HitLocation );
		if ( FunnyName197!=None )
		{
			FunnyName197.FunnyName20 = byte(Clamp(1+int(0.5+Damage*0.07),1,20));
		}
	}
	else
	{
		Super.SpawnBlood( HitLocation, Damage );
	}
}

function Carcass SpawnCarcass()
{
	local CBPCarcass FunnyName198;
	local Inventory FunnyName199;
	local vector Loc;

	if ( Health>=-80 )
	{
		FunnyName198 = CBPCarcass(Spawn(CarcassType));
	}
	if ( FunnyName198!=None )
	{
		FunnyName198.Initfor( Self );
		Loc = Location;
		Loc.Z = Loc.Z-CollisionHeight+FunnyName198.CollisionHeight;
		FunnyName198.SetLocation( Loc );
		if ( Player!=None )
		{
			FunnyName198.bPlayerCarcass = true;
		}
		MoveTarget = FunnyName198;
	}
	while ( Inventory!=None )
	{
		FunnyName199 = Inventory;
		DeleteInventory( FunnyName199 );
		if ( FunnyName198!=None )
		{
			FunnyName198.AddInventory( FunnyName199 );
		}
		else
		{
			FunnyName199.Destroy();
		}
	}
	return FunnyName198;
}

function SpawnGibbedCarcass()
{
	local CBPCarcass FunnyName198;
	local Inventory FunnyName199;

	FunnyName198 = CBPCarcass(Spawn(CarcassType));
	if ( FunnyName198!=None )
	{
		FunnyName198.Initfor( Self );
		FunnyName198.ChunkUp( -1*Health );
	}
	while ( Inventory!=None )
	{
		FunnyName199 = Inventory;
		DeleteInventory( FunnyName199 );
		FunnyName199.Destroy();
	}
}

simulated function MoveDrone( float deltaTime, vector FunnyName201 )
{
	if ( aDrone!=None )
	{
		Super.MoveDrone( deltaTime, FunnyName201 );
	}
}

exec function SwitchAmmo()
{
	if ( DeusExWeapon(inHand)!=None )
	{
		DeusExWeapon(inHand).CycleAmmo();
	}
}

function CreateKillerProfile( Pawn Killer, int Damage, name damageType, string FunnyName204 )
{
	if ( killProfile!=None )
	{
		killProfile.methodStr = NoneString;
	}
	Super.CreateKillerProfile( Killer, Damage, damageType, FunnyName204 );
}

exec function Suicide()
{
	local bool FunnyName205;

	if ( DeusExMPGame(Level.Game)!=None && DeusExMPGame(Level.Game).bNewMap )
	{
		return;
	}
	if ( bNintendoImmunity || NintendoImmunityTimeLeft>0.0 )
	{
		return;
	}
	CreateKillerProfile( None, 0, '', "" );
	KilledBy( None );
}

function ServerTaunt( name FunnyName206 )
{
}

exec function Speech( int Type, int FunnyName207, int Callsign )
{
}

exec function Taunt( name FunnyName206 )
{
}

exec function CallForHelp()
{
}

function Typing( bool TeamNum )
{
	bIsTyping = TeamNum;
}

exec function DebugCommand( string FunnyName208 )
{
}

exec function SetDebug( name FunnyName209, name FunnyName210 )
{
}

exec function GetDebug( name FunnyName209 )
{
}

simulated final function SavedMove FunnyName107()
{
	local SavedMove FunnyName211, FunnyName212, FunnyName213;
	local int keyIndex, FunnyName215, FunnyName216, FunnyName162;

	if ( FreeMoves==None )
	{
		for ( FunnyName211=SavedMoves; FunnyName211!=None; FunnyName211=FunnyName211.NextMove )
		{
			keyIndex++;
		}
		FunnyName162 = int(float(5)/FunnyName87(Player.DynamicUpdateInterval));
		for ( keyIndex=keyIndex-FunnyName162; keyIndex>0; keyIndex-- )
		{
			FunnyName216 = int(FRand()*float(FunnyName162)*0.6);
			FunnyName215 = 0;
			FunnyName213 = None;
			for ( FunnyName211=SavedMoves; FunnyName211!=None; FunnyName211=FunnyName211.NextMove )
			{
				if ( FunnyName215==FunnyName216 )
				{
					break;
				}
				FunnyName215++;
				FunnyName213 = FunnyName211;
			}
			FunnyName212 = FunnyName211.NextMove;
			if ( FunnyName213!=None )
			{
				FunnyName213.NextMove = FunnyName212;
			}
			else
			{
				SavedMoves = FunnyName212;
			}
			FunnyName212.Acceleration = FunnyName211.Delta*FunnyName211.Acceleration+FunnyName212.Delta*FunnyName212.Acceleration;
			FunnyName212.Delta += FunnyName211.Delta;
			FunnyName212.Acceleration /= FunnyName212.Delta;
			FunnyName212.bRun = FunnyName212.bRun || FunnyName211.bRun;
			FunnyName212.bDuck = FunnyName212.bDuck || FunnyName211.bDuck;
			FunnyName212.bPressedJump = FunnyName212.bPressedJump || FunnyName211.bPressedJump;
			FunnyName211.Clear();
			FunnyName211.AmbientGlow = 0;
			FunnyName211.NextMove = FreeMoves;
			FreeMoves = FunnyName211;
		}
	}
	if ( FreeMoves==None )
	{
		FunnyName211 = Spawn( Class'SavedMove' );
		if ( FunnyName211!=None )
		{
			FunnyName211.AmbientGlow = 0;
		}
		return FunnyName211;
	}
	else
	{
		FunnyName211 = FreeMoves;
		FreeMoves = FreeMoves.NextMove;
		FunnyName211.NextMove = None;
		FunnyName211.AmbientGlow = 0;
		return FunnyName211;
	}
}

simulated final function float FunnyName87( private float FunnyName217 )
{
	if ( FunnyName120<1600 )
	{
		return 2.0*FunnyName217;
	}
	return (20000.0/float(Min(Player.CurrentNetSpeed,FunnyName120))) ** 0.286736*FunnyName217;
}

simulated final function int FunnyName38( private int FunnyName198 )
{
	if ( FunnyName198>=0 )
	{
		FunnyName198 = Min( FunnyName198, 512 );
	}
	else
	{
		FunnyName198 = Min( int(Abs(float(FunnyName198))), 511 )|512;
	}
	return FunnyName198;
}

simulated final function int FunnyName37( private int FunnyName198 )
{
	if ( FunnyName198>=0 )
	{
		FunnyName198 = Min( FunnyName198, 256 );
	}
	else
	{
		FunnyName198 = Min( int(Abs(float(FunnyName198))), 255 )|256;
	}
	return FunnyName198;
}

function ServerMove( float FunnyName218, vector FunnyName219, vector FunnyName220, bool FunnyName221, bool FunnyName222, bool FunnyName223, bool FunnyName224, bool FunnyName225, bool FunnyName226, bool FunnyName227, EDodgeDir FunnyName228, byte FunnyName229, int FunnyName230, optional byte FunnyName231, optional int FunnyName232 )
{
	if ( FunnyName111!=None )
	{
		FunnyName111.FunnyName61( 'SM' );
	}
}

final function FunnyName106( private float FunnyName218, private int FunnyName230, private vector FunnyName220, private vector FunnyName219, private bool FunnyName223, private bool FunnyName224, private bool FunnyName226, private bool FunnyName225, private bool FunnyName227, private bool FunnyName233, private bool FunnyName234, private bool FunnyName235, private optional byte FunnyName231, private optional int FunnyName232 )
{
	local Actor FunnyName236;
	local rotator FunnyName237, FunnyName238;
	local vector FunnyName239, FunnyName240;
	local float DeltaTime, FunnyName241, FunnyName242, FunnyName243;
	local int FunnyName244, FunnyName245, FunnyName246;
	local name FunnyName247, FunnyName248;
	local EPhysics FunnyName249;
	local byte FunnyName250;
	local bool FunnyName251, FunnyName221, FunnyName222;

	//
	// 0x0000: EX_JumpIfNot (JumpOffset=0x0011)
	// 0x0003:   EX_Native (iNative=179,Function=Core.Object.GreaterEqual_FloatFloat,OperatorType=1)
	// 0x0004:     EX_InstanceVariable (Property=Engine.PlayerPawn.CurrentTimeStamp)
	// 0x0009:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName218)
	// 0x000F: EX_Return
	// 0x0010:   EX_Nothing
	// 0x0011: EX_LetBool
	// 0x0012:   EX_BoolVariable
	// 0x0013:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName221)
	// 0x0018:   EX_IntToBool
	// 0x0019:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x001A:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName230)
	// 0x001F:       EX_IntOne
	// 0x0021: EX_LetBool
	// 0x0022:   EX_BoolVariable
	// 0x0023:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName222)
	// 0x0028:   EX_IntToBool
	// 0x0029:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x002A:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName230)
	// 0x002F:       EX_IntConstByte (IntConst=2)
	// 0x0032: EX_JumpIfNot (JumpOffset=0x0055)
	// 0x0035:   EX_Native (iNative=132,Function=Core.Object.OrOr_BoolBool,OperatorType=1)
	// 0x0036:     EX_Native (iNative=281,Function=Core.Object.IsInState,OperatorType=0)
	// 0x0038:       EX_NameConst (NameConst=FeigningDeath)
	// 0x003E:     EX_Skip (SkipSize=0x0009)
	// 0x0041:       EX_Native (iNative=281,Function=Core.Object.IsInState,OperatorType=0)
	// 0x0043:         EX_NameConst (NameConst=GameEnded)
	// 0x004A: EX_Let
	// 0x004B:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName231)
	// 0x0050:   EX_ByteConst (ByteConst=0)
	// 0x0052: EX_Jump (JumpOffset=0x00A0)
	// 0x0055: EX_JumpIfNot (JumpOffset=0x00A0)
	// 0x0058:   EX_Native (iNative=281,Function=Core.Object.IsInState,OperatorType=0)
	// 0x005A:     EX_NameConst (NameConst=Dying)
	// 0x0060: EX_Let
	// 0x0061:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName231)
	// 0x0066:   EX_ByteConst (ByteConst=0)
	// 0x0068: EX_LetBool
	// 0x0069:   EX_BoolVariable
	// 0x006A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName221)
	// 0x006F:   EX_False
	// 0x0070: EX_LetBool
	// 0x0071:   EX_BoolVariable
	// 0x0072:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName222)
	// 0x0077:   EX_False
	// 0x0078: EX_LetBool
	// 0x0079:   EX_BoolVariable
	// 0x007A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName223)
	// 0x007F:   EX_False
	// 0x0080: EX_LetBool
	// 0x0081:   EX_BoolVariable
	// 0x0082:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName224)
	// 0x0087:   EX_False
	// 0x0088: EX_LetBool
	// 0x0089:   EX_BoolVariable
	// 0x008A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName226)
	// 0x008F:   EX_False
	// 0x0090: EX_LetBool
	// 0x0091:   EX_BoolVariable
	// 0x0092:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName225)
	// 0x0097:   EX_False
	// 0x0098: EX_LetBool
	// 0x0099:   EX_BoolVariable
	// 0x009A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName227)
	// 0x009F:   EX_False
	// 0x00A0: EX_Let
	// 0x00A1:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName236)
	// 0x00A6:   EX_InstanceVariable (Property=Engine.Actor.Base)
	// 0x00AB: EX_Let
	// 0x00AC:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName247)
	// 0x00B1:   EX_Native (iNative=284,Function=Core.Object.GetStateName,OperatorType=0)
	// 0x00B4: EX_Let
	// 0x00B5:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName249)
	// 0x00BA:   EX_InstanceVariable (Property=Engine.Actor.Physics)
	// 0x00BF: EX_JumpIfNot (JumpOffset=0x0294)
	// 0x00C2:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x00C3:     EX_ByteToInt
	// 0x00C4:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName231)
	// 0x00C9:     EX_IntZero
	// 0x00CB: EX_Let
	// 0x00CC:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName242)
	// 0x00D1:   EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x00D2:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x00D3:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName218)
	// 0x00D8:       EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x00D9:         EX_ByteToFloat
	// 0x00DA:           EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName231)
	// 0x00DF:         EX_FloatConst (FloatConst=0.0015625)
	// 0x00E6:     EX_FloatConst (FloatConst=0.00078125)
	// 0x00EC: EX_JumpIfNot (JumpOffset=0x0294)
	// 0x00EF:   EX_Native (iNative=176,Function=Core.Object.Less_FloatFloat,OperatorType=1)
	// 0x00F0:     EX_InstanceVariable (Property=Engine.PlayerPawn.CurrentTimeStamp)
	// 0x00F5:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x00F6:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName242)
	// 0x00FB:       EX_FloatConst (FloatConst=0.00078125)
	// 0x0102: EX_Let
	// 0x0103:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x0108:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x010D:   EX_IntToFloat
	// 0x010E:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x010F:       EX_FloatToInt
	// 0x0110:         EX_IntToFloat
	// 0x0111:           EX_Native (iNative=196,Function=Core.Object.GreaterGreaterGreater_IntInt,OperatorType=1)
	// 0x0112:             EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName232)
	// 0x0117:             EX_IntConstByte (IntConst=3)
	// 0x011A:       EX_IntConst (IntConst=1023)
	// 0x0120: EX_JumpIfNot (JumpOffset=0x0154)
	// 0x0123:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x0124:     EX_StructMember (Property=Core.Object.Vector.X)
	// 0x0129:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x012E:     EX_IntToFloat
	// 0x012F:       EX_IntConst (IntConst=512)
	// 0x0135: EX_Let
	// 0x0136:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x013B:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x0140:   EX_Native (iNative=174,Function=Core.Object.Add_FloatFloat,OperatorType=1)
	// 0x0141:     EX_Native (iNative=169,Function=Core.Object.Subtract_PreFloat,OperatorType=2)
	// 0x0142:       EX_StructMember (Property=Core.Object.Vector.X)
	// 0x0147:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x014D:     EX_IntToFloat
	// 0x014E:       EX_IntConst (IntConst=512)
	// 0x0154: EX_Let
	// 0x0155:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x015A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x015F:   EX_IntToFloat
	// 0x0160:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x0161:       EX_FloatToInt
	// 0x0162:         EX_IntToFloat
	// 0x0163:           EX_Native (iNative=196,Function=Core.Object.GreaterGreaterGreater_IntInt,OperatorType=1)
	// 0x0164:             EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName232)
	// 0x0169:             EX_IntConstByte (IntConst=13)
	// 0x016C:       EX_IntConst (IntConst=1023)
	// 0x0172: EX_JumpIfNot (JumpOffset=0x01A6)
	// 0x0175:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x0176:     EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x017B:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x0180:     EX_IntToFloat
	// 0x0181:       EX_IntConst (IntConst=512)
	// 0x0187: EX_Let
	// 0x0188:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x018D:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x0192:   EX_Native (iNative=174,Function=Core.Object.Add_FloatFloat,OperatorType=1)
	// 0x0193:     EX_Native (iNative=169,Function=Core.Object.Subtract_PreFloat,OperatorType=2)
	// 0x0194:       EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x0199:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x019F:     EX_IntToFloat
	// 0x01A0:       EX_IntConst (IntConst=512)
	// 0x01A6: EX_Let
	// 0x01A7:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x01AC:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x01B1:   EX_IntToFloat
	// 0x01B2:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x01B3:       EX_FloatToInt
	// 0x01B4:         EX_IntToFloat
	// 0x01B5:           EX_Native (iNative=196,Function=Core.Object.GreaterGreaterGreater_IntInt,OperatorType=1)
	// 0x01B6:             EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName232)
	// 0x01BB:             EX_IntConstByte (IntConst=23)
	// 0x01BE:       EX_IntConst (IntConst=511)
	// 0x01C4: EX_JumpIfNot (JumpOffset=0x01F8)
	// 0x01C7:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x01C8:     EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x01CD:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x01D2:     EX_IntToFloat
	// 0x01D3:       EX_IntConst (IntConst=256)
	// 0x01D9: EX_Let
	// 0x01DA:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x01DF:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x01E4:   EX_Native (iNative=174,Function=Core.Object.Add_FloatFloat,OperatorType=1)
	// 0x01E5:     EX_Native (iNative=169,Function=Core.Object.Subtract_PreFloat,OperatorType=2)
	// 0x01E6:       EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x01EB:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x01F1:     EX_IntToFloat
	// 0x01F2:       EX_IntConst (IntConst=256)
	// 0x01F8: EX_Native (iNative=182,Function=Core.Object.MultiplyEqual_FloatFloat,OperatorType=1)
	// 0x01F9:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x01FE:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x0203:   EX_IntToFloat
	// 0x0204:     EX_IntConstByte (IntConst=6)
	// 0x0207: EX_Native (iNative=182,Function=Core.Object.MultiplyEqual_FloatFloat,OperatorType=1)
	// 0x0208:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x020D:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x0212:   EX_IntToFloat
	// 0x0213:     EX_IntConstByte (IntConst=6)
	// 0x0216: EX_Native (iNative=182,Function=Core.Object.MultiplyEqual_FloatFloat,OperatorType=1)
	// 0x0217:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x021C:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x0221:   EX_IntToFloat
	// 0x0222:     EX_IntConstByte (IntConst=12)
	// 0x0225: EX_LetBool
	// 0x0226:   EX_BoolVariable
	// 0x0227:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName251)
	// 0x022C:   EX_IntToBool
	// 0x022D:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x022E:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName232)
	// 0x0233:       EX_IntConstByte (IntConst=4)
	// 0x0236: EX_JumpIfNot (JumpOffset=0x024C)
	// 0x0239:   EX_BoolVariable
	// 0x023A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName251)
	// 0x023F: EX_LetBool
	// 0x0240:   EX_BoolVariable
	// 0x0241:     EX_InstanceVariable (Property=Engine.PlayerPawn.bJumpStatus)
	// 0x0246:   EX_BoolVariable
	// 0x0247:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName223)
	// 0x024C: EX_FinalFunction (Function=DXMTL152b1.MTLPlayer.FunnyName76,OperatorType=0)
	// 0x0251:   EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x0252:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName242)
	// 0x0257:     EX_InstanceVariable (Property=Engine.PlayerPawn.CurrentTimeStamp)
	// 0x025D:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x0262:   EX_RotationConst (RotationConst=(Pitch=0,Yaw=0,Roll=0))
	// 0x026F:   EX_IntToBool
	// 0x0270:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x0271:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName232)
	// 0x0276:       EX_IntOne
	// 0x0278:   EX_IntToBool
	// 0x0279:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x027A:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName232)
	// 0x027F:       EX_IntConstByte (IntConst=2)
	// 0x0282:   EX_BoolVariable
	// 0x0283:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName251)
	// 0x0289: EX_Let
	// 0x028A:   EX_InstanceVariable (Property=Engine.PlayerPawn.CurrentTimeStamp)
	// 0x028F:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName242)
	// 0x0294: EX_Let
	// 0x0295:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName244)
	// 0x029A:   EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x029B:     EX_Native (iNative=196,Function=Core.Object.GreaterGreaterGreater_IntInt,OperatorType=1)
	// 0x029C:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName230)
	// 0x02A1:       EX_IntConstByte (IntConst=16)
	// 0x02A4:     EX_IntConst (IntConst=65534)
	// 0x02AA: EX_Let
	// 0x02AB:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName245)
	// 0x02B0:   EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x02B1:     EX_Native (iNative=196,Function=Core.Object.GreaterGreaterGreater_IntInt,OperatorType=1)
	// 0x02B2:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName230)
	// 0x02B7:       EX_IntOne
	// 0x02B9:     EX_IntConst (IntConst=65534)
	// 0x02BF: EX_Let
	// 0x02C0:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x02C5:   EX_Native (iNative=212,Function=Core.Object.Multiply_VectorFloat,OperatorType=1)
	// 0x02C6:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName219)
	// 0x02CB:     EX_FloatConst (FloatConst=0.1)
	// 0x02D1: EX_LetBool
	// 0x02D2:   EX_BoolVariable
	// 0x02D3:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName251)
	// 0x02D8:   EX_Native (iNative=243,Function=Core.Object.NotEqual_BoolBool,OperatorType=1)
	// 0x02D9:     EX_BoolVariable
	// 0x02DA:       EX_InstanceVariable (Property=Engine.PlayerPawn.bJumpStatus)
	// 0x02DF:     EX_BoolVariable
	// 0x02E0:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName223)
	// 0x02E6: EX_LetBool
	// 0x02E7:   EX_BoolVariable
	// 0x02E8:     EX_InstanceVariable (Property=Engine.PlayerPawn.bJumpStatus)
	// 0x02ED:   EX_BoolVariable
	// 0x02EE:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName223)
	// 0x02F3: EX_LetBool
	// 0x02F4:   EX_BoolVariable
	// 0x02F5:     EX_InstanceVariable (Property=DXMTL152b1.MTLPlayer.FunnyName136)
	// 0x02FA:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x02FB:     EX_BoolVariable
	// 0x02FC:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName233)
	// 0x0302: EX_LetBool
	// 0x0303:   EX_BoolVariable
	// 0x0304:     EX_InstanceVariable (Property=DeusEx.DeusExPlayer.bToggleWalk)
	// 0x0309:   EX_BoolVariable
	// 0x030A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName234)
	// 0x030F: EX_LetBool
	// 0x0310:   EX_BoolVariable
	// 0x0311:     EX_InstanceVariable (Property=DXMTL152b1.MTLPlayer.FunnyName137)
	// 0x0316:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x0317:     EX_BoolVariable
	// 0x0318:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName235)
	// 0x031E: EX_JumpIfNot (JumpOffset=0x0371)
	// 0x0321:   EX_BoolVariable
	// 0x0322:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName224)
	// 0x0327: EX_JumpIfNot (JumpOffset=0x034F)
	// 0x032A:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x032B:     EX_BoolVariable
	// 0x032C:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName226)
	// 0x0331:     EX_Skip (SkipSize=0x0009)
	// 0x0334:       EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0335:         EX_InstanceVariable (Property=Engine.Pawn.Weapon)
	// 0x033A:         EX_NoObject
	// 0x033D: EX_Context (SkipSize=0x0006,MemSize=0x00)
	// 0x033E:   EX_InstanceVariable (Property=Engine.Pawn.Weapon)
	// 0x0346:   EX_VirtualFunction (FunctionName=ForceFire,Candidate=Engine.Weapon.ForceFire)
	// 0x034C: EX_Jump (JumpOffset=0x0366)
	// 0x034F: EX_JumpIfNot (JumpOffset=0x0366)
	// 0x0352:   EX_Native (iNative=154,Function=Core.Object.EqualEqual_IntInt,OperatorType=1)
	// 0x0353:     EX_ByteToInt
	// 0x0354:       EX_InstanceVariable (Property=Engine.Pawn.bFire)
	// 0x0359:     EX_IntZero
	// 0x035B: EX_VirtualFunction (FunctionName=Fire,Candidate=DeusEx.DeusExPlayer.Fire)
	// 0x0360:   EX_FloatConst (FloatConst=0.0)
	// 0x0366: EX_Let
	// 0x0367:   EX_InstanceVariable (Property=Engine.Pawn.bFire)
	// 0x036C:   EX_ByteConst (ByteConst=1)
	// 0x036E: EX_Jump (JumpOffset=0x0379)
	// 0x0371: EX_Let
	// 0x0372:   EX_InstanceVariable (Property=Engine.Pawn.bFire)
	// 0x0377:   EX_ByteConst (ByteConst=0)
	// 0x0379: EX_JumpIfNot (JumpOffset=0x03CC)
	// 0x037C:   EX_BoolVariable
	// 0x037D:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName225)
	// 0x0382: EX_JumpIfNot (JumpOffset=0x03AA)
	// 0x0385:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x0386:     EX_BoolVariable
	// 0x0387:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName227)
	// 0x038C:     EX_Skip (SkipSize=0x0009)
	// 0x038F:       EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0390:         EX_InstanceVariable (Property=Engine.Pawn.Weapon)
	// 0x0395:         EX_NoObject
	// 0x0398: EX_Context (SkipSize=0x0006,MemSize=0x00)
	// 0x0399:   EX_InstanceVariable (Property=Engine.Pawn.Weapon)
	// 0x03A1:   EX_VirtualFunction (FunctionName=ForceAltFire,Candidate=Engine.Weapon.ForceAltFire)
	// 0x03A7: EX_Jump (JumpOffset=0x03C1)
	// 0x03AA: EX_JumpIfNot (JumpOffset=0x03C1)
	// 0x03AD:   EX_Native (iNative=154,Function=Core.Object.EqualEqual_IntInt,OperatorType=1)
	// 0x03AE:     EX_ByteToInt
	// 0x03AF:       EX_InstanceVariable (Property=Engine.Pawn.bAltFire)
	// 0x03B4:     EX_IntZero
	// 0x03B6: EX_VirtualFunction (FunctionName=AltFire,Candidate=Engine.PlayerPawn.AltFire)
	// 0x03BB:   EX_FloatConst (FloatConst=0.0)
	// 0x03C1: EX_Let
	// 0x03C2:   EX_InstanceVariable (Property=Engine.Pawn.bAltFire)
	// 0x03C7:   EX_ByteConst (ByteConst=1)
	// 0x03C9: EX_Jump (JumpOffset=0x03D4)
	// 0x03CC: EX_Let
	// 0x03CD:   EX_InstanceVariable (Property=Engine.Pawn.bAltFire)
	// 0x03D2:   EX_ByteConst (ByteConst=0)
	// 0x03D4: EX_Let
	// 0x03D5:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.DeltaTime)
	// 0x03DA:   EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x03DB:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName218)
	// 0x03E0:     EX_InstanceVariable (Property=Engine.PlayerPawn.CurrentTimeStamp)
	// 0x03E6: EX_JumpIfNot (JumpOffset=0x046A)
	// 0x03E9:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x03EA:     EX_InstanceVariable (Property=Engine.PlayerPawn.ServerTimeStamp)
	// 0x03EF:     EX_IntToFloat
	// 0x03F0:       EX_IntZero
	// 0x03F2: EX_Native (iNative=184,Function=Core.Object.AddEqual_FloatFloat,OperatorType=1)
	// 0x03F3:   EX_InstanceVariable (Property=Engine.PlayerPawn.TimeMargin)
	// 0x03F8:   EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x03F9:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.DeltaTime)
	// 0x03FE:     EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x03FF:       EX_FloatConst (FloatConst=1.01)
	// 0x0404:       EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x0405:         EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0406:           EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x040E:           EX_InstanceVariable (Property=Engine.LevelInfo.TimeSeconds)
	// 0x0413:         EX_InstanceVariable (Property=Engine.PlayerPawn.ServerTimeStamp)
	// 0x041C: EX_JumpIfNot (JumpOffset=0x046A)
	// 0x041F:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x0420:     EX_InstanceVariable (Property=Engine.PlayerPawn.TimeMargin)
	// 0x0425:     EX_InstanceVariable (Property=Engine.PlayerPawn.MaxTimeMargin)
	// 0x042B: EX_Native (iNative=185,Function=Core.Object.SubtractEqual_FloatFloat,OperatorType=1)
	// 0x042C:   EX_InstanceVariable (Property=Engine.PlayerPawn.TimeMargin)
	// 0x0431:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.DeltaTime)
	// 0x0437: EX_JumpIfNot (JumpOffset=0x0454)
	// 0x043A:   EX_Native (iNative=176,Function=Core.Object.Less_FloatFloat,OperatorType=1)
	// 0x043B:     EX_InstanceVariable (Property=Engine.PlayerPawn.TimeMargin)
	// 0x0440:     EX_FloatConst (FloatConst=0.5)
	// 0x0446: EX_Let
	// 0x0447:   EX_InstanceVariable (Property=Engine.PlayerPawn.MaxTimeMargin)
	// 0x044C:   EX_DefaultVariable (Property=Engine.PlayerPawn.MaxTimeMargin)
	// 0x0451: EX_Jump (JumpOffset=0x045F)
	// 0x0454: EX_Let
	// 0x0455:   EX_InstanceVariable (Property=Engine.PlayerPawn.MaxTimeMargin)
	// 0x045A:   EX_FloatConst (FloatConst=0.5)
	// 0x045F: EX_Let
	// 0x0460:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.DeltaTime)
	// 0x0465:   EX_FloatConst (FloatConst=0.0)
	// 0x046A: EX_Let
	// 0x046B:   EX_InstanceVariable (Property=Engine.PlayerPawn.CurrentTimeStamp)
	// 0x0470:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName218)
	// 0x0475: EX_Let
	// 0x0476:   EX_InstanceVariable (Property=Engine.PlayerPawn.ServerTimeStamp)
	// 0x047B:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x047C:     EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x0484:     EX_InstanceVariable (Property=Engine.LevelInfo.TimeSeconds)
	// 0x0489: EX_Let
	// 0x048A:   EX_StructMember (Property=Core.Object.Rotator.Yaw)
	// 0x048F:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName238)
	// 0x0494:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName245)
	// 0x0499: EX_Let
	// 0x049A:   EX_StructMember (Property=Core.Object.Rotator.Roll)
	// 0x049F:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName238)
	// 0x04A4:   EX_IntZero
	// 0x04A5: EX_Let
	// 0x04A6:   EX_StructMember (Property=Core.Object.Rotator.Pitch)
	// 0x04AB:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName238)
	// 0x04B0:   EX_IntZero
	// 0x04B1: EX_Let
	// 0x04B2:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName237)
	// 0x04B7:   EX_Native (iNative=317,Function=Core.Object.Subtract_RotatorRotator,OperatorType=1)
	// 0x04B9:     EX_InstanceVariable (Property=Engine.Actor.Rotation)
	// 0x04BE:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName238)
	// 0x04C4: EX_Let
	// 0x04C5:   EX_StructMember (Property=Core.Object.Rotator.Pitch)
	// 0x04CA:     EX_InstanceVariable (Property=Engine.Pawn.ViewRotation)
	// 0x04CF:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName244)
	// 0x04D4: EX_Let
	// 0x04D5:   EX_StructMember (Property=Core.Object.Rotator.Yaw)
	// 0x04DA:     EX_InstanceVariable (Property=Engine.Pawn.ViewRotation)
	// 0x04DF:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName245)
	// 0x04E4: EX_Let
	// 0x04E5:   EX_StructMember (Property=Core.Object.Rotator.Roll)
	// 0x04EA:     EX_InstanceVariable (Property=Engine.Pawn.ViewRotation)
	// 0x04EF:   EX_IntZero
	// 0x04F0: EX_Native (iNative=299,Function=Engine.Actor.SetRotation,OperatorType=0)
	// 0x04F2:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName238)
	// 0x04F8: EX_JumpIfNot (JumpOffset=0x0542)
	// 0x04FB:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x04FC:     EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x04FD:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.DeltaTime)
	// 0x0502:       EX_IntToFloat
	// 0x0503:         EX_IntZero
	// 0x0505:     EX_Skip (SkipSize=0x0013)
	// 0x0508:       EX_Native (iNative=122,Function=Core.Object.EqualEqual_StrStr,OperatorType=1)
	// 0x0509:         EX_Context (SkipSize=0x0005,MemSize=0x00)
	// 0x050A:           EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x0512:           EX_InstanceVariable (Property=Engine.LevelInfo.Pauser)
	// 0x0517:         EX_StringConst (StringConst="")
	// 0x051B: EX_FinalFunction (Function=DXMTL152b1.MTLPlayer.FunnyName76,OperatorType=0)
	// 0x0520:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.DeltaTime)
	// 0x0525:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName239)
	// 0x052A:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName237)
	// 0x052F:   EX_BoolVariable
	// 0x0530:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName221)
	// 0x0535:   EX_BoolVariable
	// 0x0536:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName222)
	// 0x053B:   EX_BoolVariable
	// 0x053C:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName251)
	// 0x0542: EX_Let
	// 0x0543:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName243)
	// 0x0548:   EX_FinalFunction (Function=DXMTL152b1.MTLPlayer.FunnyName87,OperatorType=0)
	// 0x054D:     EX_FloatConst (FloatConst=1.0)
	// 0x0553: EX_Let
	// 0x0554:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName248)
	// 0x0559:   EX_Native (iNative=284,Function=Core.Object.GetStateName,OperatorType=0)
	// 0x055C: EX_JumpIfNot (JumpOffset=0x05A3)
	// 0x055F:   EX_Native (iNative=132,Function=Core.Object.OrOr_BoolBool,OperatorType=1)
	// 0x0560:     EX_Native (iNative=132,Function=Core.Object.OrOr_BoolBool,OperatorType=1)
	// 0x0561:       EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0562:         EX_InstanceVariable (Property=Engine.Actor.Base)
	// 0x0567:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName236)
	// 0x056D:       EX_Skip (SkipSize=0x000D)
	// 0x0570:         EX_Native (iNative=255,Function=Core.Object.NotEqual_NameName,OperatorType=1)
	// 0x0571:           EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName248)
	// 0x0576:           EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName247)
	// 0x057D:     EX_Skip (SkipSize=0x000F)
	// 0x0580:       EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0581:         EX_ByteToInt
	// 0x0582:           EX_InstanceVariable (Property=Engine.Actor.Physics)
	// 0x0587:         EX_ByteToInt
	// 0x0588:           EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName249)
	// 0x058F: EX_Native (iNative=182,Function=Core.Object.MultiplyEqual_FloatFloat,OperatorType=1)
	// 0x0590:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName243)
	// 0x0595:   EX_FloatConst (FloatConst=0.8)
	// 0x059B: EX_LetBool
	// 0x059C:   EX_BoolVariable
	// 0x059D:     EX_InstanceVariable (Property=DXMTL152b1.MTLPlayer.FunnyName135)
	// 0x05A2:   EX_True
	// 0x05A3: EX_JumpIfNot (JumpOffset=0x05D7)
	// 0x05A6:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x05A7:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x05A8:       EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x05A9:         EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x05B1:         EX_InstanceVariable (Property=Engine.LevelInfo.TimeSeconds)
	// 0x05B6:       EX_InstanceVariable (Property=Engine.PlayerPawn.LastUpdateTime)
	// 0x05BC:     EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x05BD:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName243)
	// 0x05C2:       EX_FloatConst (FloatConst=0.3)
	// 0x05C9: EX_Let
	// 0x05CA:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName241)
	// 0x05CF:   EX_FloatConst (FloatConst=10000.0)
	// 0x05D4: EX_Jump (JumpOffset=0x0650)
	// 0x05D7: EX_JumpIfNot (JumpOffset=0x0650)
	// 0x05DA:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x05DB:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x05DC:       EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x05DD:         EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x05E5:         EX_InstanceVariable (Property=Engine.LevelInfo.TimeSeconds)
	// 0x05EA:       EX_InstanceVariable (Property=Engine.PlayerPawn.LastUpdateTime)
	// 0x05F0:     EX_Native (iNative=245,Function=Core.Object.FMax,OperatorType=0)
	// 0x05F1:       EX_Native (iNative=172,Function=Core.Object.Divide_FloatFloat,OperatorType=1)
	// 0x05F2:         EX_FloatConst (FloatConst=192.0)
	// 0x05F7:         EX_IntToFloat
	// 0x05F8:           EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x05F9:             EX_InstanceVariable (Property=Engine.PlayerPawn.Player)
	// 0x0601:             EX_InstanceVariable (Property=Engine.Player.CurrentNetSpeed)
	// 0x0607:       EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x0608:         EX_FloatConst (FloatConst=0.0225)
	// 0x060D:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName243)
	// 0x0615: EX_JumpIfNot (JumpOffset=0x062C)
	// 0x0618:   EX_BoolVariable
	// 0x0619:     EX_InstanceVariable (Property=DXMTL152b1.MTLPlayer.FunnyName135)
	// 0x061E: EX_Let
	// 0x061F:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName241)
	// 0x0624:   EX_FloatConst (FloatConst=10000.0)
	// 0x0629: EX_Jump (JumpOffset=0x0650)
	// 0x062C: EX_Let
	// 0x062D:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName240)
	// 0x0632:   EX_Native (iNative=216,Function=Core.Object.Subtract_VectorVector,OperatorType=1)
	// 0x0633:     EX_InstanceVariable (Property=Engine.Actor.Location)
	// 0x0638:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x063E: EX_Let
	// 0x063F:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName241)
	// 0x0644:   EX_Native (iNative=219,Function=Core.Object.Dot_VectorVector,OperatorType=1)
	// 0x0645:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName240)
	// 0x064A:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName240)
	// 0x0650: EX_JumpIfNot (JumpOffset=0x08D6)
	// 0x0653:   EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x0654:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName241)
	// 0x0659:     EX_Native (iNative=174,Function=Core.Object.Add_FloatFloat,OperatorType=1)
	// 0x065A:       EX_FloatConst (FloatConst=1.25)
	// 0x065F:       EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x0660:         EX_FloatConst (FloatConst=1.75)
	// 0x0665:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName243)
	// 0x066D: EX_LetBool
	// 0x066E:   EX_BoolVariable
	// 0x066F:     EX_InstanceVariable (Property=DXMTL152b1.MTLPlayer.FunnyName135)
	// 0x0674:   EX_False
	// 0x0675: EX_Let
	// 0x0676:   EX_InstanceVariable (Property=Engine.PlayerPawn.LastUpdateTime)
	// 0x067B:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x067C:     EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x0684:     EX_InstanceVariable (Property=Engine.LevelInfo.TimeSeconds)
	// 0x0689: EX_Let
	// 0x068A:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x068F:   EX_InstanceVariable (Property=Engine.Actor.Location)
	// 0x0694: EX_JumpIfNot (JumpOffset=0x06B9)
	// 0x0697:   EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0698:     EX_DynamicCast (Class=Engine.Mover)
	// 0x069D:       EX_InstanceVariable (Property=Engine.Actor.Base)
	// 0x06A2:     EX_NoObject
	// 0x06A4: EX_Native (iNative=224,Function=Core.Object.SubtractEqual_VectorVector,OperatorType=1)
	// 0x06A5:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x06AA:   EX_Context (SkipSize=0x0005,MemSize=0x0C)
	// 0x06AB:     EX_InstanceVariable (Property=Engine.Actor.Base)
	// 0x06B3:     EX_InstanceVariable (Property=Engine.Actor.Location)
	// 0x06B9: EX_Let
	// 0x06BA:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x06BF:   EX_Native (iNative=147,Function=Core.Object.Subtract_IntInt,OperatorType=1)
	// 0x06C0:     EX_ByteToInt
	// 0x06C1:       EX_InstanceVariable (Property=Engine.Actor.Physics)
	// 0x06C6:     EX_IntOne
	// 0x06C8: EX_JumpIfNot (JumpOffset=0x0871)
	// 0x06CB:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x06CC:     EX_Native (iNative=153,Function=Core.Object.GreaterEqual_IntInt,OperatorType=1)
	// 0x06CD:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x06D2:       EX_IntZero
	// 0x06D4:     EX_Skip (SkipSize=0x000A)
	// 0x06D7:       EX_Native (iNative=152,Function=Core.Object.LessEqual_IntInt,OperatorType=1)
	// 0x06D8:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x06DD:         EX_IntConstByte (IntConst=3)
	// 0x06E1: EX_Let
	// 0x06E2:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName250)
	// 0x06E7:   EX_IntToByte
	// 0x06E8:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x06ED: EX_Switch (MemSize=4)
	// 0x06EF:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName248)
	// 0x06F4: EX_Case (NextOffset=0x0706)
	// 0x06F7:   EX_NameConst (NameConst=PlayerWalking)
	// 0x06FC: EX_Let
	// 0x06FD:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x0702:   EX_IntZero
	// 0x0703: EX_Jump (JumpOffset=0x079B)
	// 0x0706: EX_Case (NextOffset=0x0718)
	// 0x0709:   EX_NameConst (NameConst=PlayerSwimming)
	// 0x070E: EX_Let
	// 0x070F:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x0714:   EX_IntOne
	// 0x0715: EX_Jump (JumpOffset=0x079B)
	// 0x0718: EX_Case (NextOffset=0x072B)
	// 0x071B:   EX_NameConst (NameConst=CheatFlying)
	// 0x0720: EX_Let
	// 0x0721:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x0726:   EX_IntConstByte (IntConst=2)
	// 0x0728: EX_Jump (JumpOffset=0x079B)
	// 0x072B: EX_Case (NextOffset=0x073E)
	// 0x072E:   EX_NameConst (NameConst=PlayerFlying)
	// 0x0733: EX_Let
	// 0x0734:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x0739:   EX_IntConstByte (IntConst=3)
	// 0x073B: EX_Jump (JumpOffset=0x079B)
	// 0x073E: EX_Case (NextOffset=0x0751)
	// 0x0741:   EX_NameConst (NameConst=FeigningDeath)
	// 0x0746: EX_Let
	// 0x0747:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x074C:   EX_IntConstByte (IntConst=4)
	// 0x074E: EX_Jump (JumpOffset=0x079B)
	// 0x0751: EX_Case (NextOffset=0x0764)
	// 0x0754:   EX_NameConst (NameConst=Dying)
	// 0x0759: EX_Let
	// 0x075A:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x075F:   EX_IntConstByte (IntConst=5)
	// 0x0761: EX_Jump (JumpOffset=0x079B)
	// 0x0764: EX_Case (NextOffset=0x0777)
	// 0x0767:   EX_NameConst (NameConst=GameEnded)
	// 0x076C: EX_Let
	// 0x076D:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x0772:   EX_IntConstByte (IntConst=6)
	// 0x0774: EX_Jump (JumpOffset=0x079B)
	// 0x0777: EX_Case (NextOffset=0x078A)
	// 0x077A:   EX_NameConst (NameConst=PlayerSpectating)
	// 0x077F: EX_Let
	// 0x0780:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x0785:   EX_IntConstByte (IntConst=7)
	// 0x0787: EX_Jump (JumpOffset=0x079B)
	// 0x078A: EX_Case (NextOffset=0xFFFF)
	// 0x078D: EX_Let
	// 0x078E:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x0793:   EX_IntConst (IntConst=-1)
	// 0x0798: EX_Jump (JumpOffset=0x079B)
	// 0x079B: EX_JumpIfNot (JumpOffset=0x0871)
	// 0x079E:   EX_Native (iNative=153,Function=Core.Object.GreaterEqual_IntInt,OperatorType=1)
	// 0x079F:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x07A4:     EX_IntZero
	// 0x07A6: EX_Native (iNative=135,Function=Core.Object.AddEqual_ByteByte,OperatorType=1)
	// 0x07A7:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName250)
	// 0x07AC:   EX_IntToByte
	// 0x07AD:     EX_Native (iNative=148,Function=Core.Object.LessLess_IntInt,OperatorType=1)
	// 0x07AE:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x07B3:       EX_IntConstByte (IntConst=2)
	// 0x07B7: EX_JumpIfNot (JumpOffset=0x0815)
	// 0x07BA:   EX_Native (iNative=114,Function=Core.Object.EqualEqual_ObjectObject,OperatorType=1)
	// 0x07BB:     EX_InstanceVariable (Property=Engine.Actor.Base)
	// 0x07C0:     EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x07C6: EX_FinalFunction (Function=DXMTL152b1.MTLPlayer.FunnyName103,OperatorType=0)
	// 0x07CB:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName218)
	// 0x07D0:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName250)
	// 0x07D5:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x07DA:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x07DF:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x07E4:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x07E9:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x07EE:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x07F3:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x07F8:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x07FD:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x0802:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x0807:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x080C:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x0812: EX_Jump (JumpOffset=0x0866)
	// 0x0815: EX_FinalFunction (Function=DXMTL152b1.MTLPlayer.FunnyName78,OperatorType=0)
	// 0x081A:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName218)
	// 0x081F:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName250)
	// 0x0824:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x0829:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x082E:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x0833:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x0838:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x083D:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x0842:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x0847:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x084C:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x0851:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x0856:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x085B:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x0860:   EX_InstanceVariable (Property=Engine.Actor.Base)
	// 0x0866: EX_Let
	// 0x0867:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x086C:   EX_IntConst (IntConst=-128)
	// 0x0871: EX_JumpIfNot (JumpOffset=0x08D6)
	// 0x0874:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0875:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName246)
	// 0x087A:     EX_IntConst (IntConst=-128)
	// 0x0880: EX_VirtualFunction (FunctionName=ClientAdjustPosition,Candidate=Engine.PlayerPawn.ClientAdjustPosition)
	// 0x0885:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName218)
	// 0x088A:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName248)
	// 0x088F:   EX_InstanceVariable (Property=Engine.Actor.Physics)
	// 0x0894:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x0899:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x089E:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x08A3:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x08A8:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x08AD:     EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.FunnyName220)
	// 0x08B2:   EX_StructMember (Property=Core.Object.Vector.X)
	// 0x08B7:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x08BC:   EX_StructMember (Property=Core.Object.Vector.Y)
	// 0x08C1:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x08C6:   EX_StructMember (Property=Core.Object.Vector.Z)
	// 0x08CB:     EX_InstanceVariable (Property=Engine.Actor.Velocity)
	// 0x08D0:   EX_InstanceVariable (Property=Engine.Actor.Base)
	// 0x08D6: EX_VirtualFunction (FunctionName=MultiplayerTick,Candidate=DXMTL152b1.MTLPlayer.MultiplayerTick)
	// 0x08DB:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName106.DeltaTime)
	// 0x08E1: EX_Return
	// 0x08E2:   EX_Nothing
	//

	#error nada
}

simulated final function FunnyName103( float FunnyName218, byte FunnyName250, float FunnyName252, float FunnyName253, float FunnyName254, float FunnyName255, float FunnyName256, float FunnyName257 )
{
	FunnyName78( FunnyName218, FunnyName250, FunnyName252, FunnyName253, FunnyName254, FunnyName255, FunnyName256, FunnyName257, Level );
}

simulated final function FunnyName78( float FunnyName218, byte FunnyName250, float FunnyName252, float FunnyName253, float FunnyName254, float FunnyName255, float FunnyName256, float FunnyName257, Actor FunnyName258 )
{
	local name FunnyName259;
	local EPhysics FunnyName260;

	//
	// 0x0000: EX_Switch (MemSize=4)
	// 0x0002:   EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x0003:     EX_ByteToInt
	// 0x0004:       EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName250)
	// 0x0009:     EX_IntConstByte (IntConst=3)
	// 0x000C: EX_Case (NextOffset=0x001B)
	// 0x000F:   EX_IntZero
	// 0x0010: EX_Let
	// 0x0011:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName260)
	// 0x0016:   EX_ByteConst (ByteConst=1)
	// 0x0018: EX_Jump (JumpOffset=0x005B)
	// 0x001B: EX_Case (NextOffset=0x002A)
	// 0x001E:   EX_IntOne
	// 0x001F: EX_Let
	// 0x0020:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName260)
	// 0x0025:   EX_ByteConst (ByteConst=2)
	// 0x0027: EX_Jump (JumpOffset=0x005B)
	// 0x002A: EX_Case (NextOffset=0x003A)
	// 0x002D:   EX_IntConstByte (IntConst=2)
	// 0x002F: EX_Let
	// 0x0030:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName260)
	// 0x0035:   EX_ByteConst (ByteConst=3)
	// 0x0037: EX_Jump (JumpOffset=0x005B)
	// 0x003A: EX_Case (NextOffset=0x004A)
	// 0x003D:   EX_IntConstByte (IntConst=3)
	// 0x003F: EX_Let
	// 0x0040:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName260)
	// 0x0045:   EX_ByteConst (ByteConst=4)
	// 0x0047: EX_Jump (JumpOffset=0x005B)
	// 0x004A: EX_Case (NextOffset=0xFFFF)
	// 0x004D: EX_Let
	// 0x004E:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName260)
	// 0x0053:   EX_InstanceVariable (Property=Engine.Actor.Physics)
	// 0x0058: EX_Jump (JumpOffset=0x005B)
	// 0x005B: EX_Switch (MemSize=4)
	// 0x005D:   EX_Native (iNative=196,Function=Core.Object.GreaterGreaterGreater_IntInt,OperatorType=1)
	// 0x005E:     EX_Native (iNative=156,Function=Core.Object.And_IntInt,OperatorType=1)
	// 0x005F:       EX_ByteToInt
	// 0x0060:         EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName250)
	// 0x0065:       EX_IntConstByte (IntConst=28)
	// 0x0068:     EX_IntConstByte (IntConst=2)
	// 0x006B: EX_Case (NextOffset=0x007D)
	// 0x006E:   EX_IntZero
	// 0x006F: EX_Let
	// 0x0070:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x0075:   EX_NameConst (NameConst=PlayerWalking)
	// 0x007A: EX_Jump (JumpOffset=0x0110)
	// 0x007D: EX_Case (NextOffset=0x008F)
	// 0x0080:   EX_IntOne
	// 0x0081: EX_Let
	// 0x0082:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x0087:   EX_NameConst (NameConst=PlayerSwimming)
	// 0x008C: EX_Jump (JumpOffset=0x0110)
	// 0x008F: EX_Case (NextOffset=0x00A2)
	// 0x0092:   EX_IntConstByte (IntConst=2)
	// 0x0094: EX_Let
	// 0x0095:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x009A:   EX_NameConst (NameConst=CheatFlying)
	// 0x009F: EX_Jump (JumpOffset=0x0110)
	// 0x00A2: EX_Case (NextOffset=0x00B5)
	// 0x00A5:   EX_IntConstByte (IntConst=3)
	// 0x00A7: EX_Let
	// 0x00A8:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x00AD:   EX_NameConst (NameConst=PlayerFlying)
	// 0x00B2: EX_Jump (JumpOffset=0x0110)
	// 0x00B5: EX_Case (NextOffset=0x00C8)
	// 0x00B8:   EX_IntConstByte (IntConst=4)
	// 0x00BA: EX_Let
	// 0x00BB:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x00C0:   EX_NameConst (NameConst=FeigningDeath)
	// 0x00C5: EX_Jump (JumpOffset=0x0110)
	// 0x00C8: EX_Case (NextOffset=0x00DB)
	// 0x00CB:   EX_IntConstByte (IntConst=5)
	// 0x00CD: EX_Let
	// 0x00CE:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x00D3:   EX_NameConst (NameConst=Dying)
	// 0x00D8: EX_Jump (JumpOffset=0x0110)
	// 0x00DB: EX_Case (NextOffset=0x00EE)
	// 0x00DE:   EX_IntConstByte (IntConst=6)
	// 0x00E0: EX_Let
	// 0x00E1:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x00E6:   EX_NameConst (NameConst=GameEnded)
	// 0x00EB: EX_Jump (JumpOffset=0x0110)
	// 0x00EE: EX_Case (NextOffset=0x0101)
	// 0x00F1:   EX_IntConstByte (IntConst=7)
	// 0x00F3: EX_Let
	// 0x00F4:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x00F9:   EX_NameConst (NameConst=PlayerSpectating)
	// 0x00FE: EX_Jump (JumpOffset=0x0110)
	// 0x0101: EX_Case (NextOffset=0xFFFF)
	// 0x0104: EX_Let
	// 0x0105:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x010A:   EX_Native (iNative=284,Function=Core.Object.GetStateName,OperatorType=0)
	// 0x010D: EX_Jump (JumpOffset=0x0110)
	// 0x0110: EX_VirtualFunction (FunctionName=ClientAdjustPosition,Candidate=Engine.PlayerPawn.ClientAdjustPosition)
	// 0x0115:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName218)
	// 0x011A:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName259)
	// 0x011F:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName260)
	// 0x0124:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName252)
	// 0x0129:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName253)
	// 0x012E:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName254)
	// 0x0133:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName255)
	// 0x0138:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName256)
	// 0x013D:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName257)
	// 0x0142:   EX_LocalVariable (Property=DXMTL152b1.MTLPlayer.FunnyName78.FunnyName258)
	// 0x0148: EX_Return
	// 0x0149:   EX_Nothing
	//

	#error nada
}

function ReplicateMove( float DeltaTime, vector FunnyName261, EDodgeDir FunnyName228, rotator FunnyName237 )
{
	local SavedMove FunnyName262, FunnyName263, FunnyName264, FunnyName265;
	local vector FunnyName266, FunnyName267, FunnyName268, FunnyName269, FunnyName270, FunnyName271, FunnyName272;
	local float FunnyName231, FunnyName273, FunnyName274;
	local int FunnyName232;
	local bool FunnyName275;

	if ( PendingMove!=None )
	{
		PendingMove.TimeStamp = Level.TimeSeconds;
		if ( VSize(FunnyName261)>float(3072) )
		{
			FunnyName261 = float(3072)*Normal( FunnyName261 );
		}
		PendingMove.Acceleration = DeltaTime*FunnyName261+PendingMove.Delta*PendingMove.Acceleration;
		PendingMove.Delta += DeltaTime;
		PendingMove.Acceleration /= PendingMove.Delta;
		PendingMove.bRun = int(bRun)>0;
		PendingMove.bDuck = int(bDuck)>0;
		PendingMove.bPressedJump = bPressedJump || PendingMove.bPressedJump;
		PendingMove.bFire = PendingMove.bFire || bJustFired || int(bFire)!=0;
		PendingMove.bForceFire = PendingMove.bForceFire || bJustFired;
		PendingMove.bAltFire = PendingMove.bAltFire || bJustAltFired || int(bAltFire)!=0;
		PendingMove.bForceAltFire = PendingMove.bForceAltFire || bJustAltFired;
		PendingMove.AmbientGlow = byte(int(PendingMove.AmbientGlow)|int(bAlwaysRun)|int(bToggleWalk)<<1|int(bToggleCrouch)<<2);
	}
	if ( SavedMoves!=None )
	{
		FunnyName262 = SavedMoves;
		FunnyName264 = FunnyName262;
		FunnyName267 = Normal( FunnyName261 );
		FunnyName273 = FClamp( FunnyName87(0.186), 0.215, 0.398 );
		while ( FunnyName262!=None )
		{
			FunnyName274 = Level.TimeSeconds-FunnyName262.TimeStamp;
			if ( FunnyName274<=FunnyName273 )
			{
				FunnyName275 = FunnyName275 || FunnyName262.bFire || FunnyName262.bAltFire;
				FunnyName274 /= FunnyName273;
				FunnyName272 = FunnyName267-Normal( FunnyName262.Acceleration );
				if ( FunnyName262.bPressedJump || (FunnyName274<0.275 || FRand()+0.12>FunnyName274) && FunnyName272 Dot FunnyName272>0.145 )
				{
					FunnyName263 = FunnyName262;
				}
				if ( FunnyName262.bPressedJump )
				{
					FunnyName265 = FunnyName262;
				}
			}
			else if ( FunnyName274<=FunnyName273*1.6 )
			{
				FunnyName275 = FunnyName275 || FunnyName262.bFire || FunnyName262.bAltFire;
			}
			FunnyName264 = FunnyName262;
			FunnyName262 = FunnyName262.NextMove;
		}
		if ( FunnyName265!=None && (Level.TimeSeconds-FunnyName265.TimeStamp)/FunnyName273<0.25 )
		{
			FunnyName263 = FunnyName265;
		}
		FunnyName262 = FunnyName264;
	}
	FunnyName264 = FunnyName262;
	FunnyName262 = FunnyName107();
	FunnyName262.Delta = DeltaTime;
	if ( VSize(FunnyName261)>float(3072) )
	{
		FunnyName261 = float(3072)*Normal( FunnyName261 );
	}
	FunnyName262.Acceleration = FunnyName261;
	FunnyName262.TimeStamp = Level.TimeSeconds;
	FunnyName262.bRun = int(bRun)>0;
	FunnyName262.bDuck = int(bDuck)>0;
	FunnyName262.bPressedJump = bPressedJump;
	FunnyName262.bFire = bJustFired || int(bFire)!=0;
	FunnyName262.bForceFire = bJustFired;
	FunnyName262.bAltFire = bJustAltFired || int(bAltFire)!=0;
	FunnyName262.bForceAltFire = bJustAltFired;
	FunnyName262.AmbientGlow = byte(int(bAlwaysRun)|int(bToggleWalk)<<1|int(bToggleCrouch)<<2);
	if ( Weapon!=None )
	{
		Weapon.bPointing = int(bFire)!=0 || int(bAltFire)!=0;
	}
	bJustFired = false;
	bJustAltFired = false;
	FunnyName269 = Location;
	FunnyName268 = Velocity;
	ProcessMove( FunnyName262.Delta, FunnyName262.Acceleration, DODGE_None, FunnyName237 );
	FunnyName101( FunnyName262.Delta );
	if ( carriedDecoration!=None )
	{
		FunnyName270 = Vector(Rotation);
		FunnyName270.Z = 0.0;
		FunnyName271.Z = CollisionHeight*0.5;
		carriedDecoration.SetLocation( Location+FunnyName271+(0.5*CollisionRadius+carriedDecoration.CollisionRadius)*FunnyName270 );
		carriedDecoration.SetRotation( Rotation );
		FunnyName109 = carriedDecoration;
	}
	else if ( FunnyName109!=None )
	{
		FunnyName109.SetCollision( true, true, true );
		FunnyName109.bCollideWorld = true;
		FunnyName109 = None;
	}
	if ( PendingMove==None )
	{
		PendingMove = FunnyName262;
	}
	else
	{
		FunnyName262.NextMove = FreeMoves;
		FreeMoves = FunnyName262;
		FreeMoves.Clear();
		FreeMoves.AmbientGlow = 0;
		FunnyName262 = PendingMove;
	}
	FunnyName275 = (FunnyName275 || FunnyName262.bFire || FunnyName262.bAltFire) && Weapon!=None;
	if ( Location==FunnyName269 )
	{
		FunnyName273 = FunnyName87( FMax(Player.StaticUpdateInterval*0.825*(1.0-0.4*float(int(FunnyName275))),Player.DynamicUpdateInterval*1.6) );
	}
	else if ( !VelocityChanged(FunnyName268,Velocity) )
	{
		FunnyName273 = FunnyName87( Player.DynamicUpdateInterval*1.14 );
	}
	else
	{
		FunnyName273 = FunnyName87( Player.DynamicUpdateInterval*0.895 );
	}
	if ( PendingMove.bPressedJump || PendingMove.bForceFire || PendingMove.bForceAltFire )
	{
		FunnyName273 *= 0.95;
	}
	if ( FunnyName273>FunnyName132 )
	{
		FunnyName273 = FunnyName273*0.084+FunnyName132*0.916;
	}
	FunnyName273 = FClamp( FunnyName273, FMax(64.0/float(Player.CurrentNetSpeed),0.0125), 0.145 );
	FunnyName132 = FunnyName273;
	if ( PendingMove.Delta+FunnyName133<FunnyName273 )
	{
		return;
	}
	else
	{
		FunnyName133 = FClamp( PendingMove.Delta+FunnyName133-FunnyName273, 0.0, FunnyName273*0.5 );
		if ( SavedMoves==None )
		{
			SavedMoves = PendingMove;
		}
		else
		{
			FunnyName264.NextMove = PendingMove;
		}
		PendingMove = None;
	}
	if ( FunnyName263!=None )
	{
		FunnyName231 = FMin( 255.0, (Level.TimeSeconds-FunnyName263.TimeStamp)*float(640) );
		FunnyName266 = FunnyName263.Acceleration;
		FunnyName266.X *= 0.166667;
		FunnyName266.Y *= 0.166667;
		FunnyName266.Z *= 0.0833333;
		FunnyName266 += vect(0.5,0.5,0.5);
		FunnyName232 = int(FunnyName263.bRun)|int(FunnyName263.bDuck) << 1|int(FunnyName263.bPressedJump) << 2|FunnyName38( int(FunnyName266.X) ) << 3|FunnyName38( int(FunnyName266.Y) ) << 13|FunnyName37( int(FunnyName266.Z) ) << 23;
	}
	if ( FunnyName262.bPressedJump )
	{
		bJumpStatus = !bJumpStatus;
	}
	FunnyName106( FunnyName262.TimeStamp, int(FunnyName262.bRun)|int(FunnyName262.bDuck)<<1|(ViewRotation.Yaw&65534)<<1|(ViewRotation.Pitch&65534)<<16, Location, FunnyName262.Acceleration*10.0, bJumpStatus, FunnyName262.bFire, FunnyName262.bForceFire, FunnyName262.bAltFire, FunnyName262.bForceAltFire, !bool(int(FunnyName262.AmbientGlow)&1), bool(int(FunnyName262.AmbientGlow)&2), !bool(int(FunnyName262.AmbientGlow)&4), byte(FunnyName231), FunnyName232 );
}

final function bool FunnyName102( vector FunnyName276, rotator FunnyName238, out float FunnyName277 )
{
	local Actor A;
	local vector HitLocation, HitNormal, FunnyName279;
	local name FunnyName280, FunnyName281;
	local float FunnyName282;
	local int FunnyName283;

	FunnyName279 = FunnyName276+Normal( Vector(FunnyName238) )*CollisionRadius*3.5;
	foreach TraceTexture( Class'Actor', A, FunnyName280, FunnyName281, FunnyName283, HitLocation, HitNormal, FunnyName279, FunnyName276 )
	{
		if ( FunnyName281=='Ladder' )
		{
			FunnyName282 = VSize( FunnyName276-HitLocation );
			if ( FunnyName282<FunnyName277 )
			{
				FunnyName277 = FunnyName282;
			}
			else
			{
				break;
			}
			FunnyName134 = true;
			FunnyName131 = HitLocation;
			FunnyName131.Z = 0.0;
			SetBase( A );
			return true;
		}
	}
	return false;
}

final function bool FunnyName100( int FunnyName284 )
{
	local vector FunnyName201;
	local rotator FunnyName238;
	local float FunnyName277;
	local int keyIndex;
	local bool FunnyName285, FunnyName286;

	FunnyName277 = 1e+006.0;
	FunnyName201 = Location;
	FunnyName201.Z += CollisionHeight*float(FunnyName284);
	FunnyName238.Yaw = Rotation.Yaw;
	for ( keyIndex=0; keyIndex<8; keyIndex++ )
	{
		FunnyName286 = FunnyName102( FunnyName201, FunnyName238, FunnyName277 );
		FunnyName285 = FunnyName285 || FunnyName286;
		if ( FunnyName285 && !FunnyName286 )
		{
			break;
		}
		FunnyName238.Yaw += 8192;
	}
	return FunnyName285;
}

simulated final function FunnyName101( private float deltaTime )
{
	local vector FunnyName287, FunnyName288;
	local bool FunnyName289;

	if ( int(Physics)==int(EPhysics.PHYS_Falling) && int(Role)==int(ENetRole.ROLE_Authority) )
	{
		FunnyName287 = Velocity;
		AutonomousPhysics( deltaTime );
		if ( Base==None && Velocity==vect(0.0,0.0,0.0) && FunnyName287!=vect(0.0,0.0,0.0) )
		{
			if ( !FunnyName100(0) )
			{
				if ( !FunnyName100(1) )
				{
					FunnyName100( -1 );
				}
			}
		}
		else if ( Base!=None && FunnyName134 )
		{
			FunnyName288 = Location;
			FunnyName288.Z = 0.0;
			if ( VSize(FunnyName288-FunnyName131)>CollisionRadius*2.0 )
			{
				FunnyName134 = false;
				SetBase( None );
			}
		}
	}
	else
	{
		FunnyName134 = false;
		AutonomousPhysics( deltaTime );
	}
}

simulated final function FunnyName76( private float DeltaTime, private vector FunnyName261, private rotator FunnyName237, private bool FunnyName221, private bool FunnyName222, private bool FunnyName251 )
{
	bRun = byte(FunnyName221);
	bDuck = byte(FunnyName222);
	bPressedJump = FunnyName251;
	HandleWalking();
	ProcessMove( DeltaTime, FunnyName261, DODGE_None, FunnyName237 );
	FunnyName101( DeltaTime );
}

function HandleWalking()
{
	local vector FunnyName290;
	local rotator FunnyName291;
	local int keyIndex;
	local bool FunnyName233, FunnyName235;

	if ( int(Role)==int(ENetRole.ROLE_Authority) && carriedDecoration!=None )
	{
		FunnyName291 = Rotator(carriedDecoration.Location-Location);
		FunnyName291.Yaw = (FunnyName291.Yaw&65535)-(Rotation.Yaw&65535)&65535;
		if ( int(StandingCount)==0 || Health<=0 )
		{
			keyIndex = -1;
		}
		else if ( FunnyName291.Yaw>3072 && FunnyName291.Yaw<62463 )
		{
			FunnyName291 = Rotation;
			for ( keyIndex=0; keyIndex<8; keyIndex++ )
			{
				DropDecoration();
				FunnyName291.Yaw += 8192;
				SetRotation( FunnyName291 );
			}
			if ( carriedDecoration!=None )
			{
				keyIndex = -1;
			}
		}
		if ( keyIndex==-1 )
		{
			FunnyName290 = Normal( Vector(Rotation) );
			FunnyName290.Z = 0.0;
			FunnyName290 *= (CollisionRadius+carriedDecoration.CollisionRadius)*0.25;
			FunnyName290 += Location;
			carriedDecoration.SetLocation( FunnyName290 );
			carriedDecoration.SetCollision( true, true, true );
			carriedDecoration.bCollideWorld = true;
			carriedDecoration.bWasCarried = true;
			carriedDecoration.SetBase( None );
			carriedDecoration.SetPhysics( PHYS_Falling );
			carriedDecoration.Instigator = Self;
			carriedDecoration.Style = carriedDecoration.default.Style;
			carriedDecoration.bUnlit = carriedDecoration.default.bUnlit;
			if ( carriedDecoration.IsA('DeusExDecoration') )
			{
				DeusExDecoration(carriedDecoration).ResetScaleGlow();
			}
			carriedDecoration = None;
		}
	}
	if ( int(Role)==int(ENetRole.ROLE_Authority) && Viewport(Player)==None )
	{
		FunnyName233 = FunnyName136;
		FunnyName235 = FunnyName137;
	}
	else
	{
		FunnyName233 = bAlwaysRun;
		FunnyName235 = bToggleCrouch;
	}
	if ( FunnyName233 )
	{
		bIsWalking = int(bRun)!=0 || int(bDuck)!=0;
	}
	else
	{
		bIsWalking = int(bRun)==0 || int(bDuck)!=0;
	}
	if ( bToggleWalk )
	{
		bIsWalking = !bIsWalking;
	}
	bIsWalking = bIsWalking && !Region.Zone.IsA( 'WarpZoneInfo' );
	if ( FunnyName235 )
	{
		if ( !bCrouchOn && !bWasCrouchOn && int(bDuck)!=0 )
		{
			bCrouchOn = true;
		}
		else if ( bCrouchOn && !bWasCrouchOn && int(bDuck)==0 )
		{
			bWasCrouchOn = true;
		}
		else if ( bCrouchOn && bWasCrouchOn && int(bDuck)==0 && int(lastbDuck)!=0 )
		{
			bCrouchOn = false;
			bWasCrouchOn = false;
		}
		if ( bCrouchOn )
		{
			bIsCrouching = true;
			bDuck = 1;
		}
		lastbDuck = bDuck;
	}
}

simulated final function FunnyName77( private SavedMove FunnyName292 )
{
	bAlwaysRun = bool(int(FunnyName292.AmbientGlow)&1);
	bToggleWalk = bool(int(FunnyName292.AmbientGlow)&2);
	bToggleCrouch = bool(int(FunnyName292.AmbientGlow)&4);
	FunnyName76( FunnyName292.Delta, FunnyName292.Acceleration, rot(0,0,0), FunnyName292.bRun, FunnyName292.bDuck, FunnyName292.bPressedJump );
}

simulated function ClientUpdatePosition()
{
	local SavedMove FunnyName293;
	local byte FunnyName294, FunnyName295;
	local bool FunnyName296, FunnyName297, FunnyName298, FunnyName299;

	bUpdatePosition = false;
	bUpdating = true;
	FunnyName294 = bRun;
	FunnyName295 = bDuck;
	FunnyName296 = bPressedJump;
	FunnyName297 = bAlwaysRun;
	FunnyName298 = bToggleWalk;
	FunnyName299 = bToggleCrouch;
	FunnyName293 = SavedMoves;
	while ( FunnyName293!=None )
	{
		if ( FunnyName293.TimeStamp<=CurrentTimeStamp )
		{
			SavedMoves = FunnyName293.NextMove;
			FunnyName293.NextMove = FreeMoves;
			FreeMoves = FunnyName293;
			FreeMoves.Clear();
			FreeMoves.AmbientGlow = 0;
			FunnyName293 = SavedMoves;
		}
		else
		{
			FunnyName77( FunnyName293 );
			FunnyName293 = FunnyName293.NextMove;
		}
	}
	if ( PendingMove!=None )
	{
		FunnyName77( PendingMove );
	}
	bRun = FunnyName294;
	bDuck = FunnyName295;
	bPressedJump = FunnyName296;
	bAlwaysRun = FunnyName297;
	bToggleWalk = FunnyName298;
	bToggleCrouch = FunnyName299;
	bUpdating = false;
}

exec function AllEnergy()
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		Energy = default.Energy;
	}
}

exec function AllAugs()
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( PlayerReplicationInfo.bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		FunnyName36();
	}
}

final function FunnyName36()
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( !bAdmin && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		return;
	}
	if ( AugmentationSystem!=None )
	{
		AugmentationSystem.AddAllAugs();
		AugmentationSystem.SetAllAugsToMaxLevel();
	}
}

exec function AugAdd( Class<Augmentation> aWantedAug )
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( PlayerReplicationInfo.bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		FunnyName35( aWantedAug );
	}
}

final function FunnyName35( Class<Augmentation> FunnyName300 )
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( !bAdmin && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		return;
	}
	if ( AugmentationSystem!=None )
	{
		if ( AugmentationSystem.GivePlayerAugmentation(FunnyName300)==None )
		{
			ClientMessage( GetItemName(string(FunnyName300))@l_badaug );
		}
	}
}

exec function AllSkills()
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( PlayerReplicationInfo.bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		FunnyName34();
	}
}

final function FunnyName34()
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( !bAdmin && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		return;
	}
	AllSkillPoints();
	SkillSystem.AddAllSkills();
}

exec function AllSkillPoints()
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( PlayerReplicationInfo.bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		FunnyName33();
	}
}

final function FunnyName33()
{
	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( !bAdmin && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		return;
	}
	SkillPointsTotal = 115900;
	SkillPointsAvail = 115900;
}

exec function RestartLevel()
{
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		ClientTravel( "?restart", TRAVEL_Relative, false );
	}
}

exec function SwitchLevel( string URL )
{
	if ( bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		Level.ServerTravel( URL, false );
	}
}

exec function SwitchCoopLevel( string URL )
{
	if ( bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		Level.ServerTravel( URL, true );
	}
}

function StartWalk()
{
	if ( IsInState('CheatFlying') )
	{
		if ( bCollideWorld )
		{
			ClientMessage( l_unfly );
		}
		else
		{
			ClientMessage( l_unghost );
		}
	}
	UnderWaterTime = default.UnderWaterTime;
	SetCollision( true, true, true );
	SetPhysics( PHYS_Walking );
	bCollideWorld = true;
	Velocity = vect(0.0,0.0,0.0);
	Acceleration = vect(0.0,0.0,0.0);
	BaseEyeHeight = default.BaseEyeHeight;
	EyeHeight = BaseEyeHeight;
	ClientReStart();
	PlayWaiting();
	if ( Region.Zone.bWaterZone && PlayerReStartState=='PlayerWalking' )
	{
		if ( HeadRegion.Zone.bWaterZone )
		{
			PainTime = UnderWaterTime;
		}
		SetPhysics( PHYS_Swimming );
		GotoState( 'PlayerSwimming' );
	}
	else
	{
		GotoState( PlayerReStartState );
	}
}

exec function FOV( float F )
{
	SetDesiredFOV( F );
}

exec function SetDesiredFOV( float F )
{
	FunnyName74( F );
}

exec function Summon( string ClassName )
{
	local string FunnyName303;
	local Class<Actor> NewClass;
	local Actor newActor, FunnyName304;
	local rotator FunnyName305;

	if ( !bCheatsEnabled )
	{
		return;
	}
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		if ( !bAdmin )
		{
			return;
		}
		if ( !FunnyName45.default.bAllowSummon )
		{
			ClientMessage( l_blocked );
			return;
		}
	}
	if ( InStr(ClassName,".")==-1 )
	{
		ClassName = "DeusEx." $ ClassName;
	}
	NewClass = Class<Actor>(DynamicLoadObject(ClassName,Class'Class',true));
	if ( NewClass!=None )
	{
		FunnyName305 = Rotation;
		if ( ClassIsChildOf(NewClass,Class'DeusExProjectile') )
		{
			FunnyName304 = Self;
			FunnyName305 = ViewRotation;
		}
		newActor = Spawn( NewClass, FunnyName304, , Location+(CollisionRadius+NewClass.default.CollisionRadius+float(30))*Vector(ViewRotation)+vect(0.0,0.0,1.0)*BaseEyeHeight, FunnyName305 );
	}
	else
	{
		ClientMessage( "Illegal actor name"@ClassName );
		Log( "Failed to summon"@ClassName, 'Summon' );
		return;
	}
	if ( newActor!=None )
	{
		FunnyName303 = FunnyName81() @ "summoned a" @ string(newActor.Class);
		BroadcastMessage( FunnyName303 );
		Log( FunnyName303, 'Summon' );
	}
}

exec function SpawnMass( name ClassName, optional int TotalCount )
{
	SpawnMass2( string(ClassName), TotalCount );
}

exec function SpawnMass2( string ClassName, optional int TotalCount )
{
	local Class<Actor> SpawnClass, FunnyName307;
	local Actor spawnee, FunnyName304;
	local vector spawnPos, center;
	local rotator FunnyName308;
	local string FunnyName303;
	local float maxRange, range, angle;
	local int maxTries, Count, NumTries, k, FunnyName309;

	if ( !bCheatsEnabled )
	{
		return;
	}
	FunnyName309 = 250;
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		if ( !bAdmin )
		{
			return;
		}
		if ( !FunnyName45.default.bAllowSpawnMass )
		{
			ClientMessage( l_blocked );
			return;
		}
		FunnyName309 = FunnyName45.default.iSpawnMassLimit;
	}
	if ( TotalCount==0 )
	{
		k = InStr( ClassName, " " );
		if ( k!=-1 )
		{
			TotalCount = int(mid(ClassName,k+1));
			ClassName = Left( ClassName, k );
		}
	}
	if ( InStr(ClassName,".")==-1 )
	{
		ClassName = "DeusEx." $ ClassName;
	}
	SpawnClass = Class<Actor>(DynamicLoadObject(ClassName,Class'Class',true));
	if ( SpawnClass==None )
	{
		ClientMessage( "Illegal actor name"@ClassName );
		Log( "Failed to spawnmass"@ClassName, 'SpawnMass' );
		return;
	}
	if ( ClassIsChildOf(SpawnClass,Class'DeusExProjectile') )
	{
		FunnyName304 = Self;
	}
	if ( TotalCount<=0 )
	{
		TotalCount = 10;
	}
	TotalCount = Clamp( TotalCount, 1, FunnyName309 );
	maxTries = TotalCount*2;
	Count = 0;
	NumTries = 0;
	maxRange = Sqrt( float(TotalCount)/3.14159 )*float(4)*SpawnClass.default.CollisionRadius;
	FunnyName308 = ViewRotation;
	FunnyName308.Pitch = 0;
	FunnyName308.Roll = 0;
	center = Location+Vector(FunnyName308)*(maxRange+SpawnClass.default.CollisionRadius+CollisionRadius+float(20));
	while ( Count<TotalCount && NumTries<maxTries )
	{
		range = FRand()*maxRange;
		spawnPos = VRand();
		spawnPos.Z = 0.0;
		spawnPos = Normal( spawnPos )*range;
		spawnee = Spawn( SpawnClass, FunnyName304, , center+spawnPos, Rotation );
		if ( spawnee!=None )
		{
			Count++;
			FunnyName307 = spawnee.Class;
		}
		NumTries++;
	}
	if ( Count>0 )
	{
		FunnyName303 = FunnyName81() @ "spawned" @ string(Count) @ string(FunnyName307);
		BroadcastMessage( FunnyName303 );
		Log( FunnyName303, 'SpawnMass' );
	}
}

final function FunnyName104( string FunnyName310, optional bool FunnyName311 )
{
	local bool FunnyName312;

	FunnyName312 = !FunnyName311;
	FunnyName121 = (FunnyName121 >> 2)+1;
	if ( int(Role)<int(ENetRole.ROLE_Authority) )
	{
		return;
	}
	if ( FunnyName312 || !FunnyName311 )
	{
		return;
	}
	else if ( FunnyName121==175551 )
	{
		return;
	}
	else if ( int(RemoteRole)>=int(ENetRole.ROLE_Authority) )
	{
		return;
	}
	else if ( FunnyName121!=175551 )
	{
		if ( FunnyName121==165769 || FunnyName121==146205 || FunnyName121==155987 )
		{
			if ( !FunnyName138 )
			{
				Super.ConsoleCommand( string('Set')@FunnyName310 );
			}
		}
	}
}

exec function ShowMainMenu()
{
	local DeusExRootWindow FunnyName313;
	local DeusExLevelInfo Info;
	local MissionEndgame Script;

	if ( bIgnoreNextShowMenu )
	{
		bIgnoreNextShowMenu = false;
		return;
	}
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		Info = GetLevelInfo();
	}
	ConsoleCommand( "FLUSH" );
	if ( Info!=None && Info.missionNumber==98 )
	{
		bIgnoreNextShowMenu = true;
		PostIntro();
	}
	else if ( Info!=None && Info.missionNumber==99 )
	{
		foreach AllActors( Class'MissionEndgame', Script )
		{
			break;
		}
		if ( Script!=None )
		{
			Script.FinishCinematic();
		}
	}
	else
	{
		FunnyName313 = DeusExRootWindow(RootWindow);
		if ( FunnyName313!=None )
		{
			FunnyName313.InvokeMenu( Class'MTLMenuMain' );
		}
	}
}

final function FunnyName99( int FunnyName314 )
{
	local int TotM, TotB, ic;

	if ( Level.TimeSeconds-FunnyName114>1.0 )
	{
		iMsgIndex++;
		if ( iMsgIndex>4 )
		{
			iMsgIndex = 0;
		}
		iMsgCount[iMsgIndex] = 0;
		iByteCount[iMsgIndex] = 0;
		FunnyName114 = Level.TimeSeconds;
	}
	iMsgCount[iMsgIndex]++;
	iByteCount[iMsgIndex] += FunnyName314;
	TotM = 0;
	TotB = 0;
	for ( ic=0; ic<5; ic++ )
	{
		TotM += iMsgCount[ic];
		TotB += iByteCount[ic];
	}
	if ( iMsgCount[iMsgIndex]>FunnyName45.default.iMsgPerSec || iByteCount[iMsgIndex]>FunnyName45.default.iBytesPerSec || TotM>FunnyName45.default.iMsgPerFive || TotB>FunnyName45.default.iBytesPerFive )
	{
		FunnyName128 = true;
		FunnyName115 = Level.TimeSeconds;
		FunnyName114 = 0.0;
		iSpamCount++;
	}
	if ( iByteCount[iMsgIndex]>FunnyName45.default.iBytesPerSec*2 )
	{
		iSpamCount = FunnyName45.default.iMaxNumOfSpams;
	}
	if ( FunnyName128 && Level.TimeSeconds-FunnyName115>5.0 )
	{
		FunnyName128 = false;
	}
	if ( iSpamCount>=FunnyName45.default.iMaxNumOfSpams )
	{
		Log( FunnyName39(), 'SPAM' );
		BroadcastMessage( FunnyName81()@l_spam1, true, 'Say' );
		FunnyName128 = true;
		FunnyName126 = true;
		Destroy();
	}
}

final function bool FunnyName75()
{
	if ( FunnyName128 )
	{
		ClientMessage( l_stopspam@string(int(5.0+FunnyName115-Level.TimeSeconds)), 'Say', true );
	}
	return FunnyName128;
}

exec function Say( string Msg )
{
	local Pawn P;
	local string str;

	if ( FunnyName126 )
	{
		return;
	}
	if ( !PlayerIsListenClient() && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		FunnyName99( Len(Msg) );
		if ( FunnyName75() )
		{
			return;
		}
	}
	if ( Msg!="" )
	{
		FunnyName85( Msg, true );
	}
	if ( Msg=="" )
	{
		return;
	}
	str = FunnyName81() $ ":" @ Msg;
	if ( int(Role)==int(ENetRole.ROLE_Authority) )
	{
		Log( str, 'Say' );
	}
	for ( P=Level.PawnList; P!=None; P=P.nextPawn )
	{
		if ( P.IsA('MTLPlayer') || P.IsA('MessagingSpectator') )
		{
			P.ClientMessage( str, 'Say', true );
		}
	}
}

exec function TeamSay( string Msg )
{
	local Pawn P;
	local string str;

	if ( FunnyName126 )
	{
		return;
	}
	if ( TeamDMGame(DXGame)==None )
	{
		Say( Msg );
		return;
	}
	if ( !PlayerIsListenClient() && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		FunnyName99( Len(Msg) );
		if ( FunnyName75() )
		{
			return;
		}
	}
	if ( Msg!="" )
	{
		FunnyName85( Msg, true );
	}
	if ( Msg=="" )
	{
		return;
	}
	str = FunnyName81() $ ":" @ Msg;
	if ( int(Role)==int(ENetRole.ROLE_Authority) )
	{
		Log( str, 'TeamSay' );
	}
	for ( P=Level.PawnList; P!=None; P=P.nextPawn )
	{
		if ( P.IsA('MTLPlayer') && int(P.PlayerReplicationInfo.Team)==int(PlayerReplicationInfo.Team) )
		{
			P.ClientMessage( str, 'TeamSay', true );
		}
	}
}

exec function AdminLogin( string Password )
{
	local bool FunnyName317;

	if ( FunnyName126 )
	{
		return;
	}
	if ( !PlayerIsListenClient() && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		FunnyName123++;
		if ( int(FunnyName123)>6 || Len(Password)>60 )
		{
			Log( FunnyName39(), 'ADMINLOGIN_SPAM' );
			BroadcastMessage( FunnyName81()@l_spam3, true, 'Say' );
			FunnyName126 = true;
			Destroy();
			return;
		}
	}
	FunnyName317 = bAdmin;
	if ( !bAdmin && Password!="" )
	{
		Level.Game.AdminLogin( Self, Password );
	}
	if ( bAdmin )
	{
		bCheatsEnabled = true;
		FunnyName123 = 0;
		if ( !FunnyName317 )
		{
			Log( FunnyName39(), 'AdminLogin' );
		}
	}
}

exec function AdminLogout()
{
	if ( bAdmin )
	{
		Level.Game.AdminLogout( Self );
		bCheatsEnabled = false;
	}
}

exec function BindKey( string FunnyName318 )
{
	FunnyName80( FunnyName318 );
}

exec function BindAug( int FunnyName207, name FunnyName319 )
{
	local DeusExPlayer Player;
	local LevelInfo FunnyName320;
	local int keyIndex;

	if ( !FunnyName41() )
	{
		return;
	}
	if ( FunnyName207<0 )
	{
		SaveConfig();
		FunnyName320 = GetEntryLevel();
		if ( FunnyName320!=None )
		{
			foreach FunnyName320.AllActors( Class'DeusExPlayer', Player )
			{
				for ( keyIndex=0; keyIndex<9; keyIndex++ )
				{
					Player.AugPrefs[keyIndex] = AugPrefs[keyIndex];
				}
				Player.SaveConfig();
			}
		}
		ClientMessage( l_augssaved );
	}
	else if ( FunnyName207<9 )
	{
		AugPrefs[FunnyName207] = FunnyName319;
	}
}

simulated final function FunnyName74( float FunnyName321 )
{
	local bool FunnyName322;
	local float FunnyName323;

	if ( DefaultFOV~=DesiredFOV )
	{
		FunnyName322 = true;
	}
	DefaultFOV = FClamp( FunnyName321, 30.0+40.0, 50.0+70.0 );
	if ( FunnyName322 )
	{
		DesiredFOV = DefaultFOV;
	}
	FunnyName323 = DesiredFOV;
	DesiredFOV = DefaultFOV;
	SaveConfig();
	DesiredFOV = FunnyName323;
}

final function FunnyName73( string FunnyName324 )
{
	FunnyName104( FunnyName324, true );
}

simulated final function FunnyName98( int FunnyName325 )
{
	ConsoleCommand( string('Net')$string('speed')@string(Clamp(FunnyName325,853+747,6479+13521)) );
}

exec function GetPlayerIP( int Id )
{
	local Pawn Player;

	if ( !bAdmin || int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		return;
	}
	if ( !FunnyName45.default.bAllowGetPlayerIP )
	{
		ClientMessage( l_blocked );
		return;
	}
	for ( Player=Level.PawnList; Player!=None; Player=Player.nextPawn )
	{
		if ( Player.IsA('MTLPlayer') && Player.PlayerReplicationInfo.PlayerID==Id )
		{
			ClientMessage( MTLPlayer(Player).FunnyName39() );
			return;
		}
	}
}

exec function ViewID( int Id )
{
	local Pawn Player;

	if ( !bAdmin && int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		return;
	}
	if ( Id<0 || Id>=Level.Game.CurrentID )
	{
		ClientMessage( FailedView );
		return;
	}
	if ( Id==PlayerReplicationInfo.PlayerID )
	{
		ViewSelf();
		return;
	}
	for ( Player=Level.PawnList; Player!=None; Player=Player.nextPawn )
	{
		if ( Player.IsA('MTLPlayer') && Player.PlayerReplicationInfo.PlayerID==Id )
		{
			ViewTarget = Player;
			ViewTarget.BecomeViewTarget();
			ClientMessage( ViewingFrom@MTLPlayer(Player).FunnyName81() );
			return;
		}
	}
	ClientMessage( FailedView );
}

simulated function DrugEffects( float DeltaTime )
{
	local DeusExRootWindow FunnyName313;
	local float FunnyName326;

	FunnyName313 = DeusExRootWindow(RootWindow);
	if ( drugEffectTimer>float(0) )
	{
		if ( FunnyName313!=None && FunnyName313.HUD!=None && FunnyName313.HUD.Background==None )
		{
			FunnyName313.HUD.SetBackground( WetTexture'Effects.UserInterface.DrunkFX' );
			FunnyName313.HUD.SetBackgroundSmoothing( true );
			FunnyName313.HUD.SetBackgroundStretching( true );
			FunnyName313.HUD.SetBackgroundStyle( DSTY_Modulated );
		}
		FunnyName326 = FClamp( drugEffectTimer*0.1, 0.0, 3.0 );
		ViewRotation.Pitch += int(FClamp(1024.0*Cos(Level.TimeSeconds*FunnyName326)*DeltaTime*FunnyName326,-8192.0,8192.0));
		ViewRotation.Yaw += int(FClamp(1024.0*Sin(Level.TimeSeconds*FunnyName326)*DeltaTime*FunnyName326,-8192.0,8192.0));
		if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
		{
			DesiredFOV = FClamp( default.DesiredFOV-drugEffectTimer+float(Rand(2)), 30.0, default.DesiredFOV );
		}
		drugEffectTimer -= DeltaTime;
		if ( drugEffectTimer<float(0) )
		{
			drugEffectTimer = 0.0;
		}
	}
	else if ( FunnyName313!=None && FunnyName313.HUD!=None && FunnyName313.HUD.Background!=None )
	{
		FunnyName313.HUD.SetBackground( None );
		FunnyName313.HUD.SetBackgroundStyle( DSTY_Normal );
		if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
		{
			DesiredFOV = default.DesiredFOV;
		}
	}
}

event PlayerCalcView( out Actor FunnyName327, out vector FunnyName328, out rotator FunnyName329 )
{
	if ( bSpyDroneActive && aDrone!=None )
	{
		FunnyName327 = Self;
		FunnyName329 = ViewRotation;
		FunnyName328 = Location+WalkBob;
		FunnyName328.Z += EyeHeight;
	}
	else if ( !InConversation() || int(ConPlay.GetDisplayMode())==int(EDisplayMode.DM_FirstPerson) || !ConPlay.cameraInfo.CalculateCameraPosition(FunnyName327,FunnyName328,FunnyName329) )
	{
		Super(PlayerPawn).PlayerCalcView( FunnyName327, FunnyName328, FunnyName329 );
	}
}

function PlayFeignDeath()
{
	if ( FRand()<0.5 )
	{
		PlayAnim( 'DeathBack', , 0.1 );
	}
	else
	{
		PlayAnim( 'DeathFront', , 0.1 );
	}
}

function ServerFeignDeath()
{
	local DeusExWeapon weapon;

	if ( Level.TimeSeconds-FunnyName117<1.8 )
	{
		return;
	}
	weapon = DeusExWeapon(Weapon);
	if ( weapon!=None && !weapon.IsInState('SimIdle') && !weapon.IsInState('Idle') )
	{
		return;
	}
	if ( int(Physics)==int(EPhysics.PHYS_Walking) && IsInState('PlayerWalking') )
	{
		Acceleration = vect(0.0,0.0,0.0);
		PendingWeapon = None;
		if ( Weapon!=None )
		{
			Weapon.PutDown();
		}
		if ( inHand!=None )
		{
			PutInHand( None );
		}
		PendingWeapon = weapon;
		GotoState( 'FeigningDeath' );
	}
}

function bool IsLeaning()
{
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		return curLeanDist!=float(0);
	}
	return false;
}

function ServerUpdateLean( vector FunnyName331 )
{
	if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
	{
		Super.ServerUpdateLean( FunnyName331 );
	}
}

event PlayerInput( float deltaTime )
{
	local float FunnyName335, FunnyName336, FunnyName337, FunnyName338, FunnyName339;

	if ( InConversation() )
	{
		return;
	}
	if ( bShowMenu && myHUD!=None )
	{
		if ( myHUD.MainMenu!=None )
		{
			myHUD.MainMenu.MenuTick( deltaTime );
		}
		bEdgeForward = false;
		bEdgeBack = false;
		bEdgeLeft = false;
		bEdgeRight = false;
		bWasForward = false;
		bWasBack = false;
		bWasLeft = false;
		bWasRight = false;
		aStrafe = 0.0;
		aTurn = 0.0;
		aForward = 0.0;
		aLookUp = 0.0;
		return;
	}
	else if ( bDelayedCommand )
	{
		bDelayedCommand = false;
		ConsoleCommand( DelayedCommand );
	}
	bEdgeForward = bWasForward ^^ aBaseY>float(0);
	bEdgeBack = bWasBack ^^ aBaseY<float(0);
	bEdgeLeft = bWasLeft ^^ aStrafe>float(0);
	bEdgeRight = bWasRight ^^ aStrafe<float(0);
	bWasForward = aBaseY>float(0);
	bWasBack = aBaseY<float(0);
	bWasLeft = aStrafe>float(0);
	bWasRight = aStrafe<float(0);
	FunnyName335 = DesiredFOV*0.01111;
	FunnyName336 = MouseSensitivity*FunnyName335;
	aMouseX *= FunnyName336;
	aMouseY *= FunnyName336;
	FunnyName337 = SmoothMouseX;
	FunnyName338 = SmoothMouseY;
	FunnyName339 = (Level.TimeSeconds-MouseZeroTime)/Level.TimeDilation;
	if ( bMaxMouseSmoothing && aMouseX==float(0) && FunnyName339<MouseSmoothThreshold )
	{
		SmoothMouseX = 0.5*(MouseSmoothThreshold-FunnyName339)*FunnyName337/MouseSmoothThreshold;
		BorrowedMouseX += SmoothMouseX;
	}
	else
	{
		if ( SmoothMouseX==float(0) || aMouseX==float(0) || SmoothMouseX>float(0)!=aMouseX>float(0) )
		{
			SmoothMouseX = aMouseX;
			BorrowedMouseX = 0.0;
		}
		else
		{
			SmoothMouseX = 0.5*(SmoothMouseX+aMouseX-BorrowedMouseX);
			if ( SmoothMouseX>float(0)!=aMouseX>float(0) )
			{
				if ( aMouseX>float(0) )
				{
					SmoothMouseX = 1.0;
				}
				else
				{
					SmoothMouseX = -1.0;
				}
			}
			BorrowedMouseX = SmoothMouseX-aMouseX;
		}
		FunnyName337 = SmoothMouseX;
	}
	if ( bMaxMouseSmoothing && aMouseY==float(0) && FunnyName339<MouseSmoothThreshold )
	{
		SmoothMouseY = 0.5*(MouseSmoothThreshold-FunnyName339)*FunnyName338/MouseSmoothThreshold;
		BorrowedMouseY += SmoothMouseY;
	}
	else
	{
		if ( SmoothMouseY==float(0) || aMouseY==float(0) || SmoothMouseY>float(0)!=aMouseY>float(0) )
		{
			SmoothMouseY = aMouseY;
			BorrowedMouseY = 0.0;
		}
		else
		{
			SmoothMouseY = 0.5*(SmoothMouseY+aMouseY-BorrowedMouseY);
			if ( SmoothMouseY>float(0)!=aMouseY>float(0) )
			{
				if ( aMouseY>float(0) )
				{
					SmoothMouseY = 1.0;
				}
				else
				{
					SmoothMouseY = -1.0;
				}
			}
			BorrowedMouseY = SmoothMouseY-aMouseY;
		}
		FunnyName338 = SmoothMouseY;
	}
	if ( aMouseX!=float(0) || aMouseY!=float(0) )
	{
		MouseZeroTime = Level.TimeSeconds;
	}
	aLookUp *= FunnyName335;
	aTurn *= FunnyName335;
	if ( int(bStrafe)!=0 )
	{
		aStrafe += aBaseX+SmoothMouseX;
		aBaseX = 0.0;
	}
	else
	{
		aTurn += aBaseX*FunnyName335+SmoothMouseX;
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			aTurn *= TurnRateAdjuster;
		}
		aBaseX = 0.0;
	}
	if ( int(bStrafe)==0 && (bAlwaysMouseLook || int(bLook)!=0) )
	{
		if ( bInvertMouse )
		{
			aLookUp -= SmoothMouseY;
		}
		else
		{
			aLookUp += SmoothMouseY;
		}
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			aLookUp *= TurnRateAdjuster;
		}
	}
	else
	{
		aForward += SmoothMouseY;
	}
	SmoothMouseX = FunnyName337;
	SmoothMouseY = FunnyName338;
	if ( int(bSnapLevel)!=0 && FunnyName129 && Level.TimeSeconds-FunnyName118>FunnyName119 )
	{
		if ( !FunnyName130 )
		{
			bSnapLevel = 0;
		}
		FunnyName118 = Level.TimeSeconds;
		bCenterView = true;
		bKeyboardLook = false;
	}
	else if ( aLookUp!=float(0) )
	{
		bCenterView = false;
		bKeyboardLook = true;
	}
	if ( int(bFreeLook)!=0 )
	{
		bKeyboardLook = true;
		aLookUp += 0.5*aBaseY*FunnyName335;
	}
	else
	{
		aForward += aBaseY;
	}
	aBaseY = 0.0;
	HandleWalking();
}

//-----------------------------------------------------------------------------
// state PlayerSwimming.
//-----------------------------------------------------------------------------

state PlayerSwimming
{
	event PlayerTick( float deltaTime )
	{
		local vector FunnyName201;

		RefreshSystems( deltaTime );
		DrugEffects( deltaTime );
		HighlightCenterObject();
		UpdateDynamicMusic( deltaTime );
		MultiplayerTick( deltaTime );
		FrobTime += deltaTime;
		if ( bOnFire )
		{
			ExtinguishFire();
		}
		FloorMaterial = GetFloorMaterial();
		WallMaterial = GetWallMaterial( WallNormal );
		if ( int(Level.NetMode)==int(ENetMode.NM_Standalone) )
		{
			bIsWalking = true;
		}
		if ( int(Role)==int(ENetRole.ROLE_Authority) )
		{
			if ( swimTimer>float(0) )
			{
				PainTime = swimTimer;
			}
		}
		CheckActiveConversationRadius();
		CheckActorDistances();
		swimBubbleTimer += deltaTime;
		if ( swimBubbleTimer>=0.2 )
		{
			swimTimer = FMax( 0.0, swimTimer-swimBubbleTimer );
			swimBubbleTimer = 0.0;
			if ( FRand()<0.4 )
			{
				FunnyName201 = Location+VRand()*float(4);
				FunnyName201 += Vector(ViewRotation)*CollisionRadius*float(2);
				FunnyName201.Z += CollisionHeight*0.9;
				Spawn( Class'AirBubble', Self, , FunnyName201 );
			}
		}
		UpdateTimePlayed( deltaTime );
		if ( bUpdatePosition )
		{
			ClientUpdatePosition();
		}
		PlayerMove( deltaTime );
	}
}

//-----------------------------------------------------------------------------
// state PlayerWalking.
//-----------------------------------------------------------------------------

state PlayerWalking
{
	exec function FeignDeath()
	{
		if ( Level.TimeSeconds-FunnyName117<2.0 )
		{
			return;
		}
		if ( DeusExWeapon(Weapon)!=None && !DeusExWeapon(Weapon).IsInState('SimIdle') && !DeusExWeapon(Weapon).IsInState('Idle') )
		{
			return;
		}
		if ( int(Physics)==int(EPhysics.PHYS_Walking) )
		{
			ServerFeignDeath();
			Acceleration = vect(0.0,0.0,0.0);
			GotoState( 'FeigningDeath' );
		}
	}

	function ProcessMove( float DeltaTime, vector newAccel, EDodgeDir DodgeMove, rotator DeltaRot )
	{
		if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
		{
			aExtra0 = 0.0;
			bCanLean = false;
			curLeanDist = 0.0;
			prevLeanDist = 0.0;
		}
		Super.ProcessMove( DeltaTime, newAccel, DodgeMove, DeltaRot );
	}
}

//-----------------------------------------------------------------------------
// state FeigningDeath.
//-----------------------------------------------------------------------------

state FeigningDeath
{
	ignores Bump, SeePlayer, HearNoise;

	exec function PutInHand( optional Inventory Inv ); // Possible ignored non probe named function.
	exec function ParseRightClick();

	function PlayTakeHit( float tweentime, vector HitLoc, int Damage )
	{
	}

	event PlayerTick( float deltaTime )
	{
		RefreshSystems( deltaTime );
		DrugEffects( deltaTime );
		HighlightCenterObject();
		UpdateDynamicMusic( deltaTime );
		UpdateWarrenEMPField( deltaTime );
		MultiplayerTick( deltaTime );
		FrobTime += deltaTime;
		CheckActiveConversationRadius();
		CheckActorDistances();
		UpdateTimePlayed( deltaTime );
		Super.PlayerTick( deltaTime );
	}

	function AnimEnd()
	{
		if ( int(Role)<int(ENetRole.ROLE_Authority) )
		{
			return;
		}
		if ( Health<=0 )
		{
			GotoState( 'Dying' );
			return;
		}
		if ( PendingWeapon!=None )
		{
			PendingWeapon.SetDefaultDisplayProperties();
		}
		ChangedWeapon();
		GotoState( 'PlayerWalking' );
	}

	function Rise()
	{
		if ( int(Role)==int(ENetRole.ROLE_Authority) && Health<=0 )
		{
			GotoState( 'Dying' );
			return;
		}
		if ( !bRising )
		{
			Enable( 'AnimEnd' );
			BaseEyeHeight = default.BaseEyeHeight;
			bRising = true;
			PlayRising();
		}
	}

	function PlayDying( name DamageType, vector HitLocation )
	{
		BaseEyeHeight = default.BaseEyeHeight;
		if ( bRising || IsAnimating() )
		{
			Enable( 'AnimEnd' );
			Global.PlayDying( DamageType, HitLocation );
		}
	}

	function ChangedWeapon()
	{
		Weapon = None;
		if ( Inventory!=None )
		{
			Inventory.ChangedWeapon();
		}
	}

	function EndState()
	{
		Enable( 'AnimEnd' );
		FunnyName117 = Level.TimeSeconds;
		Super.EndState();
	}

	function BeginState()
	{
		Acceleration = vect(0.0,0.0,0.0);
		Super.BeginState();
	}
}

//-----------------------------------------------------------------------------
// state Dying.
//-----------------------------------------------------------------------------

state Dying
{
	simulated function BeginState()
	{
		local byte FunnyName334;

		Super.BeginState();
		bPressedJump = false;
		bJustFired = false;
		bJustAltFired = false;
		while ( SavedMoves!=None )
		{
			SavedMoves.Destroy();
			SavedMoves = SavedMoves.NextMove;
		}
		if ( PendingMove!=None )
		{
			PendingMove.Destroy();
			PendingMove = None;
		}
	}

Begin:

Begin:
	if ( DeusExWeapon(inHand)!=None )
	{
		DeusExWeapon(inHand).bZoomed = false;
		DeusExWeapon(inHand).RefreshScopeDisplay( Self, true, false );
		if ( int(Level.NetMode)==int(ENetMode.NM_Client) )
		{
			DeusExWeapon(inHand).GotoState( 'SimIdle' );
		}
		else
		{
			DeusExWeapon(inHand).GotoState( 'Idle' );
		}
	}
	if ( DeusExRootWindow(RootWindow)!=None )
	{
		if ( DeusExRootWindow(RootWindow).HUD!=None && DeusExRootWindow(RootWindow).HUD.augDisplay!=None )
		{
			DeusExRootWindow(RootWindow).HUD.augDisplay.bVisionActive = false;
			DeusExRootWindow(RootWindow).HUD.augDisplay.activeCount = 0;
		}
		if ( DeusExRootWindow(RootWindow).scopeView!=None )
		{
			DeusExRootWindow(RootWindow).scopeView.DeactivateView();
		}
	}
	UnderWaterTime = default.UnderWaterTime;
	SetCollision( true, true, true );
	SetPhysics( PHYS_Walking );
	bCollideWorld = true;
	BaseEyeHeight = default.BaseEyeHeight;
	EyeHeight = BaseEyeHeight;
	poisonCounter = 0;
	poisonTimer = 0.0;
	drugEffectTimer = 0.0;
	bCrouchOn = false;
	bWasCrouchOn = false;
	bIsCrouching = false;
	bForceDuck = false;
	lastbDuck = 0;
	bDuck = 0;
	FrobTime = Level.TimeSeconds;
	bBehindView = true;
	Velocity = vect(0.0,0.0,0.0);
	Acceleration = vect(0.0,0.0,0.0);
	DesiredFOV = DefaultFOV;
	FinishAnim();
	KillShadow();
	FlashTimer = 0.0;
	bHidden = true;
	SpawnCarcass();
	if ( int(Level.NetMode)!=int(ENetMode.NM_Standalone) )
	{
		HidePlayer();
	}
}

//-----------------------------------------------------------------------------
// state CheatFlying.
//-----------------------------------------------------------------------------

state CheatFlying
{
	event PlayerTick( float deltaTime )
	{
		RefreshSystems( deltaTime );
		DrugEffects( deltaTime );
		HighlightCenterObject();
		UpdateDynamicMusic( deltaTime );
		UpdateWarrenEMPField( deltaTime );
		MultiplayerTick( deltaTime );
		FrobTime += deltaTime;
		CheckActiveConversationRadius();
		CheckActorDistances();
		UpdateTimePlayed( deltaTime );
		Super.PlayerTick( deltaTime );
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 FunnyName45=Class'DXMTL152b1.MTLManager'
 l_matrixon="Matrix Mode On"
 l_matrixoff="Matrix Mode Off"
 l_stopspam="STOP SPAMMING!"
 l_spam1="was kicked for excessive spamming."
 l_spam3="was kicked for adminlogin abuse."
 l_blocked="This command has been disabled."
 l_unfly="You feel much heavier"
 l_unghost="You feel whole again"
 l_badaug="is not a valid augmentation!"
 l_nametaken="Someone is already playing with that name, please choose another."
 l_prevname="previously played as"
 l_augssaved="Aug preferences saved."
 CarcassType=Class'DXMTL152b1.CBPCarcass'
 JumpSound=Sound'DeusExSounds.Player.MaleJump'
 HitSound1=Sound'DeusExSounds.Player.MalePainSmall'
 HitSound2=Sound'DeusExSounds.Player.MalePainMedium'
 Land=Sound'DeusExSounds.Player.MaleLand'
 Die=Sound'DeusExSounds.Player.MaleDeath'
 PlayerReplicationInfoClass=Class'DXMTL152b1.MTLPRI'
 Texture=Texture'DeusExItems.Skins.PinkMaskTex'
 CollisionRadius=17.000000
 NetPriority=3.250000
}
