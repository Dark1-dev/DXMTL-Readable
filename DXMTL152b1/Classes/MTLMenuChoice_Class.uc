//=============================================================================
// MTLMenuChoice_Class. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuChoice_Class extends MenuUIChoiceEnum;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var string ClassClasses[4];
var string ClassNames[4];
var Texture texPortraits[4];
var string enumText[4];
var const int NextPlayerIndex;
var ButtonWindow btnPortrait;
var int portraitIndex;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event InitWindow()
{
	PopulateClassChoices();
	CreatePortraitButton();
	CreateInfoButton();
	Super(MenuUIChoice).InitWindow();
	SetActionButtonWidth( 153 );
	btnAction.SetHelpText( HelpText );
	btnInfo.SetPos( 0.0, 195.0 );
}

function PopulateClassChoices()
{
	local int typeIndex;

	for ( typeIndex=0; typeIndex<4; typeIndex++ )
	{
		enumText[typeIndex] = ClassNames[typeIndex];
	}
}

function SetValue( int NewValue )
{
	CurrentValue = NewValue;
	UpdateInfoButton();
	UpdatePortrait();
}

function SaveSetting()
{
	Player.UpdateURL( "Class", GetModuleName(CurrentValue), true );
	Player.SaveConfig();
}

function LoadSetting()
{
	local string TypeString;
	local int typeIndex, FunnyName524;

	TypeString = Player.GetDefaultURL( "Class" );
	for ( typeIndex=0; typeIndex<4; typeIndex++ )
	{
		if ( TypeString~=GetModuleName(typeIndex) )
		{
			FunnyName524 = typeIndex;
			break;
		}
	}
	SetValue( FunnyName524 );
	UpdatePortrait();
}

function ResetToDefault()
{
	CurrentValue = defaultValue;
	SaveSetting();
	LoadSetting();
}

function string GetModuleName( int ClassIndex )
{
	return ClassClasses[ClassIndex];
}

function CreatePortraitButton()
{
	btnPortrait = ButtonWindow(NewChild(Class'ButtonWindow'));
	btnPortrait.SetSize( 116.0, 163.0 );
	btnPortrait.SetPos( 19.0, 27.0 );
	btnPortrait.SetBackgroundStyle( DSTY_Masked );
}

function UpdatePortrait()
{
	btnPortrait.SetBackground( texPortraits[CurrentValue] );
}

function bool ButtonActivated( Window buttonPressed )
{
	if ( buttonPressed==btnInfo )
	{
		CycleNextValue();
		return true;
	}
	else
	{
		return Super(MenuUIChoice).ButtonActivated( buttonPressed );
	}
}

function bool ButtonActivatedRight( Window buttonPressed )
{
	if ( buttonPressed==btnAction )
	{
		CyclePreviousValue();
		return true;
	}
	else
	{
		return Super(MenuUIChoice).ButtonActivated( buttonPressed );
	}
}

function CycleNextValue()
{
	local int NewValue;

	NewValue = int(GetValue()+float(1));
	if ( NewValue==4 )
	{
		NewValue = 0;
	}
	else if ( enumText[NewValue]=="" )
	{
		NewValue = 0;
	}
	SetValue( NewValue );
}

function CyclePreviousValue()
{
	local int NewValue;

	NewValue = int(GetValue()-float(1));
	if ( NewValue<0 )
	{
		NewValue = 4-1;
		while ( enumText[NewValue]=="" && NewValue>0 )
		{
			NewValue--;
		}
	}
	SetValue( NewValue );
}

function CreateInfoButton()
{
	btnInfo = MenuUIInfoButtonWindow(NewChild(Class'MenuUIInfoButtonWindow'));
	btnInfo.SetSelectability( false );
	btnInfo.SetSize( float(defaultInfoWidth), 19.0 );
	btnInfo.SetPos( float(defaultInfoPosX), 0.0 );
}

function UpdateInfoButton()
{
	btnInfo.SetButtonText( enumText[CurrentValue] );
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 ClassClasses(0)="DXMTL152b1.MTLJCDenton"
 ClassClasses(1)="DXMTL152b1.MTLNSF"
 ClassClasses(2)="DXMTL152b1.MTLUNATCO"
 ClassClasses(3)="DXMTL152b1.MTLMJ12"
 ClassNames(0)="JC Denton"
 ClassNames(1)="NSF Terrorist"
 ClassNames(2)="UNATCO Trooper"
 ClassNames(3)="Majestic-12 Agent"
 texPortraits(0)=Texture'DeusExUI.UserInterface.menuplayersetupjcdenton'
 texPortraits(1)=Texture'DeusExUI.UserInterface.menuplayersetupnsf'
 texPortraits(2)=Texture'DeusExUI.UserInterface.menuplayersetupunatco'
 texPortraits(3)=Texture'DeusExUI.UserInterface.menuplayersetupmj12'
 NextPlayerIndex=4
 defaultInfoWidth=153
 defaultInfoPosX=170
 HelpText="Model for your character in non-team games."
 actionText="Non-Team Model"
}
