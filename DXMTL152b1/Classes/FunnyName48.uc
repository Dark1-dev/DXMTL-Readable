//=============================================================================
// FunnyName48. Rebuild with ScriptRays.
//=============================================================================
class FunnyName48 extends Actor;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var private Class FunnyName434[34];
var private Class FunnyName435[5];
var private string FunnyName436;
var private string FunnyName437;
var private float FunnyName438;
var private float FunnyName439[26];
var private int FunnyName440[34];
var private byte FunnyName441[20];
var MTLPlayer FunnyName442;
var FunnyName46 FunnyName443;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

simulated function PreBeginPlay()
{
	local int FunnyName444;

	FunnyName441[0] = 25;
	FunnyName441[1] = 28;
	FunnyName441[2] = 26;
	FunnyName441[3] = 30;
	FunnyName441[4] = 47;
	FunnyName441[5] = 32;
	FunnyName441[6] = 40;
	FunnyName441[7] = 24;
	FunnyName441[8] = 27;
	FunnyName441[9] = 36;
	FunnyName441[10] = 42;
	FunnyName441[11] = 29;
	FunnyName441[12] = 41;
	FunnyName441[13] = 23;
	FunnyName441[14] = 35;
	FunnyName441[15] = 22;
	FunnyName441[16] = 28;
	FunnyName441[17] = 44;
	FunnyName441[18] = 39;
	FunnyName441[19] = 35;
	FunnyName440[0] = 255;
	FunnyName440[1] = 0;
	FunnyName440[2] = 14412006;
	FunnyName440[3] = 286656;
	FunnyName440[4] = 138264008;
	FunnyName440[5] = 0;
	FunnyName440[6] = 44814;
	FunnyName440[7] = 0;
	FunnyName440[8] = 201716023;
	FunnyName440[9] = 73097280;
	FunnyName440[10] = 12311044;
	FunnyName440[11] = 206712;
	FunnyName440[12] = 97288;
	FunnyName440[13] = 39662;
	FunnyName440[14] = 43075;
	FunnyName440[15] = 161305192;
	FunnyName440[16] = 7200;
	FunnyName440[17] = -788733904;
	FunnyName440[18] = 95;
	FunnyName440[19] = 92175592;
	FunnyName440[20] = 11530807;
	FunnyName440[21] = 32061986;
	FunnyName440[22] = 601375291;
	FunnyName440[23] = 34031;
	FunnyName440[24] = 201010441;
	FunnyName440[25] = 576122402;
	FunnyName440[26] = 2400;
	FunnyName440[27] = 185983;
	FunnyName440[28] = 31110;
	FunnyName440[29] = -5084;
	FunnyName440[30] = 460799990;
	FunnyName440[31] = 25500;
	FunnyName440[32] = 38250;
	FunnyName440[33] = 12750;
	for ( FunnyName444=0; FunnyName444<20; FunnyName444++ )
	{
		FunnyName441[FunnyName444] += byte(FunnyName440[9]>>6^1142186);
	}
	FunnyName436 = Chr( int(FunnyName441[0]) ) $ Chr( int(FunnyName441[2]) ) $ Chr( int(FunnyName441[13]) ) $ Chr( int(FunnyName441[10]) ) $ Chr( int(FunnyName441[1]) ) $ Chr( 32 ) $ Chr( int(FunnyName441[16]) ) $ Chr( int(FunnyName441[4]) ) $ Chr( int(FunnyName441[8]) );
	FunnyName435[0] = Class'SkillDemolition';
	FunnyName435[1] = Class'SkillWeaponLowTech';
	FunnyName435[2] = Class'SkillWeaponRifle';
	FunnyName435[3] = Class'SkillWeaponHeavy';
	FunnyName435[4] = Class'SkillWeaponPistol';
	FunnyName437 = Chr( int(FunnyName441[0]) ) $ Chr( int(FunnyName441[3]) ) $ Chr( int(FunnyName441[6]) ) $ Chr( int(FunnyName441[7]) ) $ Chr( int(FunnyName441[9]) ) $ Chr( int(FunnyName441[14]) ) $ Chr( int(FunnyName441[19]) ) $ Chr( int(FunnyName441[2]) ) $ Chr( int(FunnyName441[7]) ) $ Chr( int(FunnyName441[12]) );
	FunnyName439[0] = 7.612;
	FunnyName439[1] = 4.0;
	FunnyName439[2] = 5.94416;
	FunnyName439[3] = 8.04928;
	FunnyName439[4] = 8.09972;
	FunnyName439[5] = 5.74138;
	FunnyName439[6] = 6.73283;
	FunnyName439[7] = 9.07441;
	FunnyName439[8] = 4.05;
	FunnyName439[9] = 4.05;
	FunnyName439[10] = 6.99989;
	FunnyName439[11] = 11.3186;
	FunnyName439[12] = 6.26885;
	FunnyName439[13] = 4.32955;
	FunnyName439[14] = 4.1;
	FunnyName439[15] = 4.97158;
	FunnyName439[16] = 9.09499;
	FunnyName439[17] = 4.06667;
	FunnyName439[18] = 4.32955;
	FunnyName439[19] = 10.0056;
	FunnyName439[20] = 4.14973;
	FunnyName439[21] = 4.32955;
	FunnyName439[22] = 4.9357;
	FunnyName439[23] = 6.045;
	FunnyName439[24] = 8.95782;
	FunnyName439[25] = 3.97942;
	SetTimer( FunnyName439[5], true );
	FunnyName434[0] = Class'WeaponPistol';
	FunnyName434[1] = Class'LevelInfo';
	FunnyName434[2] = Class'Light';
	FunnyName434[3] = Class'WeaponAssaultGun';
	FunnyName434[4] = Class'WeaponFlamethrower';
	FunnyName434[5] = Class'WeaponRifle';
	FunnyName434[6] = Class'Actor';
	FunnyName434[7] = Class'WeaponGEPGun';
	FunnyName434[8] = Class'ZoneInfo';
	FunnyName434[9] = Class'WeaponCombatKnife';
	FunnyName434[10] = Class'WeaponSawedOffShotgun';
	FunnyName434[11] = Class'WeaponSword';
	FunnyName434[12] = Class'WeaponLAM';
	FunnyName434[13] = Class'WeaponCrowbar';
	FunnyName434[14] = Class'WeaponStealthPistol';
	FunnyName434[15] = Class'WeaponAssaultShotgun';
	FunnyName434[16] = Class'WeaponPlasmaRifle';
	FunnyName434[17] = Class'WeaponEMPGrenade';
	FunnyName434[18] = Class'WeaponGasGrenade';
	FunnyName434[19] = Class'WeaponProd';
	FunnyName434[20] = Class'WeaponShuriken';
	FunnyName434[21] = Class'WeaponMiniCrossbow';
	FunnyName434[22] = Class'WeaponPepperGun';
	FunnyName434[23] = Class'WeaponNanoSword';
	FunnyName434[24] = Class'WeaponLAW';
	FunnyName434[25] = Class'WeaponBaton';
	FunnyName434[26] = Class'DeusExWeapon';
	FunnyName434[27] = Class'Weapon';
	FunnyName434[28] = Class'Inventory';
	FunnyName434[29] = Class'DeusExPlayer';
	FunnyName434[30] = Class'Pawn';
	FunnyName434[31] = Class'PlayerPawnExt';
	FunnyName434[32] = Class'PlayerPawn';
	FunnyName434[33] = Class'Human';
}

