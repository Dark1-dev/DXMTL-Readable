//=============================================================================
// AntiCheat1. Rebuild with ScriptRays.
//=============================================================================
class AntiCheat1 extends CBPMutator
	config(DXMTL);

//-----------------------------------------------------------------------------
// Structures.
//-----------------------------------------------------------------------------

struct FunnyName4
{
	var const float FunnyName373;
	var const float FunnyName188;
	var const float FunnyName374;
	var const bool FunnyName375;
};

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var bool FunnyName371;
var bool FunnyName372;
var globalconfig bool AllowCenterView;
var globalconfig bool ContinuousCenterView;
var globalconfig float CenterViewDelay;
var globalconfig float StandingProtectionTime;
var globalconfig float MovingProtectionTime;
var globalconfig int SimMaxClientRate;
var const FunnyName4 FunnyName72;
var int FunnyName120;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function PreBeginPlay()
{
	Super.PreBeginPlay();
	if ( !FunnyName372 )
	{
		FunnyName372 = true;
		Level.Game.RegisterDamageMutator( Self );
	}
}

function PostBeginPlay()
{
	Super.PostBeginPlay();
	if ( FunnyName371 )
	{
		return;
	}
	FunnyName371 = true;
	CenterViewDelay = FMax( CenterViewDelay, 0.0 );
	StandingProtectionTime = FMin( StandingProtectionTime, 60.0 );
	MovingProtectionTime = FClamp( MovingProtectionTime, 0.0, 30.0 );
	SimMaxClientRate = Clamp( SimMaxClientRate, 1600, 20000 );
	SaveConfig();
	FunnyName120 = SimMaxClientRate;
	Log( "", 'DXMTL' );
	Log( "Starting anti-cheat mutator...", 'DXMTL' );
	Log( "Allow CenterView:"@string(AllowCenterView), 'DXMTL' );
	Log( "Continuous CenterView:"@string(ContinuousCenterView), 'DXMTL' );
	Log( "CenterView Delay:"@string(CenterViewDelay), 'DXMTL' );
	Log( "", 'DXMTL' );
	Class'PlayerPawn'.default.MaxTimeMargin = 1.0;
	Class'PlayerPawn'.static.StaticSaveConfig();
	FunnyName30();
	SetTimer( 5.0, true );
}

function ModifyPlayer( Pawn Other )
{
	local MTLPlayer Player;

	Player = MTLPlayer(Other);
	if ( Player==None )
	{
		Log( "Bad player login", 'DXMTL' );
		if ( Other!=None )
		{
			Other.Destroy();
		}
		return;
	}
	Super.ModifyPlayer( Player );
	Player.FunnyName129 = AllowCenterView;
	Player.FunnyName130 = ContinuousCenterView;
	Player.FunnyName119 = CenterViewDelay;
	Player.FunnyName120 = FunnyName120;
	if ( Player.FunnyName110!=None )
	{
		Player.FunnyName110.Destroy();
	}
	Player.FunnyName110 = Player.Spawn( Class'FunnyName52', Player );
	Player.FunnyName110.FunnyName92( StandingProtectionTime, MovingProtectionTime );
	if ( Player.FunnyName111==None )
	{
		Player.FunnyName111 = Spawn( Class'FunnyName46', Player );
	}
	Player.FunnyName88();
}

function Timer()
{
	local DeusExMover FunnyName376;

	foreach AllActors( Class'DeusExMover', FunnyName376 )
	{
		if ( FunnyName376.bDestroyed && FunnyName376.Texture!=None )
		{
			FunnyName376.StopPicking();
			FunnyName376.GotoState( '' );
			FunnyName376.Disable( 'Tick' );
			FunnyName376.SetTimer( 0.0, false );
			FunnyName376.Velocity = vect(0.0,0.0,0.0);
			FunnyName376.SetPhysics( PHYS_None );
			FunnyName376.Texture = None;
		}
	}
}

