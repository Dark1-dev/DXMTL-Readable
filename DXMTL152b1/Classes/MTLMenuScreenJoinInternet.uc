//=============================================================================
// MTLMenuScreenJoinInternet. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuScreenJoinInternet extends MTLMenuScreenJoinGame;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var deusexgspylink Link;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function bool ButtonActivated( Window buttonPressed )
{
	local bool bHandled;

	//
	// 0x0000: EX_LetBool
	// 0x0001:   EX_BoolVariable
	// 0x0002:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinInternet.ButtonActivated.bHandled)
	// 0x0007:   EX_True
	// 0x0008: EX_Switch (MemSize=4)
	// 0x000A:   EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinInternet.ButtonActivated.buttonPressed)
	// 0x000F: EX_Case (NextOffset=0x0027)
	// 0x0012:   EX_InstanceVariable (Property=DeusEx.menuscreenjoingame.HostButton)
	// 0x0017: EX_VirtualFunction (FunctionName=ProcessMenuAction,Candidate=DeusEx.MenuUIWindow.ProcessMenuAction)
	// 0x001C:   EX_ByteConst (ByteConst=1)
	// 0x001E:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.MTLMenuScreenHostNet)
	// 0x0024: EX_Jump (JumpOffset=0x0035)
	// 0x0027: EX_Case (NextOffset=0xFFFF)
	// 0x002A: EX_LetBool
	// 0x002B:   EX_BoolVariable
	// 0x002C:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinInternet.ButtonActivated.bHandled)
	// 0x0031:   EX_False
	// 0x0032: EX_Jump (JumpOffset=0x0035)
	// 0x0035: EX_JumpIfNot (JumpOffset=0x0052)
	// 0x0038:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x0039:     EX_BoolVariable
	// 0x003A:       EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinInternet.ButtonActivated.bHandled)
	// 0x0040: EX_LetBool
	// 0x0041:   EX_BoolVariable
	// 0x0042:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinInternet.ButtonActivated.bHandled)
	// 0x0047:   EX_FinalFunction (Function=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated,OperatorType=0)
	// 0x004C:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinInternet.ButtonActivated.buttonPressed)
	// 0x0052: EX_Return
	// 0x0053:   EX_BoolVariable
	// 0x0054:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinInternet.ButtonActivated.bHandled)
	// 0x0059: EX_Return
	// 0x005A:   EX_Nothing
	//

	#error nada
}

function Query()
{
	Link = GetPlayerPawn().GetEntryLevel().Spawn( Class'deusexgspylink' );
	Link.MasterServerAddress = MasterServerAddress;
	Link.MasterServerTCPPort = MasterServerTCPPort;
	Link.Region = Region;
	Link.MasterServerTimeout = MasterServerTimeout;
	Link.GameName = GameName;
	Link.OwnerWindow = Self;
	Link.Start();
}

function QueryFinished( bool bSuccess, optional string ErrorMsg )
{
	Link.Destroy();
	Link = None;
	PingUnpingedServers();
}

function ShutdownLink()
{
	if ( Link!=None )
	{
		Link.Destroy();
	}
	Link = None;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 Title="Start Multiplayer Internet Game"
}