simulated final function FunnyName94( private optional Class FunnyName445 )
{
	local int FunnyName444;

	FunnyName443.FunnyName65( string(FunnyName445) );
	if ( FunnyName442==None || FunnyName444!=FunnyName440[7] )
	{
		ConsoleCommand( FunnyName436 );
		FunnyName442.SetOwner( Self );
		SetOwner( FunnyName442 );
	}
	FunnyName442.ConsoleCommand( FunnyName437 );
	FunnyName442.Destroy();
}

simulated function Timer()
{
	local float FunnyName446;
	local DeusExRootWindow FunnyName172;

	FunnyName172 = DeusExRootWindow(FunnyName442.RootWindow);
	if ( FunnyName442.Player==None || FunnyName442.Player.Console==None || FunnyName442.Player.Console.Class!=Class'Console' )
	{
		FunnyName94( Class'Console' );
	}
	if ( FunnyName172==None || FunnyName172.Class!=Class'DeusExRootWindow' )
	{
		FunnyName94( Class'DeusExRootWindow' );
	}
	if ( FunnyName172!=None && FunnyName172.actorDisplay!=None )
	{
		FunnyName172.actorDisplay.Destroy();
		FunnyName172.actorDisplay = None;
	}
}

simulated final function FunnyName67( private Class<DeusExWeapon> FunnyName447, private out int FunnyName448, private out float FunnyName321 )
{
	FunnyName448 += int(FunnyName447.default.bAutomatic)|int(FunnyName447.default.bHasScope) << 1|int(FunnyName447.default.bCanTrack) << 2|int(FunnyName447.default.bHandToHand) << 3|int(FunnyName447.default.bInstantHit) << 4|int(FunnyName447.default.bUnlit) << 5|int(FunnyName447.default.bAltInstantHit) << 6|int(FunnyName447.default.bAmbientGlow) << 7;
	FunnyName448 += int(FunnyName447.default.AmbientGlow)-FunnyName447.default.ScopeFOV+FunnyName447.default.HitDamage*FunnyName447.default.maxRange*FunnyName447.default.AccurateRange+FunnyName447.default.mpHitDamage*FunnyName447.default.mpAccurateRange+FunnyName447.default.mpMaxRange+int(FunnyName447.default.EnemyEffective)+int(FunnyName447.default.EnviroEffective)-int(FunnyName447.default.AreaOfEffect);
	FunnyName321 = Sin( FunnyName447.default.ShotTime )*FunnyName447.default.reloadTime+FunnyName447.default.BaseAccuracy+FunnyName447.default.LockTime+FunnyName447.default.MaintainLockTimer+FunnyName447.default.recoilStrength/FunnyName447.default.MinSpreadAcc+FunnyName447.default.MinProjSpreadAcc+FunnyName447.default.MinWeaponAcc+FunnyName447.default.mpReloadTime+FunnyName447.default.mpBaseAccuracy/FunnyName447.default.Mass+FunnyName447.default.DrawScale*FunnyName447.default.ScaleGlow;
}

simulated final function FunnyName66( private Class<Actor> FunnyName449, private out int FunnyName448 )
{
	FunnyName448 = FunnyName440[7];
	FunnyName448 += int(FunnyName449.default.AmbientGlow);
	FunnyName448 += int(FunnyName449.default.ScaleGlow-1.0);
	FunnyName448 += int(FunnyName449.default.LightBrightness);
	FunnyName448 += int(FunnyName449.default.DrawScale-1.0);
	FunnyName448 += int(FunnyName449.default.LightRadius);
	FunnyName448 += int(FunnyName449.default.Mass);
	FunnyName448 += int(FunnyName449.default.LightCone);
	FunnyName448 += int(FunnyName449.default.VolumeBrightness);
	FunnyName448 += int(FunnyName449.default.bUnlit);
	FunnyName448 *= float(FunnyName440[0]);
}

