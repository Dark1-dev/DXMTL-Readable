//=============================================================================
// MTLMenuScreenHostGame. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuScreenHostGame extends MenuUIScreenWindow
	config(DXMTL);

//-----------------------------------------------------------------------------
// Constants.
//-----------------------------------------------------------------------------

const MODE_DEDICATED = 0;
const MODE_LISTEN = 1;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var() globalconfig string CurrentGameType;
var() globalconfig int ServerMode;
var() bool bLanOnly;
var() globalconfig string MutatorList;
var() globalconfig bool bKeepMutators;
var MTLMenuChoice_VictoryType VictoryTypeChoice;
var MTLMenuChoice_VictoryValue VictoryValueChoice;
var MTLMenuChoice_GameType GameTypeChoice;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event InitWindow()
{
	Super.InitWindow();
	MutatorList = Player.ConsoleCommand( string('get')@string('MTLMenuScreenHostGame')@string('MutatorList') );
	bKeepMutators = bool(Player.ConsoleCommand(string('get')@string('MTLMenuScreenHostGame')@string('bKeepMutators')));
	if ( !bKeepMutators )
	{
		MutatorList = "";
	}
	SetChoiceInfo();
}

function SaveSettings()
{
	local UdpServerUplink TempLink;

	Super.SaveSettings();
	Player.ConsoleCommand( string('Set')@string('MTLMenuScreenHostGame')@string('MutatorList')@MutatorList );
	Player.ConsoleCommand( string('Set')@string('MTLMenuScreenHostGame')@string('bKeepMutators')@string(bKeepMutators) );
	TempLink = Player.Spawn( Class'UdpServerUplink' );
	if ( TempLink!=None )
	{
		TempLink.DoUplink = !bLanOnly;
		TempLink.SaveConfig();
		TempLink.Destroy();
	}
}

function string GetGameType()
{
	local dxmaplist MapList;
	local string MapName;

	MapList = Player.Spawn( Class'dxmaplist' );
	if ( MapList==None )
	{
		return "";
	}
	MapName = MapList.Maps[MapList.MapNum];
	MapList.Destroy();
	return MapName;
}

function SetCustomizable( bool bCanCustomize )
{
	local Window btnChoice;
	local int iChoiceIndex;

	for ( btnChoice=winClient.GetTopChild(); btnChoice!=None; btnChoice=btnChoice.GetLowerSibling() )
	{
		if ( btnChoice.IsA('MenuUIChoice') )
		{
			iChoiceIndex = 0;
			for ( iChoiceIndex=4; iChoiceIndex<=8; iChoiceIndex++ )
			{
				if ( btnChoice.Class==choices[iChoiceIndex] )
				{
					MenuUIChoice(btnChoice).btnAction.SetSensitivity( bCanCustomize );
					if ( btnChoice.IsA('MenuUIChoiceSlider') )
					{
						MenuUIChoiceSlider(btnChoice).btnSlider.SetSensitivity( bCanCustomize );
					}
					if ( !bCanCustomize )
					{
						LockButtonSetting( MenuUIChoice(btnChoice) );
					}
				}
			}
		}
	}
}

function LockButtonSetting( MenuUIChoice SetButton )
{
	SetButton.LoadSetting();
}

function ProcessAction( string actionKey )
{
	if ( actionKey=="BEGINHOST" )
	{
		BeginHost();
	}
	if ( actionKey=="MTLSETUP" )
	{
		MTLBeginSetup();
	}
}

function MTLBeginSetup()
{
	local MTLMutatorSetupWindow winMutators;

	if ( Root!=None )
	{
		winMutators = MTLMutatorSetupWindow(Root.PushWindow(Class'MTLMutatorSetupWindow',true,true));
		winMutators.BotmatchParent = Self;
	}
}

function BeginHost()
{
	local string URL, MapName, GameType;
	local int configservermode;

	SaveSettings();
	MapName = GetGameType();
	configservermode = int(Player.ConsoleCommand(string('get')@string('MTLMenuScreenHostGame')@string('ServerMode')));
	GameType = Player.ConsoleCommand( string('get')@string('MTLMenuScreenHostGame')@string('CurrentGameType') );
	URL = MapName $ "?Game=" $ GameType;
	if ( MutatorList!="" )
	{
		URL = URL $ "?Mutator=" $ MutatorList;
	}
	if ( configservermode==0 )
	{
		Player.ConsoleCommand( "Relaunch"@URL$"?-server?log=server.log" );
	}
	else
	{
		Player.StartListenGame( URL );
	}
}

function SetChoiceInfo()
{
	local Window btnChoice;

	for ( btnChoice=winClient.GetTopChild(); btnChoice!=None; btnChoice=btnChoice.GetLowerSibling() )
	{
		if ( btnChoice.IsA('MTLMenuChoice_VictoryType') )
		{
			VictoryTypeChoice = MTLMenuChoice_VictoryType(btnChoice);
			VictoryTypeChoice.hostparent = Self;
		}
		if ( btnChoice.IsA('MTLMenuChoice_VictoryValue') )
		{
			VictoryValueChoice = MTLMenuChoice_VictoryValue(btnChoice);
		}
		if ( btnChoice.IsA('MTLMenuChoice_GameType') )
		{
			GameTypeChoice = MTLMenuChoice_GameType(btnChoice);
			GameTypeChoice.hostparent = Self;
			GameTypeChoice.SetValue( GameTypeChoice.CurrentValue );
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 ServerMode=1
 bKeepMutators=True
 choiceVerticalGap=28
 choiceStartY=17
 choices(0)=Class'DXMTL152b1.MTLMenuChoice_GameType'
 choices(1)=Class'DeusEx.menuchoice_map'
 choices(2)=Class'DeusEx.menuchoice_maxplayers'
 choices(3)=Class'DeusEx.menuchoice_friendlyfire'
 choices(4)=Class'DeusEx.menuchoice_Startingaugs'
 choices(5)=Class'DeusEx.menuchoice_augbonus'
 choices(6)=Class'DeusEx.menuchoice_skilllevel'
 choices(7)=Class'DeusEx.menuchoice_startingskills'
 choices(8)=Class'DeusEx.menuchoice_skillbonus'
 choices(9)=Class'DXMTL152b1.MTLMenuChoice_VictoryType'
 choices(10)=Class'DXMTL152b1.MTLMenuChoice_VictoryValue'
 choices(11)=Class'DeusEx.menuchoice_cycle'
 choices(12)=Class'DXMTL152b1.MTLMenuChoice_ServerMode'
 actionButtons(0)=(Align=HALIGN_Right,Action=AB_Cancel)
 actionButtons(1)=(Align=HALIGN_Right,Action=AB_Reset)
 actionButtons(2)=(Action=AB_Other,Text="Start Game",Key="BEGINHOST")
 actionButtons(3)=(Action=AB_Other,Text="Mutators",Key="MTLSETUP")
 Title="Host Multiplayer Game"
 ClientWidth=461
 ClientHeight=427
 clientTextures(0)=Texture'DeusExUI.UserInterface.MenuHostBackground_1'
 clientTextures(1)=Texture'DeusExUI.UserInterface.MenuHostBackground_2'
 clientTextures(2)=Texture'DeusExUI.UserInterface.MenuHostBackground_3'
 clientTextures(3)=Texture'DeusExUI.UserInterface.MenuHostBackground_4'
 textureCols=2
 helpPosY=377
}