final function FunnyName30()
{
	local DeusExLevelInfo FunnyName342;
	local DeusExMover FunnyName188;
	local string FunnyName377;

	//
	// 0x0000: EX_Iterator (IteratorOffset=0x0014)
	// 0x0001:   EX_Native (iNative=304,Function=Engine.Actor.AllActors,OperatorType=0)
	// 0x0003:     EX_ObjectConst (ObjectConst=Class DeusEx.DeusExLevelInfo)
	// 0x0008:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x0010: EX_Jump (JumpOffset=0x0014)
	// 0x0013: EX_IteratorNext
	// 0x0014: EX_IteratorPop
	// 0x0015: EX_JumpIfNot (JumpOffset=0x005B)
	// 0x0018:   EX_Native (iNative=114,Function=Core.Object.EqualEqual_ObjectObject,OperatorType=1)
	// 0x0019:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x001E:     EX_NoObject
	// 0x0020: EX_Let
	// 0x0021:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x0026:   EX_Context (SkipSize=0x0008,MemSize=0x04)
	// 0x0027:     EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x002F:     EX_Native (iNative=278,Function=Engine.Actor.Spawn,OperatorType=0)
	// 0x0031:       EX_ObjectConst (ObjectConst=Class DeusEx.DeusExLevelInfo)
	// 0x0037: EX_Native (iNative=231,Function=Core.Object.Log,OperatorType=0)
	// 0x0038:   EX_StringConst (StringConst="DeusExLevelInfo Created!")
	// 0x0052:   EX_NameConst (NameConst=DXMTL)
	// 0x0058: EX_Jump (JumpOffset=0x007D)
	// 0x005B: EX_Native (iNative=231,Function=Core.Object.Log,OperatorType=0)
	// 0x005C:   EX_StringConst (StringConst="DeusExLevelInfo Repaired!")
	// 0x0077:   EX_NameConst (NameConst=DXMTL)
	// 0x007D: EX_Let
	// 0x007E:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x007F:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x0087:     EX_InstanceVariable (Property=DeusEx.DeusExLevelInfo.missionNumber)
	// 0x008C:   EX_IntConstByte (IntConst=7)
	// 0x008E: EX_LetBool
	// 0x008F:   EX_Context (SkipSize=0x0006,MemSize=0x04)
	// 0x0090:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x0098:     EX_BoolVariable
	// 0x0099:       EX_InstanceVariable (Property=DeusEx.DeusExLevelInfo.bMultiPlayerMap)
	// 0x009E:   EX_True
	// 0x009F: EX_Let
	// 0x00A0:   EX_Context (SkipSize=0x0005,MemSize=0x00)
	// 0x00A1:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x00A9:     EX_InstanceVariable (Property=DeusEx.DeusExLevelInfo.ConversationPackage)
	// 0x00AE:   EX_ClassContext (SkipSize=0x0005,MemSize=0x00)
	// 0x00AF:     EX_ObjectConst (ObjectConst=Class DeusEx.DeusExLevelInfo)
	// 0x00B7:     EX_DefaultVariable (Property=DeusEx.DeusExLevelInfo.ConversationPackage)
	// 0x00BC: EX_LetBool
	// 0x00BD:   EX_Context (SkipSize=0x0006,MemSize=0x04)
	// 0x00BE:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x00C6:     EX_BoolVariable
	// 0x00C7:       EX_InstanceVariable (Property=Engine.Actor.bAlwaysRelevant)
	// 0x00CC:   EX_True
	// 0x00CD: EX_Let
	// 0x00CE:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x00CF:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName342)
	// 0x00D7:     EX_InstanceVariable (Property=Engine.Actor.NetPriority)
	// 0x00DC:   EX_FloatConst (FloatConst=5.0)
	// 0x00E1: EX_Let
	// 0x00E2:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName377)
	// 0x00E7:   EX_Native (iNative=235,Function=Core.Object.Caps,OperatorType=0)
	// 0x00E8:     EX_Native (iNative=128,Function=Core.Object.Left,OperatorType=0)
	// 0x00E9:       EX_ObjectToString
	// 0x00EA:         EX_Self
	// 0x00EB:       EX_Native (iNative=126,Function=Core.Object.InStr,OperatorType=0)
	// 0x00EC:         EX_ObjectToString
	// 0x00ED:           EX_Self
	// 0x00EE:         EX_StringConst (StringConst=".")
	// 0x00F4: EX_Switch (MemSize=0)
	// 0x00F6:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName377)
	// 0x00FB: EX_Case (NextOffset=0x0126)
	// 0x00FE:   EX_StringConst (StringConst="DXMP_CMD")
	// 0x0108: EX_Native (iNative=278,Function=Engine.Actor.Spawn,OperatorType=0)
	// 0x010A:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.FunnyName44)
	// 0x010F:   EX_Self
	// 0x0110:   EX_NameConst (NameConst=bot4_door)
	// 0x0115:   EX_VectorConst (VectorConst=(X=-1549.206177,Y=2638.227783,Z=-1999.435669))
	// 0x0123: EX_Jump (JumpOffset=0x01AC)
	// 0x0126: EX_Case (NextOffset=0x01A9)
	// 0x0129:   EX_StringConst (StringConst="DXMP_CATHEDRAL")
	// 0x0139: EX_Iterator (IteratorOffset=0x01A5)
	// 0x013A:   EX_Native (iNative=304,Function=Engine.Actor.AllActors,OperatorType=0)
	// 0x013C:     EX_ObjectConst (ObjectConst=Class DeusEx.DeusExMover)
	// 0x0141:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName188)
	// 0x0149: EX_JumpIfNot (JumpOffset=0x0178)
	// 0x014C:   EX_Native (iNative=254,Function=Core.Object.EqualEqual_NameName,OperatorType=1)
	// 0x014D:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x014E:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName188)
	// 0x0156:       EX_InstanceVariable (Property=Core.Object.Name)
	// 0x015B:     EX_NameConst (NameConst=DeusExMover34)
	// 0x0161: EX_Let
	// 0x0162:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0163:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName188)
	// 0x016B:     EX_InstanceVariable (Property=Engine.Mover.StayOpenTime)
	// 0x0170:   EX_FloatConst (FloatConst=28.0)
	// 0x0175: EX_Jump (JumpOffset=0x01A4)
	// 0x0178: EX_JumpIfNot (JumpOffset=0x01A4)
	// 0x017B:   EX_Native (iNative=254,Function=Core.Object.EqualEqual_NameName,OperatorType=1)
	// 0x017C:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x017D:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName188)
	// 0x0185:       EX_InstanceVariable (Property=Core.Object.Name)
	// 0x018A:     EX_NameConst (NameConst=DeusExMover0)
	// 0x0190: EX_Let
	// 0x0191:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0192:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName30.FunnyName188)
	// 0x019A:     EX_InstanceVariable (Property=Engine.Mover.MoveTime)
	// 0x019F:   EX_FloatConst (FloatConst=1.0)
	// 0x01A4: EX_IteratorNext
	// 0x01A5: EX_IteratorPop
	// 0x01A6: EX_Jump (JumpOffset=0x01AC)
	// 0x01A9: EX_Case (NextOffset=0xFFFF)
	// 0x01AC: EX_Return
	// 0x01AD:   EX_Nothing
	//

	#error nada
}

