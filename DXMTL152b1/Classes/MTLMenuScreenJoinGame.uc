//=============================================================================
// MTLMenuScreenJoinGame. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuScreenJoinGame extends menuscreenjoingame;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var string FunnyName488;
var localized string l_password;
var localized string l_rules;
var localized string l_name;
var localized string l_kills;
var localized string l_ping;
var localized string l_id;
var MenuUIScrollAreaWindow FunnyName489;
var MenuUIListWindow FunnyName490;
var MenuUIEditWindow IPPassWindow;
var LargeTextWindow FunnyName491;
var MenuUIListHeaderButtonWindow btnHeaderRules;
var MenuUIListHeaderButtonWindow btnHeaderPName;
var MenuUIListHeaderButtonWindow btnHeaderPPing;
var MenuUIListHeaderButtonWindow btnHeaderPFrag;
var MenuUIListHeaderButtonWindow btnHeaderPID;
var bool bPNameOrder;
var bool bPFragOrder;
var bool bPPingOrder;
var bool bPIDOrder;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function bool ButtonActivated( Window buttonPressed )
{
	local bool bHandled;

	//
	// 0x0000: EX_LetBool
	// 0x0001:   EX_BoolVariable
	// 0x0002:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated.bHandled)
	// 0x0007:   EX_True
	// 0x0008: EX_Switch (MemSize=4)
	// 0x000A:   EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated.buttonPressed)
	// 0x000F: EX_Case (NextOffset=0x0027)
	// 0x0012:   EX_InstanceVariable (Property=DeusEx.menuscreenjoingame.HostButton)
	// 0x0017: EX_VirtualFunction (FunctionName=ProcessMenuAction,Candidate=DeusEx.MenuUIWindow.ProcessMenuAction)
	// 0x001C:   EX_ByteConst (ByteConst=1)
	// 0x001E:   EX_ObjectConst (ObjectConst=Class DXMTL152b1.MTLMenuScreenHostGame)
	// 0x0024: EX_Jump (JumpOffset=0x0127)
	// 0x0027: EX_Case (NextOffset=0x0063)
	// 0x002A:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.btnHeaderRules)
	// 0x002F: EX_JumpIfNot (JumpOffset=0x0060)
	// 0x0032:   EX_Native (iNative=130,Function=Core.Object.AndAnd_BoolBool,OperatorType=1)
	// 0x0033:     EX_Native (iNative=119,Function=Core.Object.NotEqual_ObjectObject,OperatorType=1)
	// 0x0034:       EX_InstanceVariable (Property=DeusEx.menuscreenjoingame.ServerList)
	// 0x0039:       EX_NoObject
	// 0x003B:     EX_Skip (SkipSize=0x0010)
	// 0x003E:       EX_Native (iNative=154,Function=Core.Object.EqualEqual_IntInt,OperatorType=1)
	// 0x003F:         EX_Context (SkipSize=0x0003,MemSize=0x04)
	// 0x0040:           EX_InstanceVariable (Property=DeusEx.menuscreenjoingame.ServerList)
	// 0x0048:           EX_Native (iNative=1741,Function=Extension.ListWindow.GetNumSelectedRows,OperatorType=0)
	// 0x004B:         EX_IntOne
	// 0x004E: EX_VirtualFunction (FunctionName=UpdateSelectionInfo,Candidate=DeusEx.menuscreenjoingame.UpdateSelectionInfo)
	// 0x0053:   EX_Context (SkipSize=0x0003,MemSize=0x04)
	// 0x0054:     EX_InstanceVariable (Property=DeusEx.menuscreenjoingame.ServerList)
	// 0x005C:     EX_Native (iNative=1747,Function=Extension.ListWindow.GetSelectedRow,OperatorType=0)
	// 0x0060: EX_Jump (JumpOffset=0x0127)
	// 0x0063: EX_Case (NextOffset=0x0090)
	// 0x0066:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.btnHeaderPName)
	// 0x006B: EX_LetBool
	// 0x006C:   EX_BoolVariable
	// 0x006D:     EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPNameOrder)
	// 0x0072:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x0073:     EX_BoolVariable
	// 0x0074:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPNameOrder)
	// 0x007A: EX_Context (SkipSize=0x000A,MemSize=0x00)
	// 0x007B:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.FunnyName490)
	// 0x0083:   EX_Native (iNative=1780,Function=Extension.ListWindow.SetSortColumn,OperatorType=0)
	// 0x0085:     EX_IntZero
	// 0x0086:     EX_BoolVariable
	// 0x0087:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPNameOrder)
	// 0x008D: EX_Jump (JumpOffset=0x0127)
	// 0x0090: EX_Case (NextOffset=0x00BD)
	// 0x0093:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.btnHeaderPFrag)
	// 0x0098: EX_LetBool
	// 0x0099:   EX_BoolVariable
	// 0x009A:     EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPFragOrder)
	// 0x009F:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x00A0:     EX_BoolVariable
	// 0x00A1:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPFragOrder)
	// 0x00A7: EX_Context (SkipSize=0x000A,MemSize=0x00)
	// 0x00A8:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.FunnyName490)
	// 0x00B0:   EX_Native (iNative=1780,Function=Extension.ListWindow.SetSortColumn,OperatorType=0)
	// 0x00B2:     EX_IntOne
	// 0x00B3:     EX_BoolVariable
	// 0x00B4:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPFragOrder)
	// 0x00BA: EX_Jump (JumpOffset=0x0127)
	// 0x00BD: EX_Case (NextOffset=0x00EB)
	// 0x00C0:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.btnHeaderPPing)
	// 0x00C5: EX_LetBool
	// 0x00C6:   EX_BoolVariable
	// 0x00C7:     EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPPingOrder)
	// 0x00CC:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x00CD:     EX_BoolVariable
	// 0x00CE:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPPingOrder)
	// 0x00D4: EX_Context (SkipSize=0x000B,MemSize=0x00)
	// 0x00D5:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.FunnyName490)
	// 0x00DD:   EX_Native (iNative=1780,Function=Extension.ListWindow.SetSortColumn,OperatorType=0)
	// 0x00DF:     EX_IntConstByte (IntConst=2)
	// 0x00E1:     EX_BoolVariable
	// 0x00E2:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPPingOrder)
	// 0x00E8: EX_Jump (JumpOffset=0x0127)
	// 0x00EB: EX_Case (NextOffset=0x0119)
	// 0x00EE:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.btnHeaderPID)
	// 0x00F3: EX_LetBool
	// 0x00F4:   EX_BoolVariable
	// 0x00F5:     EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPIDOrder)
	// 0x00FA:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x00FB:     EX_BoolVariable
	// 0x00FC:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPIDOrder)
	// 0x0102: EX_Context (SkipSize=0x000B,MemSize=0x00)
	// 0x0103:   EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.FunnyName490)
	// 0x010B:   EX_Native (iNative=1780,Function=Extension.ListWindow.SetSortColumn,OperatorType=0)
	// 0x010D:     EX_IntConstByte (IntConst=3)
	// 0x010F:     EX_BoolVariable
	// 0x0110:       EX_InstanceVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.bPIDOrder)
	// 0x0116: EX_Jump (JumpOffset=0x0127)
	// 0x0119: EX_Case (NextOffset=0xFFFF)
	// 0x011C: EX_LetBool
	// 0x011D:   EX_BoolVariable
	// 0x011E:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated.bHandled)
	// 0x0123:   EX_False
	// 0x0124: EX_Jump (JumpOffset=0x0127)
	// 0x0127: EX_JumpIfNot (JumpOffset=0x0144)
	// 0x012A:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x012B:     EX_BoolVariable
	// 0x012C:       EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated.bHandled)
	// 0x0132: EX_LetBool
	// 0x0133:   EX_BoolVariable
	// 0x0134:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated.bHandled)
	// 0x0139:   EX_FinalFunction (Function=DeusEx.menuscreenjoingame.ButtonActivated,OperatorType=0)
	// 0x013E:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated.buttonPressed)
	// 0x0144: EX_Return
	// 0x0145:   EX_BoolVariable
	// 0x0146:     EX_LocalVariable (Property=DXMTL152b1.MTLMenuScreenJoinGame.ButtonActivated.bHandled)
	// 0x014B: EX_Return
	// 0x014C:   EX_Nothing
	//

	#error nada
}