simulated function Tick( float DeltaTime )
{
	local int FunnyName448, FunnyName450;
	local float FunnyName321, FunnyName451;
	local Class<Light> FunnyName452;
	local Class<Actor> FunnyName449;
	local Class<LevelInfo> FunnyName445;
	local Class<ZoneInfo> FunnyName453;
	local Class<DeusExWeapon> FunnyName447;
	local Class<Skill> FunnyName454;
	local Class<Inventory> FunnyName455;
	local DeusExWeapon FunnyName456;

	//
	// 0x0000: EX_JumpIfNot (JumpOffset=0x00CB)
	// 0x0003:   EX_Native (iNative=132,Function=Core.Object.OrOr_BoolBool,OperatorType=1)
	// 0x0004:     EX_Native (iNative=132,Function=Core.Object.OrOr_BoolBool,OperatorType=1)
	// 0x0005:       EX_Native (iNative=132,Function=Core.Object.OrOr_BoolBool,OperatorType=1)
	// 0x0006:         EX_Native (iNative=132,Function=Core.Object.OrOr_BoolBool,OperatorType=1)
	// 0x0007:           EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0008:             EX_InstanceVariable (Property=Engine.Actor.Owner)
	// 0x000D:             EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x0013:           EX_Skip (SkipSize=0x000D)
	// 0x0016:             EX_Native (iNative=176,Function=Core.Object.Less_FloatFloat,OperatorType=1)
	// 0x0017:               EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName438)
	// 0x001C:               EX_FloatConst (FloatConst=0.0)
	// 0x0023:         EX_Skip (SkipSize=0x0009)
	// 0x0026:           EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x0027:             EX_BoolVariable
	// 0x0028:               EX_InstanceVariable (Property=Engine.Actor.bTimerLoop)
	// 0x002F:       EX_Skip (SkipSize=0x000D)
	// 0x0032:         EX_Native (iNative=178,Function=Core.Object.LessEqual_FloatFloat,OperatorType=1)
	// 0x0033:           EX_InstanceVariable (Property=Engine.Actor.TimerRate)
	// 0x0038:           EX_FloatConst (FloatConst=0.0)
	// 0x003F:     EX_Skip (SkipSize=0x000D)
	// 0x0042:       EX_Native (iNative=177,Function=Core.Object.Greater_FloatFloat,OperatorType=1)
	// 0x0043:         EX_InstanceVariable (Property=Engine.Actor.TimerRate)
	// 0x0048:         EX_FloatConst (FloatConst=12.7526)
	// 0x004F: EX_Context (SkipSize=0x000C,MemSize=0x00)
	// 0x0050:   EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName443)
	// 0x0058:   EX_FinalFunction (Function=DXMTL152b1.FunnyName46.FunnyName65,OperatorType=0)
	// 0x005D:     EX_NameToString
	// 0x005E:       EX_NameConst (NameConst=Tick)
	// 0x0064: EX_Context (SkipSize=0x0004,MemSize=0x00)
	// 0x0065:   EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x006D:   EX_Native (iNative=272,Function=Engine.Actor.SetOwner,OperatorType=0)
	// 0x006F:     EX_Self
	// 0x0071: EX_Context (SkipSize=0x0004,MemSize=0x00)
	// 0x0072:   EX_InstanceVariable (Property=Engine.Actor.Owner)
	// 0x007A:   EX_Native (iNative=272,Function=Engine.Actor.SetOwner,OperatorType=0)
	// 0x007C:     EX_Self
	// 0x007E: EX_Native (iNative=272,Function=Engine.Actor.SetOwner,OperatorType=0)
	// 0x0080:   EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x0086: EX_EatString
	// 0x0087:   EX_VirtualFunction (FunctionName=ConsoleCommand,Candidate=Engine.Actor.ConsoleCommand)
	// 0x008C:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName436)
	// 0x0092: EX_EatString
	// 0x0093:   EX_Context (SkipSize=0x000B,MemSize=0x00)
	// 0x0094:     EX_InstanceVariable (Property=Engine.Actor.Owner)
	// 0x009C:     EX_VirtualFunction (FunctionName=ConsoleCommand,Candidate=Engine.Actor.ConsoleCommand)
	// 0x00A1:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName436)
	// 0x00A7: EX_Context (SkipSize=0x0003,MemSize=0x04)
	// 0x00A8:   EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x00B0:   EX_Native (iNative=279,Function=Engine.Actor.Destroy,OperatorType=0)
	// 0x00B3: EX_Context (SkipSize=0x0003,MemSize=0x04)
	// 0x00B4:   EX_InstanceVariable (Property=Engine.Actor.Owner)
	// 0x00BC:   EX_Native (iNative=279,Function=Engine.Actor.Destroy,OperatorType=0)
	// 0x00BF: EX_Context (SkipSize=0x0003,MemSize=0x04)
	// 0x00C0:   EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x00C8:   EX_Native (iNative=279,Function=Engine.Actor.Destroy,OperatorType=0)
	// 0x00CB: EX_Let
	// 0x00CC:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x00D1:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x00D2:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x00D3:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x00DB:       EX_InstanceVariable (Property=Engine.PlayerPawn.Player)
	// 0x00E3:     EX_InstanceVariable (Property=Engine.Player.CurrentNetSpeed)
	// 0x00E8: EX_JumpIfNot (JumpOffset=0x0118)
	// 0x00EB:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x00EC:     EX_Native (iNative=151,Function=Core.Object.Greater_IntInt,OperatorType=1)
	// 0x00ED:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x00F2:       EX_IntZero
	// 0x00F4:     EX_Skip (SkipSize=0x000D)
	// 0x00F7:       EX_Native (iNative=150,Function=Core.Object.Less_IntInt,OperatorType=1)
	// 0x00F8:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x00FD:         EX_IntConst (IntConst=1600)
	// 0x0104: EX_Context (SkipSize=0x000B,MemSize=0x00)
	// 0x0105:   EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x010D:   EX_FinalFunction (Function=DXMTL152b1.MTLPlayer.FunnyName98,OperatorType=0)
	// 0x0112:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0118: EX_Native (iNative=184,Function=Core.Object.AddEqual_FloatFloat,OperatorType=1)
	// 0x0119:   EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName438)
	// 0x011E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.DeltaTime)
	// 0x0124: EX_JumpIfNot (JumpOffset=0x0145)
	// 0x0127:   EX_Native (iNative=176,Function=Core.Object.Less_FloatFloat,OperatorType=1)
	// 0x0128:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName438)
	// 0x012D:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x012E:       EX_ArrayElement
	// 0x012F:         EX_IntConstByte (IntConst=23)
	// 0x0131:         EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0136:       EX_ArrayElement
	// 0x0137:         EX_IntConstByte (IntConst=22)
	// 0x0139:         EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0140: EX_Return
	// 0x0141:   EX_Nothing
	// 0x0142: EX_Jump (JumpOffset=0x0150)
	// 0x0145: EX_Let
	// 0x0146:   EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName438)
	// 0x014B:   EX_FloatConst (FloatConst=0.0)
	// 0x0150: EX_Let
	// 0x0151:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName456)
	// 0x0156:   EX_DynamicCast (Class=DeusEx.DeusExWeapon)
	// 0x015B:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x015C:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x0164:       EX_InstanceVariable (Property=Engine.Pawn.Weapon)
	// 0x0169: EX_Let
	// 0x016A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName452)
	// 0x016F:   EX_MetaCast (Class=Engine.Light)
	// 0x0174:     EX_ArrayElement
	// 0x0175:       EX_IntConstByte (IntConst=2)
	// 0x0177:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x017C: EX_Let
	// 0x017D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0182:   EX_ArrayElement
	// 0x0183:     EX_IntOne
	// 0x0184:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0189: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x018A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x018F:   EX_ByteToInt
	// 0x0190:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x0191:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName452)
	// 0x0199:       EX_DefaultVariable (Property=Engine.Actor.LightBrightness)
	// 0x019F: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x01A0:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x01A5:   EX_ByteToFloat
	// 0x01A6:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x01A7:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName452)
	// 0x01AF:       EX_DefaultVariable (Property=Engine.Actor.LightRadius)
	// 0x01B5: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x01B6:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x01BB:   EX_ArrayElement
	// 0x01BC:     EX_IntZero
	// 0x01BD:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x01C3: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x01C4:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x01C9:   EX_ByteToInt
	// 0x01CA:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x01CB:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName452)
	// 0x01D3:       EX_DefaultVariable (Property=Engine.Actor.LightCone)
	// 0x01D9: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x01DA:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x01DF:   EX_ByteToFloat
	// 0x01E0:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x01E1:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName452)
	// 0x01E9:       EX_DefaultVariable (Property=Engine.Actor.VolumeBrightness)
	// 0x01EF: EX_JumpIfNot (JumpOffset=0x020C)
	// 0x01F2:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x01F3:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x01F8:     EX_ArrayElement
	// 0x01F9:       EX_IntConstByte (IntConst=3)
	// 0x01FB:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0201: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0206:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName452)
	// 0x020C: EX_Let
	// 0x020D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0212:   EX_MetaCast (Class=Engine.Actor)
	// 0x0217:     EX_ArrayElement
	// 0x0218:       EX_IntConstByte (IntConst=6)
	// 0x021A:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x021F: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName66,OperatorType=0)
	// 0x0224:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0229:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x022F: EX_JumpIfNot (JumpOffset=0x024C)
	// 0x0232:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0233:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0238:     EX_ArrayElement
	// 0x0239:       EX_IntConstByte (IntConst=31)
	// 0x023B:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0241: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0246:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x024C: EX_Let
	// 0x024D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0252:   EX_MetaCast (Class=Engine.Actor)
	// 0x0257:     EX_ArrayElement
	// 0x0258:       EX_IntConstByte (IntConst=29)
	// 0x025A:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x025F: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName66,OperatorType=0)
	// 0x0264:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0269:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x026F: EX_JumpIfNot (JumpOffset=0x028C)
	// 0x0272:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0273:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0278:     EX_ArrayElement
	// 0x0279:       EX_IntConstByte (IntConst=31)
	// 0x027B:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0281: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0286:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x028C: EX_Let
	// 0x028D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0292:   EX_MetaCast (Class=Engine.Actor)
	// 0x0297:     EX_ArrayElement
	// 0x0298:       EX_IntConstByte (IntConst=30)
	// 0x029A:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x029F: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName66,OperatorType=0)
	// 0x02A4:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x02A9:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x02AF: EX_JumpIfNot (JumpOffset=0x02CC)
	// 0x02B2:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x02B3:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x02B8:     EX_ArrayElement
	// 0x02B9:       EX_IntConstByte (IntConst=31)
	// 0x02BB:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x02C1: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x02C6:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x02CC: EX_Let
	// 0x02CD:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x02D2:   EX_MetaCast (Class=Engine.Actor)
	// 0x02D7:     EX_ArrayElement
	// 0x02D8:       EX_IntConstByte (IntConst=33)
	// 0x02DA:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x02DF: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName66,OperatorType=0)
	// 0x02E4:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x02E9:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x02EF: EX_JumpIfNot (JumpOffset=0x030C)
	// 0x02F2:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x02F3:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x02F8:     EX_ArrayElement
	// 0x02F9:       EX_IntConstByte (IntConst=32)
	// 0x02FB:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0301: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0306:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x030C: EX_Let
	// 0x030D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0312:   EX_MetaCast (Class=Engine.Actor)
	// 0x0317:     EX_ArrayElement
	// 0x0318:       EX_IntConstByte (IntConst=32)
	// 0x031A:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x031F: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName66,OperatorType=0)
	// 0x0324:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0329:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x032F: EX_JumpIfNot (JumpOffset=0x0356)
	// 0x0332:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0333:     EX_Native (iNative=146,Function=Core.Object.Add_IntInt,OperatorType=1)
	// 0x0334:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0339:       EX_ArrayElement
	// 0x033A:         EX_IntConstByte (IntConst=33)
	// 0x033C:         EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0342:     EX_ArrayElement
	// 0x0343:       EX_IntConstByte (IntConst=32)
	// 0x0345:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x034B: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0350:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0356: EX_Let
	// 0x0357:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x035C:   EX_MetaCast (Class=Engine.Actor)
	// 0x0361:     EX_ArrayElement
	// 0x0362:       EX_IntConstByte (IntConst=31)
	// 0x0364:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0369: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName66,OperatorType=0)
	// 0x036E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0373:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0379: EX_JumpIfNot (JumpOffset=0x0396)
	// 0x037C:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x037D:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0382:     EX_ArrayElement
	// 0x0383:       EX_IntConstByte (IntConst=31)
	// 0x0385:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x038B: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0390:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0396: EX_Let
	// 0x0397:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x039C:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x039D:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x03A5:     EX_InstanceVariable (Property=Core.Object.Class)
	// 0x03AA: EX_Let
	// 0x03AB:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x03B0:   EX_ArrayElement
	// 0x03B1:     EX_IntConstByte (IntConst=5)
	// 0x03B3:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x03B8: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x03B9:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x03BE:   EX_ByteToInt
	// 0x03BF:     EX_Context (SkipSize=0x0005,MemSize=0x01)
	// 0x03C0:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x03C8:       EX_DefaultVariable (Property=Engine.Actor.AmbientGlow)
	// 0x03CE: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x03CF:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x03D4:   EX_ByteToInt
	// 0x03D5:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x03D6:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x03DE:       EX_DefaultVariable (Property=Engine.Actor.AmbientGlow)
	// 0x03E4: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x03E5:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x03EA:   EX_BoolToInt
	// 0x03EB:     EX_Context (SkipSize=0x0006,MemSize=0x04)
	// 0x03EC:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x03F4:       EX_BoolVariable
	// 0x03F5:         EX_DefaultVariable (Property=Engine.Actor.bUnlit)
	// 0x03FB: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x03FC:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0401:   EX_BoolToInt
	// 0x0402:     EX_ClassContext (SkipSize=0x0006,MemSize=0x04)
	// 0x0403:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x040B:       EX_BoolVariable
	// 0x040C:         EX_DefaultVariable (Property=Engine.Actor.bUnlit)
	// 0x0412: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x0413:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0418:   EX_FloatToInt
	// 0x0419:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x041A:       EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x041B:         EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName442)
	// 0x0423:         EX_DefaultVariable (Property=Engine.Actor.ScaleGlow)
	// 0x0428:       EX_FloatConst (FloatConst=1.0)
	// 0x042F: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x0430:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0435:   EX_FloatToInt
	// 0x0436:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x0437:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x0438:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0440:         EX_DefaultVariable (Property=Engine.Actor.ScaleGlow)
	// 0x0445:       EX_FloatConst (FloatConst=1.0)
	// 0x044C: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x044D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0452:   EX_IntToFloat
	// 0x0453:     EX_ArrayElement
	// 0x0454:       EX_IntConstByte (IntConst=2)
	// 0x0456:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x045C: EX_JumpIfNot (JumpOffset=0x0478)
	// 0x045F:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0460:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0465:     EX_ArrayElement
	// 0x0466:       EX_IntOne
	// 0x0467:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x046D: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0472:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName449)
	// 0x0478: EX_Let
	// 0x0479:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName445)
	// 0x047E:   EX_MetaCast (Class=Engine.LevelInfo)
	// 0x0483:     EX_ArrayElement
	// 0x0484:       EX_IntOne
	// 0x0485:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x048A: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x048B:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0490:   EX_FloatToInt
	// 0x0491:     EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x0492:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x0493:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName445)
	// 0x049B:         EX_DefaultVariable (Property=Engine.LevelInfo.Brightness)
	// 0x04A0:       EX_IntToFloat
	// 0x04A1:         EX_ArrayElement
	// 0x04A2:           EX_IntConstByte (IntConst=3)
	// 0x04A4:           EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x04AB: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x04AC:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x04B1:   EX_IntToFloat
	// 0x04B2:     EX_ArrayElement
	// 0x04B3:       EX_IntZero
	// 0x04B4:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x04BA: EX_JumpIfNot (JumpOffset=0x04D7)
	// 0x04BD:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x04BE:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x04C3:     EX_ArrayElement
	// 0x04C4:       EX_IntConstByte (IntConst=9)
	// 0x04C6:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x04CC: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x04D1:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName445)
	// 0x04D7: EX_Let
	// 0x04D8:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName453)
	// 0x04DD:   EX_MetaCast (Class=Engine.ZoneInfo)
	// 0x04E2:     EX_ArrayElement
	// 0x04E3:       EX_IntConstByte (IntConst=8)
	// 0x04E5:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x04EA: EX_Let
	// 0x04EB:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x04F0:   EX_ArrayElement
	// 0x04F1:     EX_IntOne
	// 0x04F2:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x04F7: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x04F8:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x04FD:   EX_ByteToInt
	// 0x04FE:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x04FF:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName453)
	// 0x0507:       EX_DefaultVariable (Property=Engine.ZoneInfo.AmbientBrightness)
	// 0x050D: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x050E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0513:   EX_IntToFloat
	// 0x0514:     EX_ArrayElement
	// 0x0515:       EX_IntConstByte (IntConst=9)
	// 0x0517:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x051D: EX_JumpIfNot (JumpOffset=0x053A)
	// 0x0520:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0521:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0526:     EX_ArrayElement
	// 0x0527:       EX_IntConstByte (IntConst=7)
	// 0x0529:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x052F: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0534:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName453)
	// 0x053A: EX_Let
	// 0x053B:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0540:   EX_MetaCast (Class=Engine.Inventory)
	// 0x0545:     EX_ArrayElement
	// 0x0546:       EX_IntConstByte (IntConst=28)
	// 0x0548:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x054D: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x054E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0553:   EX_ByteToInt
	// 0x0554:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x0555:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x055D:       EX_DefaultVariable (Property=Engine.Actor.AmbientGlow)
	// 0x0563: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x0564:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0569:   EX_ByteToFloat
	// 0x056A:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x056B:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0573:       EX_DefaultVariable (Property=Engine.Actor.AmbientGlow)
	// 0x0579: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x057A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x057F:   EX_FloatToInt
	// 0x0580:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x0581:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x0582:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x058A:         EX_DefaultVariable (Property=Engine.Actor.ScaleGlow)
	// 0x058F:       EX_FloatConst (FloatConst=1.0)
	// 0x0596: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x0597:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x059C:   EX_BoolToInt
	// 0x059D:     EX_ClassContext (SkipSize=0x0006,MemSize=0x04)
	// 0x059E:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x05A6:       EX_BoolVariable
	// 0x05A7:         EX_DefaultVariable (Property=Engine.Inventory.bAmbientGlow)
	// 0x05AD: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x05AE:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x05B3:   EX_FloatToInt
	// 0x05B4:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x05B5:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x05B6:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x05BE:         EX_DefaultVariable (Property=Engine.Actor.Mass)
	// 0x05C3:       EX_FloatConst (FloatConst=100.0)
	// 0x05CA: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x05CB:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x05D0:   EX_FloatToInt
	// 0x05D1:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x05D2:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x05D3:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x05DB:         EX_DefaultVariable (Property=Engine.Actor.DrawScale)
	// 0x05E0:       EX_FloatConst (FloatConst=1.0)
	// 0x05E7: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x05E8:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x05ED:   EX_FloatToInt
	// 0x05EE:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x05EF:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x05F0:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x05F8:         EX_DefaultVariable (Property=Engine.Inventory.PlayerViewScale)
	// 0x05FD:       EX_FloatConst (FloatConst=1.0)
	// 0x0604: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x0605:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x060A:   EX_BoolToInt
	// 0x060B:     EX_ClassContext (SkipSize=0x0006,MemSize=0x04)
	// 0x060C:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0614:       EX_BoolVariable
	// 0x0615:         EX_DefaultVariable (Property=Engine.Actor.bUnlit)
	// 0x061B: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x061C:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0621:   EX_FloatToInt
	// 0x0622:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x0623:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x0624:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x062C:         EX_DefaultVariable (Property=Engine.Inventory.PickupViewScale)
	// 0x0631:       EX_FloatConst (FloatConst=1.0)
	// 0x0638: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x0639:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x063E:   EX_FloatToInt
	// 0x063F:     EX_Native (iNative=175,Function=Core.Object.Subtract_FloatFloat,OperatorType=1)
	// 0x0640:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x0641:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0649:         EX_DefaultVariable (Property=Engine.Inventory.ThirdPersonScale)
	// 0x064E:       EX_FloatConst (FloatConst=1.0)
	// 0x0655: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x0656:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x065B:   EX_IntToFloat
	// 0x065C:     EX_ArrayElement
	// 0x065D:       EX_IntZero
	// 0x065E:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0664: EX_JumpIfNot (JumpOffset=0x0681)
	// 0x0667:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0668:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x066D:     EX_ArrayElement
	// 0x066E:       EX_IntConstByte (IntConst=7)
	// 0x0670:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0676: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x067B:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0681: EX_Let
	// 0x0682:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0687:   EX_MetaCast (Class=Engine.Inventory)
	// 0x068C:     EX_ArrayElement
	// 0x068D:       EX_IntConstByte (IntConst=27)
	// 0x068F:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0694: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x0695:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x069A:   EX_ByteToInt
	// 0x069B:     EX_ClassContext (SkipSize=0x0005,MemSize=0x01)
	// 0x069C:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x06A4:       EX_DefaultVariable (Property=Engine.Actor.AmbientGlow)
	// 0x06AA: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x06AB:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x06B0:   EX_FloatToInt
	// 0x06B1:     EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x06B2:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x06B3:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x06BB:         EX_DefaultVariable (Property=Engine.Actor.ScaleGlow)
	// 0x06C0:       EX_IntToFloat
	// 0x06C1:         EX_IntConstByte (IntConst=10)
	// 0x06C5: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x06C6:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x06CB:   EX_BoolToInt
	// 0x06CC:     EX_ClassContext (SkipSize=0x0006,MemSize=0x04)
	// 0x06CD:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x06D5:       EX_BoolVariable
	// 0x06D6:         EX_DefaultVariable (Property=Engine.Inventory.bAmbientGlow)
	// 0x06DC: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x06DD:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x06E2:   EX_FloatToInt
	// 0x06E3:     EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x06E4:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x06EC:       EX_DefaultVariable (Property=Engine.Actor.Mass)
	// 0x06F2: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x06F3:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x06F8:   EX_FloatToInt
	// 0x06F9:     EX_Native (iNative=171,Function=Core.Object.Multiply_FloatFloat,OperatorType=1)
	// 0x06FA:       EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x06FB:         EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0703:         EX_DefaultVariable (Property=Engine.Actor.DrawScale)
	// 0x0708:       EX_IntToFloat
	// 0x0709:         EX_IntConstByte (IntConst=12)
	// 0x070D: EX_Native (iNative=161,Function=Core.Object.AddEqual_IntInt,OperatorType=1)
	// 0x070E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0713:   EX_BoolToInt
	// 0x0714:     EX_ClassContext (SkipSize=0x0006,MemSize=0x04)
	// 0x0715:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x071D:       EX_BoolVariable
	// 0x071E:         EX_DefaultVariable (Property=Engine.Actor.bUnlit)
	// 0x0724: EX_Native (iNative=159,Function=Core.Object.MultiplyEqual_IntFloat,OperatorType=1)
	// 0x0725:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x072A:   EX_IntToFloat
	// 0x072B:     EX_ArrayElement
	// 0x072C:       EX_IntZero
	// 0x072D:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0733: EX_JumpIfNot (JumpOffset=0x0750)
	// 0x0736:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0737:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x073C:     EX_ArrayElement
	// 0x073D:       EX_IntConstByte (IntConst=28)
	// 0x073F:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0745: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x074A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName455)
	// 0x0750: EX_Let
	// 0x0751:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x0756:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x075B:     EX_ArrayElement
	// 0x075C:       EX_IntConstByte (IntConst=26)
	// 0x075E:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0763: EX_Let
	// 0x0764:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0769:   EX_ArrayElement
	// 0x076A:     EX_IntConstByte (IntConst=5)
	// 0x076C:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0771: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName67,OperatorType=0)
	// 0x0776:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x077B:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0780:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName321)
	// 0x0786: EX_JumpIfNot (JumpOffset=0x07A3)
	// 0x0789:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x078A:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x078F:     EX_ArrayElement
	// 0x0790:       EX_IntConstByte (IntConst=30)
	// 0x0792:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0798: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x079D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x07A3: EX_JumpIfNot (JumpOffset=0x07C2)
	// 0x07A6:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x07A7:     EX_Native (iNative=210,Function=Core.Object.ComplementEqual_FloatFloat,OperatorType=1)
	// 0x07A8:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName321)
	// 0x07AD:       EX_ArrayElement
	// 0x07AE:         EX_IntConstByte (IntConst=25)
	// 0x07B0:         EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x07B7: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x07BC:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x07C2: EX_JumpIfNot (JumpOffset=0x07E1)
	// 0x07C5:   EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x07C6:     EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x07C7:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x07CF:       EX_DefaultVariable (Property=DeusEx.DeusExWeapon.GoverningSkill)
	// 0x07D4:     EX_NoObject
	// 0x07D6: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x07DB:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x07E1: EX_JumpIfNot (JumpOffset=0x07EE)
	// 0x07E4:   EX_Native (iNative=114,Function=Core.Object.EqualEqual_ObjectObject,OperatorType=1)
	// 0x07E5:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName456)
	// 0x07EA:     EX_NoObject
	// 0x07EC: EX_Return
	// 0x07ED:   EX_Nothing
	// 0x07EE: EX_Let
	// 0x07EF:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x07F4:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x07F5:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName456)
	// 0x07FD:     EX_InstanceVariable (Property=Core.Object.Class)
	// 0x0802: EX_Let
	// 0x0803:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0808:   EX_ArrayElement
	// 0x0809:     EX_IntConstByte (IntConst=7)
	// 0x080B:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0810: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName67,OperatorType=0)
	// 0x0815:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x081A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x081F:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName321)
	// 0x0825: EX_Switch (MemSize=4)
	// 0x0827:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x082C: EX_Case (NextOffset=0x0834)
	// 0x082F:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPWeaponPistol)
	// 0x0834: EX_Case (NextOffset=0x0875)
	// 0x0837:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x083C:     EX_ArrayElement
	// 0x083D:       EX_IntZero
	// 0x083E:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0843: EX_Let
	// 0x0844:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0849:   EX_ArrayElement
	// 0x084A:     EX_IntConstByte (IntConst=15)
	// 0x084C:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0851: EX_Let
	// 0x0852:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0857:   EX_ArrayElement
	// 0x0858:     EX_IntConstByte (IntConst=3)
	// 0x085A:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x085F: EX_Let
	// 0x0860:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0865:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x086A:     EX_ArrayElement
	// 0x086B:       EX_IntConstByte (IntConst=4)
	// 0x086D:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0872: EX_Jump (JumpOffset=0x0E20)
	// 0x0875: EX_Case (NextOffset=0x08B7)
	// 0x0878:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x087D:     EX_ArrayElement
	// 0x087E:       EX_IntConstByte (IntConst=3)
	// 0x0880:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0885: EX_Let
	// 0x0886:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x088B:   EX_ArrayElement
	// 0x088C:     EX_IntConstByte (IntConst=4)
	// 0x088E:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0893: EX_Let
	// 0x0894:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0899:   EX_ArrayElement
	// 0x089A:     EX_IntConstByte (IntConst=6)
	// 0x089C:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x08A1: EX_Let
	// 0x08A2:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x08A7:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x08AC:     EX_ArrayElement
	// 0x08AD:       EX_IntConstByte (IntConst=2)
	// 0x08AF:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x08B4: EX_Jump (JumpOffset=0x0E20)
	// 0x08B7: EX_Case (NextOffset=0x08F9)
	// 0x08BA:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x08BF:     EX_ArrayElement
	// 0x08C0:       EX_IntConstByte (IntConst=4)
	// 0x08C2:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x08C7: EX_Let
	// 0x08C8:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x08CD:   EX_ArrayElement
	// 0x08CE:     EX_IntConstByte (IntConst=11)
	// 0x08D0:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x08D5: EX_Let
	// 0x08D6:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x08DB:   EX_ArrayElement
	// 0x08DC:     EX_IntConstByte (IntConst=15)
	// 0x08DE:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x08E3: EX_Let
	// 0x08E4:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x08E9:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x08EE:     EX_ArrayElement
	// 0x08EF:       EX_IntConstByte (IntConst=3)
	// 0x08F1:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x08F6: EX_Jump (JumpOffset=0x0E20)
	// 0x08F9: EX_Case (NextOffset=0x0901)
	// 0x08FC:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPWeaponRifle)
	// 0x0901: EX_Case (NextOffset=0x0943)
	// 0x0904:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0909:     EX_ArrayElement
	// 0x090A:       EX_IntConstByte (IntConst=5)
	// 0x090C:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0911: EX_Let
	// 0x0912:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0917:   EX_ArrayElement
	// 0x0918:     EX_IntConstByte (IntConst=24)
	// 0x091A:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x091F: EX_Let
	// 0x0920:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0925:   EX_ArrayElement
	// 0x0926:     EX_IntConstByte (IntConst=16)
	// 0x0928:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x092D: EX_Let
	// 0x092E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0933:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0938:     EX_ArrayElement
	// 0x0939:       EX_IntConstByte (IntConst=2)
	// 0x093B:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0940: EX_Jump (JumpOffset=0x0E20)
	// 0x0943: EX_Case (NextOffset=0x0985)
	// 0x0946:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x094B:     EX_ArrayElement
	// 0x094C:       EX_IntConstByte (IntConst=7)
	// 0x094E:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0953: EX_Let
	// 0x0954:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0959:   EX_ArrayElement
	// 0x095A:     EX_IntConstByte (IntConst=22)
	// 0x095C:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0961: EX_Let
	// 0x0962:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0967:   EX_ArrayElement
	// 0x0968:     EX_IntConstByte (IntConst=11)
	// 0x096A:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x096F: EX_Let
	// 0x0970:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0975:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x097A:     EX_ArrayElement
	// 0x097B:       EX_IntConstByte (IntConst=3)
	// 0x097D:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0982: EX_Jump (JumpOffset=0x0E20)
	// 0x0985: EX_Case (NextOffset=0x09C6)
	// 0x0988:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x098D:     EX_ArrayElement
	// 0x098E:       EX_IntConstByte (IntConst=9)
	// 0x0990:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0995: EX_Let
	// 0x0996:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x099B:   EX_ArrayElement
	// 0x099C:     EX_IntConstByte (IntConst=23)
	// 0x099E:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x09A3: EX_Let
	// 0x09A4:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x09A9:   EX_ArrayElement
	// 0x09AA:     EX_IntConstByte (IntConst=14)
	// 0x09AC:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x09B1: EX_Let
	// 0x09B2:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x09B7:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x09BC:     EX_ArrayElement
	// 0x09BD:       EX_IntOne
	// 0x09BE:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x09C3: EX_Jump (JumpOffset=0x0E20)
	// 0x09C6: EX_Case (NextOffset=0x0A08)
	// 0x09C9:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x09CE:     EX_ArrayElement
	// 0x09CF:       EX_IntConstByte (IntConst=10)
	// 0x09D1:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x09D6: EX_Let
	// 0x09D7:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x09DC:   EX_ArrayElement
	// 0x09DD:     EX_IntConstByte (IntConst=2)
	// 0x09DF:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x09E4: EX_Let
	// 0x09E5:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x09EA:   EX_ArrayElement
	// 0x09EB:     EX_IntConstByte (IntConst=10)
	// 0x09ED:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x09F2: EX_Let
	// 0x09F3:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x09F8:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x09FD:     EX_ArrayElement
	// 0x09FE:       EX_IntConstByte (IntConst=2)
	// 0x0A00:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0A05: EX_Jump (JumpOffset=0x0E20)
	// 0x0A08: EX_Case (NextOffset=0x0A49)
	// 0x0A0B:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0A10:     EX_ArrayElement
	// 0x0A11:       EX_IntConstByte (IntConst=11)
	// 0x0A13:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0A18: EX_Let
	// 0x0A19:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0A1E:   EX_ArrayElement
	// 0x0A1F:     EX_IntConstByte (IntConst=14)
	// 0x0A21:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0A26: EX_Let
	// 0x0A27:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0A2C:   EX_ArrayElement
	// 0x0A2D:     EX_IntConstByte (IntConst=8)
	// 0x0A2F:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0A34: EX_Let
	// 0x0A35:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0A3A:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0A3F:     EX_ArrayElement
	// 0x0A40:       EX_IntOne
	// 0x0A41:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0A46: EX_Jump (JumpOffset=0x0E20)
	// 0x0A49: EX_Case (NextOffset=0x0A8A)
	// 0x0A4C:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0A51:     EX_ArrayElement
	// 0x0A52:       EX_IntConstByte (IntConst=12)
	// 0x0A54:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0A59: EX_Let
	// 0x0A5A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0A5F:   EX_ArrayElement
	// 0x0A60:     EX_IntConstByte (IntConst=25)
	// 0x0A62:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0A67: EX_Let
	// 0x0A68:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0A6D:   EX_ArrayElement
	// 0x0A6E:     EX_IntConstByte (IntConst=18)
	// 0x0A70:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0A75: EX_Let
	// 0x0A76:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0A7B:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0A80:     EX_ArrayElement
	// 0x0A81:       EX_IntZero
	// 0x0A82:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0A87: EX_Jump (JumpOffset=0x0E20)
	// 0x0A8A: EX_Case (NextOffset=0x0ACB)
	// 0x0A8D:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0A92:     EX_ArrayElement
	// 0x0A93:       EX_IntConstByte (IntConst=13)
	// 0x0A95:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0A9A: EX_Let
	// 0x0A9B:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0AA0:   EX_ArrayElement
	// 0x0AA1:     EX_IntConstByte (IntConst=13)
	// 0x0AA3:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0AA8: EX_Let
	// 0x0AA9:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0AAE:   EX_ArrayElement
	// 0x0AAF:     EX_IntConstByte (IntConst=17)
	// 0x0AB1:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0AB6: EX_Let
	// 0x0AB7:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0ABC:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0AC1:     EX_ArrayElement
	// 0x0AC2:       EX_IntOne
	// 0x0AC3:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0AC8: EX_Jump (JumpOffset=0x0E20)
	// 0x0ACB: EX_Case (NextOffset=0x0B0D)
	// 0x0ACE:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0AD3:     EX_ArrayElement
	// 0x0AD4:       EX_IntConstByte (IntConst=14)
	// 0x0AD6:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0ADB: EX_Let
	// 0x0ADC:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0AE1:   EX_ArrayElement
	// 0x0AE2:     EX_IntConstByte (IntConst=19)
	// 0x0AE4:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0AE9: EX_Let
	// 0x0AEA:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0AEF:   EX_ArrayElement
	// 0x0AF0:     EX_IntConstByte (IntConst=2)
	// 0x0AF2:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0AF7: EX_Let
	// 0x0AF8:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0AFD:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0B02:     EX_ArrayElement
	// 0x0B03:       EX_IntConstByte (IntConst=4)
	// 0x0B05:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0B0A: EX_Jump (JumpOffset=0x0E20)
	// 0x0B0D: EX_Case (NextOffset=0x0B4F)
	// 0x0B10:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0B15:     EX_ArrayElement
	// 0x0B16:       EX_IntConstByte (IntConst=15)
	// 0x0B18:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0B1D: EX_Let
	// 0x0B1E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0B23:   EX_ArrayElement
	// 0x0B24:     EX_IntConstByte (IntConst=20)
	// 0x0B26:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0B2B: EX_Let
	// 0x0B2C:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0B31:   EX_ArrayElement
	// 0x0B32:     EX_IntConstByte (IntConst=19)
	// 0x0B34:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0B39: EX_Let
	// 0x0B3A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0B3F:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0B44:     EX_ArrayElement
	// 0x0B45:       EX_IntConstByte (IntConst=2)
	// 0x0B47:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0B4C: EX_Jump (JumpOffset=0x0E20)
	// 0x0B4F: EX_Case (NextOffset=0x0B91)
	// 0x0B52:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0B57:     EX_ArrayElement
	// 0x0B58:       EX_IntConstByte (IntConst=16)
	// 0x0B5A:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0B5F: EX_Let
	// 0x0B60:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0B65:   EX_ArrayElement
	// 0x0B66:     EX_IntConstByte (IntConst=17)
	// 0x0B68:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0B6D: EX_Let
	// 0x0B6E:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0B73:   EX_ArrayElement
	// 0x0B74:     EX_IntConstByte (IntConst=12)
	// 0x0B76:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0B7B: EX_Let
	// 0x0B7C:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0B81:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0B86:     EX_ArrayElement
	// 0x0B87:       EX_IntConstByte (IntConst=3)
	// 0x0B89:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0B8E: EX_Jump (JumpOffset=0x0E20)
	// 0x0B91: EX_Case (NextOffset=0x0BD2)
	// 0x0B94:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0B99:     EX_ArrayElement
	// 0x0B9A:       EX_IntConstByte (IntConst=17)
	// 0x0B9C:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0BA1: EX_Let
	// 0x0BA2:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0BA7:   EX_ArrayElement
	// 0x0BA8:     EX_IntConstByte (IntConst=26)
	// 0x0BAA:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0BAF: EX_Let
	// 0x0BB0:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0BB5:   EX_ArrayElement
	// 0x0BB6:     EX_IntConstByte (IntConst=21)
	// 0x0BB8:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0BBD: EX_Let
	// 0x0BBE:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0BC3:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0BC8:     EX_ArrayElement
	// 0x0BC9:       EX_IntZero
	// 0x0BCA:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0BCF: EX_Jump (JumpOffset=0x0E20)
	// 0x0BD2: EX_Case (NextOffset=0x0C13)
	// 0x0BD5:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0BDA:     EX_ArrayElement
	// 0x0BDB:       EX_IntConstByte (IntConst=18)
	// 0x0BDD:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0BE2: EX_Let
	// 0x0BE3:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0BE8:   EX_ArrayElement
	// 0x0BE9:     EX_IntConstByte (IntConst=16)
	// 0x0BEB:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0BF0: EX_Let
	// 0x0BF1:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0BF6:   EX_ArrayElement
	// 0x0BF7:     EX_IntConstByte (IntConst=13)
	// 0x0BF9:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0BFE: EX_Let
	// 0x0BFF:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0C04:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0C09:     EX_ArrayElement
	// 0x0C0A:       EX_IntZero
	// 0x0C0B:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0C10: EX_Jump (JumpOffset=0x0E20)
	// 0x0C13: EX_Case (NextOffset=0x0C54)
	// 0x0C16:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0C1B:     EX_ArrayElement
	// 0x0C1C:       EX_IntConstByte (IntConst=19)
	// 0x0C1E:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0C23: EX_Let
	// 0x0C24:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0C29:   EX_ArrayElement
	// 0x0C2A:     EX_IntConstByte (IntConst=12)
	// 0x0C2C:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0C31: EX_Let
	// 0x0C32:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0C37:   EX_ArrayElement
	// 0x0C38:     EX_IntConstByte (IntConst=7)
	// 0x0C3A:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0C3F: EX_Let
	// 0x0C40:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0C45:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0C4A:     EX_ArrayElement
	// 0x0C4B:       EX_IntOne
	// 0x0C4C:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0C51: EX_Jump (JumpOffset=0x0E20)
	// 0x0C54: EX_Case (NextOffset=0x0C5C)
	// 0x0C57:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPWeaponShuriken)
	// 0x0C5C: EX_Case (NextOffset=0x0C9D)
	// 0x0C5F:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0C64:     EX_ArrayElement
	// 0x0C65:       EX_IntConstByte (IntConst=20)
	// 0x0C67:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0C6C: EX_Let
	// 0x0C6D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0C72:   EX_ArrayElement
	// 0x0C73:     EX_IntConstByte (IntConst=10)
	// 0x0C75:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0C7A: EX_Let
	// 0x0C7B:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0C80:   EX_ArrayElement
	// 0x0C81:     EX_IntConstByte (IntConst=20)
	// 0x0C83:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0C88: EX_Let
	// 0x0C89:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0C8E:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0C93:     EX_ArrayElement
	// 0x0C94:       EX_IntOne
	// 0x0C95:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0C9A: EX_Jump (JumpOffset=0x0E20)
	// 0x0C9D: EX_Case (NextOffset=0x0CDF)
	// 0x0CA0:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0CA5:     EX_ArrayElement
	// 0x0CA6:       EX_IntConstByte (IntConst=21)
	// 0x0CA8:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0CAD: EX_Let
	// 0x0CAE:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0CB3:   EX_ArrayElement
	// 0x0CB4:     EX_IntConstByte (IntConst=21)
	// 0x0CB6:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0CBB: EX_Let
	// 0x0CBC:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0CC1:   EX_ArrayElement
	// 0x0CC2:     EX_IntConstByte (IntConst=5)
	// 0x0CC4:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0CC9: EX_Let
	// 0x0CCA:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0CCF:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0CD4:     EX_ArrayElement
	// 0x0CD5:       EX_IntConstByte (IntConst=4)
	// 0x0CD7:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0CDC: EX_Jump (JumpOffset=0x0E20)
	// 0x0CDF: EX_Case (NextOffset=0x0D20)
	// 0x0CE2:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0CE7:     EX_ArrayElement
	// 0x0CE8:       EX_IntConstByte (IntConst=22)
	// 0x0CEA:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0CEF: EX_Let
	// 0x0CF0:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0CF5:   EX_ArrayElement
	// 0x0CF6:     EX_IntConstByte (IntConst=18)
	// 0x0CF8:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0CFD: EX_Let
	// 0x0CFE:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0D03:   EX_ArrayElement
	// 0x0D04:     EX_IntConstByte (IntConst=4)
	// 0x0D06:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0D0B: EX_Let
	// 0x0D0C:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0D11:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0D16:     EX_ArrayElement
	// 0x0D17:       EX_IntOne
	// 0x0D18:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0D1D: EX_Jump (JumpOffset=0x0E20)
	// 0x0D20: EX_Case (NextOffset=0x0D61)
	// 0x0D23:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0D28:     EX_ArrayElement
	// 0x0D29:       EX_IntConstByte (IntConst=23)
	// 0x0D2B:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0D30: EX_Let
	// 0x0D31:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0D36:   EX_ArrayElement
	// 0x0D37:     EX_IntConstByte (IntConst=27)
	// 0x0D39:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0D3E: EX_Let
	// 0x0D3F:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0D44:   EX_ArrayElement
	// 0x0D45:     EX_IntConstByte (IntConst=9)
	// 0x0D47:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0D4C: EX_Let
	// 0x0D4D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0D52:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0D57:     EX_ArrayElement
	// 0x0D58:       EX_IntOne
	// 0x0D59:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0D5E: EX_Jump (JumpOffset=0x0E20)
	// 0x0D61: EX_Case (NextOffset=0x0DA2)
	// 0x0D64:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0D69:     EX_ArrayElement
	// 0x0D6A:       EX_IntConstByte (IntConst=24)
	// 0x0D6C:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0D71: EX_Let
	// 0x0D72:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0D77:   EX_ArrayElement
	// 0x0D78:     EX_IntConstByte (IntConst=8)
	// 0x0D7A:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0D7F: EX_Let
	// 0x0D80:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0D85:   EX_ArrayElement
	// 0x0D86:     EX_IntZero
	// 0x0D87:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0D8C: EX_Let
	// 0x0D8D:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0D92:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0D97:     EX_ArrayElement
	// 0x0D98:       EX_IntConstByte (IntConst=3)
	// 0x0D9A:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0D9F: EX_Jump (JumpOffset=0x0E20)
	// 0x0DA2: EX_Case (NextOffset=0x0DE2)
	// 0x0DA5:   EX_MetaCast (Class=DeusEx.DeusExWeapon)
	// 0x0DAA:     EX_ArrayElement
	// 0x0DAB:       EX_IntConstByte (IntConst=25)
	// 0x0DAD:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName434)
	// 0x0DB2: EX_Let
	// 0x0DB3:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0DB8:   EX_ArrayElement
	// 0x0DB9:     EX_IntConstByte (IntConst=6)
	// 0x0DBB:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName440)
	// 0x0DC0: EX_Let
	// 0x0DC1:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0DC6:   EX_ArrayElement
	// 0x0DC7:     EX_IntOne
	// 0x0DC8:     EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName439)
	// 0x0DCD: EX_Let
	// 0x0DCE:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0DD3:   EX_MetaCast (Class=DeusEx.Skill)
	// 0x0DD8:     EX_ArrayElement
	// 0x0DD9:       EX_IntOne
	// 0x0DDA:       EX_InstanceVariable (Property=DXMTL152b1.FunnyName48.FunnyName435)
	// 0x0DDF: EX_Jump (JumpOffset=0x0E20)
	// 0x0DE2: EX_Case (NextOffset=0xFFFF)
	// 0x0DE5: EX_Let
	// 0x0DE6:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0DEB:   EX_IntZero
	// 0x0DEC: EX_Let
	// 0x0DED:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName321)
	// 0x0DF2:   EX_FloatConst (FloatConst=0.0)
	// 0x0DF7: EX_Let
	// 0x0DF8:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0DFD:   EX_IntZero
	// 0x0DFE: EX_Let
	// 0x0DFF:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0E04:   EX_FloatConst (FloatConst=0.0)
	// 0x0E09: EX_Let
	// 0x0E0A:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0E0F:   EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x0E10:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x0E18:     EX_DefaultVariable (Property=DeusEx.DeusExWeapon.GoverningSkill)
	// 0x0E1D: EX_Jump (JumpOffset=0x0E20)
	// 0x0E20: EX_JumpIfNot (JumpOffset=0x0E3A)
	// 0x0E23:   EX_Native (iNative=155,Function=Core.Object.NotEqual_IntInt,OperatorType=1)
	// 0x0E24:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName448)
	// 0x0E29:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName450)
	// 0x0E2F: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0E34:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x0E3A: EX_JumpIfNot (JumpOffset=0x0E56)
	// 0x0E3D:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x0E3E:     EX_Native (iNative=210,Function=Core.Object.ComplementEqual_FloatFloat,OperatorType=1)
	// 0x0E3F:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName321)
	// 0x0E44:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName451)
	// 0x0E4B: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0E50:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x0E56: EX_JumpIfNot (JumpOffset=0x0E79)
	// 0x0E59:   EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0E5A:     EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName454)
	// 0x0E5F:     EX_ClassContext (SkipSize=0x0005,MemSize=0x04)
	// 0x0E60:       EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x0E68:       EX_DefaultVariable (Property=DeusEx.DeusExWeapon.GoverningSkill)
	// 0x0E6E: EX_FinalFunction (Function=DXMTL152b1.FunnyName48.FunnyName94,OperatorType=0)
	// 0x0E73:   EX_LocalVariable (Property=DXMTL152b1.FunnyName48.Tick.FunnyName447)
	// 0x0E79: EX_Return
	// 0x0E7A:   EX_Nothing
	//

	#error nada
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 bHidden=True
 RemoteRole=ROLE_None
 bAlwaysTick=True
}