function ReplaceMapItem( out Actor A, Class<Actor> FunnyName370 )
{
	Super.ReplaceMapItem( A, FunnyName370 );
	FunnyName29( A );
	FunnyName27( A );
	FunnyName28( A );
}

function SpawnNotification( out Actor A, Class<Actor> FunnyName370 )
{
	Super.SpawnNotification( A, FunnyName370 );
	FunnyName29( A );
	FunnyName28( A );
}

final function FunnyName29( out Actor A )
{
	local Class<Actor> FunnyName370;
	local Actor FunnyName378;

	//
	// 0x0000: EX_JumpIfNot (JumpOffset=0x000D)
	// 0x0003:   EX_Native (iNative=114,Function=Core.Object.EqualEqual_ObjectObject,OperatorType=1)
	// 0x0004:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0009:     EX_NoObject
	// 0x000B: EX_Return
	// 0x000C:   EX_Nothing
	// 0x000D: EX_JumpIfNot (JumpOffset=0x004F)
	// 0x0010:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x0011:     EX_Context (SkipSize=0x0008,MemSize=0x04)
	// 0x0012:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x001A:       EX_Native (iNative=303,Function=Core.Object.IsA,OperatorType=0)
	// 0x001C:         EX_NameConst (NameConst=Decal)
	// 0x0022:     EX_Skip (SkipSize=0x0015)
	// 0x0025:       EX_Native (iNative=154,Function=Core.Object.EqualEqual_IntInt,OperatorType=1)
	// 0x0026:         EX_ByteToInt
	// 0x0027:           EX_Context (SkipSize=0x0005,MemSize=0x01)
	// 0x0028:             EX_InstanceVariable (Property=Engine.Actor.Level)
	// 0x0030:             EX_InstanceVariable (Property=Engine.LevelInfo.NetMode)
	// 0x0035:         EX_ByteToInt
	// 0x0036:           EX_ByteConst (ByteConst=1)
	// 0x003A: EX_Context (SkipSize=0x0003,MemSize=0x04)
	// 0x003B:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0043:   EX_Native (iNative=279,Function=Engine.Actor.Destroy,OperatorType=0)
	// 0x0046: EX_Let
	// 0x0047:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x004C:   EX_NoObject
	// 0x004D: EX_Return
	// 0x004E:   EX_Nothing
	// 0x004F: EX_Switch (MemSize=4)
	// 0x0051:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0052:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x005A:     EX_InstanceVariable (Property=Core.Object.Class)
	// 0x005F: EX_Case (NextOffset=0x0075)
	// 0x0062:   EX_ObjectConst (ObjectConst=Class DeusEx.BloodDrop)
	// 0x0067: EX_Let
	// 0x0068:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x006D:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPBloodDrop)
	// 0x0072: EX_Jump (JumpOffset=0x013E)
	// 0x0075: EX_Case (NextOffset=0x008B)
	// 0x0078:   EX_ObjectConst (ObjectConst=Class DeusEx.FleshFragment)
	// 0x007D: EX_Let
	// 0x007E:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x0083:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPFleshFragment)
	// 0x0088: EX_Jump (JumpOffset=0x013E)
	// 0x008B: EX_Case (NextOffset=0x00A1)
	// 0x008E:   EX_ObjectConst (ObjectConst=Class DeusEx.BloodSpurt)
	// 0x0093: EX_Let
	// 0x0094:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x0099:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPBloodSpurt)
	// 0x009E: EX_Jump (JumpOffset=0x013E)
	// 0x00A1: EX_Case (NextOffset=0x00B7)
	// 0x00A4:   EX_ObjectConst (ObjectConst=Class DeusEx.Shuriken)
	// 0x00A9: EX_Let
	// 0x00AA:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x00AF:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPShuriken)
	// 0x00B4: EX_Jump (JumpOffset=0x013E)
	// 0x00B7: EX_Case (NextOffset=0x00CD)
	// 0x00BA:   EX_ObjectConst (ObjectConst=Class DeusEx.WeaponPistol)
	// 0x00BF: EX_Let
	// 0x00C0:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x00C5:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPWeaponPistol)
	// 0x00CA: EX_Jump (JumpOffset=0x013E)
	// 0x00CD: EX_Case (NextOffset=0x00E3)
	// 0x00D0:   EX_ObjectConst (ObjectConst=Class DeusEx.WeaponRifle)
	// 0x00D5: EX_Let
	// 0x00D6:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x00DB:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPWeaponRifle)
	// 0x00E0: EX_Jump (JumpOffset=0x013E)
	// 0x00E3: EX_Case (NextOffset=0x00F9)
	// 0x00E6:   EX_ObjectConst (ObjectConst=Class DeusEx.WeaponShuriken)
	// 0x00EB: EX_Let
	// 0x00EC:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x00F1:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPWeaponShuriken)
	// 0x00F6: EX_Jump (JumpOffset=0x013E)
	// 0x00F9: EX_Case (NextOffset=0x010F)
	// 0x00FC:   EX_ObjectConst (ObjectConst=Class DeusEx.WeaponGEPGun)
	// 0x0101: EX_Let
	// 0x0102:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x0107:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPWeaponGEPGun)
	// 0x010C: EX_Jump (JumpOffset=0x013E)
	// 0x010F: EX_Case (NextOffset=0x0125)
	// 0x0112:   EX_ObjectConst (ObjectConst=Class DeusEx.ammocrate)
	// 0x0117: EX_Let
	// 0x0118:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x011D:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPAmmoCrate)
	// 0x0122: EX_Jump (JumpOffset=0x013E)
	// 0x0125: EX_Case (NextOffset=0x013B)
	// 0x0128:   EX_ObjectConst (ObjectConst=Class DeusEx.Button1)
	// 0x012D: EX_Let
	// 0x012E:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x0133:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.CBPButton1)
	// 0x0138: EX_Jump (JumpOffset=0x013E)
	// 0x013B: EX_Case (NextOffset=0xFFFF)
	// 0x013E: EX_JumpIfNot (JumpOffset=0x02F8)
	// 0x0141:   EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0142:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x0147:     EX_NoObject
	// 0x0149: EX_LetBool
	// 0x014A:   EX_Context (SkipSize=0x0006,MemSize=0x04)
	// 0x014B:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0153:     EX_BoolVariable
	// 0x0154:       EX_InstanceVariable (Property=Engine.Actor.bHidden)
	// 0x0159:   EX_True
	// 0x015A: EX_Context (SkipSize=0x0006,MemSize=0x00)
	// 0x015B:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0163:   EX_Native (iNative=262,Function=Engine.Actor.SetCollision,OperatorType=0)
	// 0x0165:     EX_False
	// 0x0166:     EX_False
	// 0x0167:     EX_False
	// 0x0169: EX_Let
	// 0x016A:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x016F:   EX_Native (iNative=278,Function=Engine.Actor.Spawn,OperatorType=0)
	// 0x0171:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName370)
	// 0x0176:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0177:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x017F:       EX_InstanceVariable (Property=Engine.Actor.Owner)
	// 0x0184:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0185:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x018D:       EX_InstanceVariable (Property=Engine.Actor.Tag)
	// 0x0192:     EX_Context (SkipSize=0x0005,MemSize=0x0C)
	// 0x0193:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x019B:       EX_InstanceVariable (Property=Engine.Actor.Location)
	// 0x01A0:     EX_Context (SkipSize=0x0005,MemSize=0x0C)
	// 0x01A1:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x01A9:       EX_InstanceVariable (Property=Engine.Actor.Rotation)
	// 0x01AF: EX_JumpIfNot (JumpOffset=0x02B9)
	// 0x01B2:   EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x01B3:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x01B8:     EX_NoObject
	// 0x01BA: EX_JumpIfNot (JumpOffset=0x020B)
	// 0x01BD:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x01BE:     EX_Context (SkipSize=0x0008,MemSize=0x04)
	// 0x01BF:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x01C7:       EX_Native (iNative=303,Function=Core.Object.IsA,OperatorType=0)
	// 0x01C9:         EX_NameConst (NameConst=Inventory)
	// 0x01CF:     EX_Skip (SkipSize=0x0012)
	// 0x01D2:       EX_Context (SkipSize=0x0008,MemSize=0x04)
	// 0x01D3:         EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x01DB:         EX_Native (iNative=303,Function=Core.Object.IsA,OperatorType=0)
	// 0x01DD:           EX_NameConst (NameConst=Inventory)
	// 0x01E4: EX_Let
	// 0x01E5:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x01E6:     EX_DynamicCast (Class=Engine.Inventory)
	// 0x01EB:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x01F3:     EX_InstanceVariable (Property=Engine.Inventory.RespawnTime)
	// 0x01F8:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x01F9:     EX_DynamicCast (Class=Engine.Inventory)
	// 0x01FE:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0206:     EX_InstanceVariable (Property=Engine.Inventory.RespawnTime)
	// 0x020B: EX_Let
	// 0x020C:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x020D:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x0215:     EX_InstanceVariable (Property=Engine.Actor.Event)
	// 0x021A:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x021B:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0223:     EX_InstanceVariable (Property=Engine.Actor.Event)
	// 0x0228: EX_Let
	// 0x0229:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x022A:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x0232:     EX_InstanceVariable (Property=Engine.Actor.AttachTag)
	// 0x0237:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0238:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0240:     EX_InstanceVariable (Property=Engine.Actor.AttachTag)
	// 0x0245: EX_Context (SkipSize=0x0011,MemSize=0x00)
	// 0x0246:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x024E:   EX_Native (iNative=3970,Function=Engine.Actor.SetPhysics,OperatorType=0)
	// 0x0250:     EX_Context (SkipSize=0x0005,MemSize=0x01)
	// 0x0251:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0259:       EX_InstanceVariable (Property=Engine.Actor.Physics)
	// 0x025F: EX_Context (SkipSize=0x001F,MemSize=0x04)
	// 0x0260:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x0268:   EX_Native (iNative=283,Function=Engine.Actor.SetCollisionSize,OperatorType=0)
	// 0x026A:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x026B:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0273:       EX_InstanceVariable (Property=Engine.Actor.CollisionRadius)
	// 0x0278:     EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x0279:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x0281:       EX_InstanceVariable (Property=Engine.Actor.CollisionHeight)
	// 0x0287: EX_JumpIfNot (JumpOffset=0x02B9)
	// 0x028A:   EX_Context (SkipSize=0x0008,MemSize=0x04)
	// 0x028B:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x0293:     EX_Native (iNative=303,Function=Core.Object.IsA,OperatorType=0)
	// 0x0295:       EX_NameConst (NameConst=CBPButton1)
	// 0x029B: EX_Context (SkipSize=0x0010,MemSize=0x00)
	// 0x029C:   EX_DynamicCast (Class=DXMTL152b1.CBPButton1)
	// 0x02A1:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x02A9:   EX_FinalFunction (Function=DXMTL152b1.CBPButton1.FunnyName1,OperatorType=0)
	// 0x02AE:     EX_DynamicCast (Class=DeusEx.Button1)
	// 0x02B3:       EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x02B9: EX_Let
	// 0x02BA:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x02BB:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x02C3:     EX_InstanceVariable (Property=Engine.Actor.Tag)
	// 0x02C8:   EX_NameConst (NameConst=None)
	// 0x02CD: EX_Let
	// 0x02CE:   EX_Context (SkipSize=0x0005,MemSize=0x04)
	// 0x02CF:     EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x02D7:     EX_InstanceVariable (Property=Engine.Actor.Event)
	// 0x02DC:   EX_NameConst (NameConst=None)
	// 0x02E1: EX_Context (SkipSize=0x0003,MemSize=0x04)
	// 0x02E2:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x02EA:   EX_Native (iNative=279,Function=Engine.Actor.Destroy,OperatorType=0)
	// 0x02ED: EX_Let
	// 0x02EE:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.A)
	// 0x02F3:   EX_LocalVariable (Property=DXMTL152b1.AntiCheat1.FunnyName29.FunnyName378)
	// 0x02F8: EX_Return
	// 0x02F9:   EX_Nothing
	//

	#error nada
}