event bool ListSelectionChanged( Window list, int numSelections, int focusRowId )
{
	if ( list==ServerList )
	{
		if ( focusRowId==ClickRowID && JoinButton.IsSensitive() )
		{
			HandleJoinGame();
		}
		else
		{
			ClickRowID = focusRowId;
			ClickTimer = 0.0;
			UpdateSelectionInfo( focusRowId );
		}
	}
	return false;
}

function PopulateServerList()
{
	local int FunnyName497, r1;

	if ( ServerList==None )
	{
		return;
	}
	Super.PopulateServerList();
	if ( FunnyName488~="" )
	{
		return;
	}
	for ( FunnyName497=0; FunnyName497<ServerList.GetNumRows(); FunnyName497++ )
	{
		r1 = ServerList.IndexToRowId( FunnyName497 );
		if ( FunnyName488~=(ServerList.GetField(r1,6)$ServerList.GetField(r1,7)) )
		{
			ServerList.SelectRow( r1 );
			ServerList.SetFocusRow( r1 );
			break;
		}
	}
}

function UpdateGameInfo( deusexserverlist ListEntry )
{
	local int FunnyName499, FunnyName500;
	local string FunnyName501;
	local UBrowserRulesList CurrentRule;
	local UBrowserPlayerList CurrentPlayer2;

	FunnyName491.SetText( "" );
	FunnyName490.DeleteAllRows();
	if ( ListEntry==None )
	{
		return;
	}
	CurrentRule = ListEntry.RulesList;
	CurrentPlayer2 = ListEntry.PlayerList;
	if ( CurrentRule!=None )
	{
		CurrentRule = UBrowserRulesList(CurrentRule.Next);
	}
	if ( CurrentPlayer2!=None )
	{
		CurrentPlayer2 = UBrowserPlayerList(CurrentPlayer2.Next);
	}
	FunnyName499 = 0;
	while ( CurrentPlayer2!=None )
	{
		FunnyName499++;
		FunnyName501 = CurrentPlayer2.PlayerName;
		for ( FunnyName500=InStr(FunnyName501,";"); FunnyName500!=-1; FunnyName500=InStr(FunnyName501,";") )
		{
			FunnyName501 = Left( FunnyName501, FunnyName500 ) $ mid( FunnyName501, FunnyName500+1 );
		}
		FunnyName490.AddRow( FunnyName501$";"$string(CurrentPlayer2.PlayerFrags)$";"$string(CurrentPlayer2.PlayerPing)$";"$string(CurrentPlayer2.PlayerID) );
		CurrentPlayer2 = UBrowserPlayerList(CurrentPlayer2.Next);
	}
	if ( CurrentRule==None )
	{
		FunnyName499 = -1;
	}
	FunnyName501 = "";
	while ( CurrentRule!=None )
	{
		if ( FunnyName501!="" )
		{
			FunnyName501 = FunnyName501 $ "|n";
		}
		FunnyName501 = FunnyName501 $ CurrentRule.Rule $ ": " @ CurrentRule.Value;
		CurrentRule = UBrowserRulesList(CurrentRule.Next);
	}
	FunnyName491.SetText( FunnyName501 );
	if ( ServerList!=None && ServerList.GetNumSelectedRows()==1 )
	{
		FunnyName488 = ServerList.GetField( ServerList.GetSelectedRow(), 6 ) $ ServerList.GetField( ServerList.GetSelectedRow(), 7 );
		if ( FunnyName499>=0 )
		{
			ServerList.SetField( ServerList.GetSelectedRow(), 3, string(FunnyName499)$"/"$string(ListEntry.MaxPlayers) );
		}
	}
}

