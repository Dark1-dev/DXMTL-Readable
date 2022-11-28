//=============================================================================
// MTLMenuChoice_GameType. Rebuild with ScriptRays.
//=============================================================================
class MTLMenuChoice_GameType extends MenuUIChoiceEnum;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var MTLMenuScreenHostGame hostparent;
var string gameTypes[4];
var string gameNames[4];
var int NumGameTypes;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event InitWindow()
{
	PopulateGameTypes();
	Super.InitWindow();
	SetActionButtonWidth( 179 );
}

function PopulateGameTypes()
{
	local int typeIndex;

	for ( typeIndex=0; typeIndex<NumGameTypes; typeIndex++ )
	{
		enumText[typeIndex] = gameNames[typeIndex];
	}
}

function SaveSetting()
{
	Player.ConsoleCommand( string('Set')@configSetting@GetModuleName(CurrentValue) );
}

function LoadSetting()
{
	local string TypeString;
	local int typeIndex;

	TypeString = Player.ConsoleCommand( string('get')@configSetting );
	for ( typeIndex=0; typeIndex<NumGameTypes; typeIndex++ )
	{
		if ( TypeString==GetModuleName(typeIndex) )
		{
			SetValue( typeIndex );
		}
	}
}

function ResetToDefault()
{
	CurrentValue = defaultValue;
	SaveSetting();
	LoadSetting();
}

function string GetModuleName( int gameIndex )
{
	return gameTypes[gameIndex];
}

function SetValue( int NewValue )
{
	local Class<GameInfo> TypeClass;
	local GameInfo CurrentType;
	local bool bCanCustomize;

	Super.SetValue( NewValue );
	bCanCustomize = true;
	if ( hostparent!=None && gameTypes[NewValue]!="" )
	{
		TypeClass = Class<GameInfo>(Player.DynamicLoadObject(GetModuleName(NewValue),Class'Class'));
		if ( TypeClass!=None )
		{
			CurrentType = Player.Spawn( TypeClass );
		}
		if ( DeusExMPGame(CurrentType)!=None )
		{
			bCanCustomize = DeusExMPGame(CurrentType).bCustomizable;
		}
		hostparent.SetCustomizable( bCanCustomize );
		if ( CurrentType!=None )
		{
			CurrentType.Destroy();
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 gameTypes(0)="DXMTL152b1.MTLDeathMatch"
 gameTypes(1)="DXMTL152b1.MTLBasicTeam"
 gameTypes(2)="DXMTL152b1.MTLAdvTeam"
 gameTypes(3)="DXMTL152b1.MTLTeam"
 gameNames(0)="Deathmatch (MTL)"
 gameNames(1)="Basic Team DM (MTL)"
 gameNames(2)="Advanced Team DM (MTL)"
 gameNames(3)="Custom Team DM (MTL)"
 NumGameTypes=4
 defaultInfoWidth=243
 defaultInfoPosX=203
 HelpText="Type of game to play"
 actionText="Game Type"
 configSetting="MTLMenuScreenHostGame CurrentGameType"
}