final function FunnyName28( out Actor A )
{
	local float FunnyName379;

	if ( A==None )
	{
		return;
	}
	if ( A.IsA('Fragment') )
	{
		A.bReplicateInstigator = false;
	}
	else if ( A.IsA('ElectronicDevices') )
	{
		FunnyName379 = FunnyName72.FunnyName373;
		if ( A.IsA('SecurityCamera') && FunnyName72.FunnyName375 )
		{
			SecurityCamera(A).bSwing = false;
		}
	}
	else if ( A.IsA('DeusExDecoration') && int(A.Physics)==int(EPhysics.PHYS_Rotating) && int(A.RemoteRole)==int(ENetRole.ROLE_DumbProxy) )
	{
		A.RemoteRole = ROLE_SimulatedProxy;
	}
	if ( FunnyName379>0.0 )
	{
		A.NetUpdateFrequency = FunnyName379;
	}
}

final function FunnyName27( out Actor A )
{
	local float FunnyName379;

	if ( A==None )
	{
		return;
	}
	if ( A.IsA('ZoneInfo') )
	{
		FunnyName379 = FunnyName72.FunnyName374;
	}
	else if ( A.IsA('Mover') )
	{
		FunnyName379 = FunnyName72.FunnyName188;
		if ( A.IsA('ElevatorMover') && FunnyName379>0.0 )
		{
			FunnyName379 = FMax( FunnyName379*1.5, 10.0 );
		}
	}
	else if ( A.IsA('Button1') )
	{
		A.bAlwaysRelevant = true;
		A.NetPriority = 2.7;
	}
	else if ( A.IsA('AmmoRocketWP') )
	{
		A.SetCollisionSize( FMin(A.CollisionRadius*0.9,12.0), A.CollisionHeight*0.9 );
	}
	else if ( A.IsA('Ammo20mm') || A.IsA('WeaponLAW') || A.IsA('RepairBot') )
	{
		A.SetCollisionSize( A.CollisionRadius*0.9, A.CollisionHeight*0.9 );
	}
	else if ( A.IsA('WeaponLAM') || A.IsA('WeaponEMPGrenade') || A.IsA('WeaponGasGrenade') || A.IsA('MedicalBot') || A.IsA('BioelectricCell') || A.IsA('Lockpick') || A.IsA('Multitool') || A.IsA('MedKit') )
	{
		A.SetCollisionSize( A.CollisionRadius*0.99, A.CollisionHeight*0.99 );
	}
	if ( FunnyName379>0.0 )
	{
		A.NetUpdateFrequency = FunnyName379;
	}
}

function MutatorTakeDamage( out int ActualDamage, Pawn Victim, Pawn InstigatedBy, out vector HitLocation, out vector HitLocation, name DamageType )
{
	if ( DeusExPlayer(Victim)!=None && DeusExPlayer(Victim).NintendoImmunityTimeLeft>0.0 )
	{
		HitLocation = vect(0.0,0.0,0.0);
		ActualDamage = 0;
	}
	Super.MutatorTakeDamage( ActualDamage, Victim, InstigatedBy, HitLocation, HitLocation, DamageType );
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 AllowCenterView=True
 CenterViewDelay=2.500000
 StandingProtectionTime=7.000000
 MovingProtectionTime=8.000000
 SimMaxClientRate=10000
 FunnyName72=(FunnyName373=16.000000,FunnyName188=10.000000,FunnyName374=2.000000,FunnyName375=True)
 RemoteRole=ROLE_None
}