function CreateIPEditWindow()
{
	Super.CreateIPEditWindow();
	CreateMenuLabel( 325, 341, l_password, winClient );
	IPPassWindow = CreateMenuEditWindow( 401, 337, 115, 32, winClient );
	IPPassWindow.SetText( "" );
}

function CreateGameInfoList()
{
	btnHeaderRules = CreateHeaderButton( 143, 240, 230, l_rules, winClient );
	btnHeaderRules.textLeftMargin = 3;
	GameInfoScroll = CreateScrollAreaWindow( winClient );
	GameInfoScroll.SetPos( 144.0, 256.0 );
	GameInfoScroll.SetSize( 229.0, 72.0 );
	FunnyName491 = LargeTextWindow(GameInfoScroll.ClipWindow.NewChild(Class'LargeTextWindow'));
	FunnyName491.SetTextMargins( 0.0, 0.0 );
	FunnyName491.SetFont( Font'DeusExUI.FontMenuSmall' );
	FunnyName491.SetTextAlignments( HALIGN_Left, VALIGN_Top );
	FunnyName491.SetTextColor( Player.ThemeManager.GetCurrentMenuColorTheme().GetColorFromName('MenuColor_ListText') );
	btnHeaderPName = CreateHeaderButton( 374, 240, 110, l_name, winClient );
	btnHeaderPFrag = CreateHeaderButton( 484, 240, 44, l_kills, winClient );
	btnHeaderPPing = CreateHeaderButton( 528, 240, 44, l_ping, winClient );
	btnHeaderPID = CreateHeaderButton( 572, 240, 36, l_id, winClient );
	btnHeaderPName.textLeftMargin = 3;
	btnHeaderPFrag.textLeftMargin = 3;
	btnHeaderPPing.textLeftMargin = 3;
	btnHeaderPID.textLeftMargin = 3;
	FunnyName489 = CreateScrollAreaWindow( winClient );
	FunnyName489.SetPos( 374.0, 256.0 );
	FunnyName489.SetSize( 234.0, 72.0 );
	FunnyName490 = MenuUIListWindow(FunnyName489.ClipWindow.NewChild(Class'MenuUIListWindow'));
	FunnyName490.EnableMultiSelect( false );
	FunnyName490.EnableAutoExpandColumns( false );
	FunnyName490.SetNumColumns( 4 );
	FunnyName490.SetColumnWidth( 0, 110.0 );
	FunnyName490.SetColumnWidth( 1, 44.0 );
	FunnyName490.SetColumnWidth( 2, 44.0 );
	FunnyName490.SetColumnWidth( 3, 21.0 );
	FunnyName490.SetColumnType( 0, COLTYPE_String );
	FunnyName490.SetColumnType( 1, COLTYPE_Float, "%.0f" );
	FunnyName490.SetColumnType( 2, COLTYPE_Float, "%.0f" );
	FunnyName490.SetColumnType( 3, COLTYPE_Float, "%.0f" );
	FunnyName490.SetSortColumn( 1, true );
	FunnyName490.EnableAutoSort( true );
	FunnyName490.SetSensitivity( false );
}

function string GetExtraJoinOptions()
{
	local string FunnyName502;

	FunnyName502 = IPPassWindow.GetText();
	if ( FunnyName502!="" )
	{
		FunnyName502 = "?password=" $ FunnyName502;
	}
	return FunnyName502;
}

function CreateGamesList()
{
	Super.CreateGamesList();
	ServerScroll.SetSize( 602.0, 188.0 );
}

function bool CanShowgame( string FunnyName503 )
{
	local int FunnyName504;

	if ( bShowAllGameTypes )
	{
		return true;
	}
	for ( FunnyName504=0; FunnyName504<5; FunnyName504++ )
	{
		if ( FunnyName503~=GameClassNames[FunnyName504] )
		{
			return bShowGameTypeOne;
		}
	}
	for ( FunnyName504=5; FunnyName504<14; FunnyName504++ )
	{
		if ( FunnyName503~=GameClassNames[FunnyName504] )
		{
			return bShowGameTypeTwo;
		}
	}
	return false;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 l_password="Password"
 l_rules="Server Rules"
 l_name="Player Name"
 l_kills="Kills"
 l_ping="Ping"
 l_id="ID"
 bPFragOrder=True
 GameClassNames(1)="MTLDeathMatch"
 GameClassNames(2)="CBPDeathMatch"
 GameClassNames(3)="CBPAdvDM"
 GameClassNames(4)="CBPBasicDM"
 GameClassNames(5)="TeamDMGame"
 GameClassNames(6)="AdvTeamDMGame"
 GameClassNames(7)="BasicTeamDMGame"
 GameClassNames(8)="MTLTeam"
 GameClassNames(9)="MTLAdvTeam"
 GameClassNames(10)="MTLBasicTeam"
 GameClassNames(11)="CBPTeam"
 GameClassNames(12)="CBPAdvTeam"
 GameClassNames(13)="CBPBasicTeam"
 GameHumanNames(1)="Deathmatch MTL"
 GameHumanNames(2)="DM Custom CBP"
 GameHumanNames(3)="DM Adv. CBP"
 GameHumanNames(4)="DM Basic CBP"
 GameHumanNames(5)="Team Custom"
 GameHumanNames(6)="Team Adv."
 GameHumanNames(7)="Team Basic"
 GameHumanNames(8)="Team Custom MTL"
 GameHumanNames(9)="Team Adv. MTL"
 GameHumanNames(10)="Team Basic MTL"
 GameHumanNames(11)="Team Custom CBP"
 GameHumanNames(12)="Team Adv. CBP"
 GameHumanNames(13)="Team Basic CBP"
}
