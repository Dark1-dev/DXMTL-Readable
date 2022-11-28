//=============================================================================
// CBPMenuScreenCustomizeKeys. Rebuild with ScriptRays.
//=============================================================================
class CBPMenuScreenCustomizeKeys extends MenuScreenCustomizeKeys;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var string MenuValues1[65];
var string MenuValues2[65];
var localized string Functions2[4];
var string Aliases2[4];

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function BuildKeyBindings()
{
	local int i, j, pos, FunnyName507;
	local string KeyName, Alias;

	FunnyName507 = 61;
	for ( i=0; i<65; i++ )
	{
		MenuValues1[i] = "";
		MenuValues2[i] = "";
	}
	for ( i=0; i<255; i++ )
	{
		KeyName = Player.ConsoleCommand( "KEYNAME"@string(i) );
		if ( KeyName!="" )
		{
			Alias = Player.ConsoleCommand( "KEYBINDING"@KeyName );
			if ( Alias!="" )
			{
				pos = InStr( Alias, " " );
				if ( pos!=-1 )
				{
					Alias = Left( Alias, pos );
				}
				for ( j=0; j<4+FunnyName507; j++ )
				{
					if ( j<FunnyName507 && AliasNames[j]~=Alias || j>=FunnyName507 && Aliases2[j-FunnyName507]~=Alias )
					{
						if ( MenuValues1[j]=="" )
						{
							MenuValues1[j] = GetKeyDisplayNameFromKeyName( KeyName );
						}
						else if ( MenuValues2[j]=="" )
						{
							MenuValues2[j] = GetKeyDisplayNameFromKeyName( KeyName );
						}
					}
				}
			}
		}
	}
}

function ProcessKeySelection( int KeyNo, string KeyName, string keyDisplayName )
{
	local int i;
	local string SkinName;

	if ( KeyName=="" || KeyName~="Escape" || KeyNo>=112 && KeyNo<=129 || KeyNo>=48 && KeyNo<=57 || KeyName~="Tilde" || KeyName~="PrintScrn" || KeyName~="Pause" )
	{
		return;
	}
	if ( MenuValues1[Selection]==keyDisplayName || MenuValues2[Selection]==keyDisplayName )
	{
		return;
	}
	for ( i=0; i<61+4; i++ )
	{
		if ( i<61 )
		{
			SkinName = FunctionText[i];
		}
		else
		{
			SkinName = Functions2[i-61];
		}
		if ( MenuValues2[i]==keyDisplayName )
		{
			ShowHelp( Sprintf(ReassignedFromLabel,keyDisplayName,SkinName) );
			AddPending( GetKeyFromDisplayName(MenuValues2[i]) );
			MenuValues2[i] = "";
		}
		if ( MenuValues1[i]==keyDisplayName )
		{
			ShowHelp( Sprintf(ReassignedFromLabel,keyDisplayName,SkinName) );
			AddPending( GetKeyFromDisplayName(MenuValues1[i]) );
			MenuValues1[i] = MenuValues2[i];
			MenuValues2[i] = "";
		}
	}
	if ( MenuValues1[Selection]=="" )
	{
		MenuValues1[Selection] = keyDisplayName;
	}
	else if ( MenuValues2[Selection]=="" )
	{
		MenuValues2[Selection] = keyDisplayName;
	}
	else if ( CanRemapKey(MenuValues1[Selection]) )
	{
		AddPending( GetKeyFromDisplayName(MenuValues1[Selection]) );
		MenuValues1[Selection] = MenuValues2[Selection];
		MenuValues2[Selection] = keyDisplayName;
	}
	else if ( CanRemapKey(MenuValues2[Selection]) )
	{
		AddPending( GetKeyFromDisplayName(MenuValues2[Selection]) );
		MenuValues2[Selection] = keyDisplayName;
	}
	if ( Selection<61 )
	{
		SkinName = AliasNames[Selection];
	}
	else
	{
		SkinName = Aliases2[Selection-61];
	}
	AddPending( KeyName@SkinName );
	RefreshKeyBindings();
}

function PopulateKeyList()
{
	local int i;

	lstKeys.DeleteAllRows();
	for ( i=0; i<61; i++ )
	{
		lstKeys.AddRow( FunctionText[i]$";"$GetInputDisplayText(i) );
	}
	for ( i=0; i<4; i++ )
	{
		lstKeys.AddRow( Functions2[i]$";"$GetInputDisplayText(i+61) );
	}
}

function string GetInputDisplayText( int i )
{
	if ( MenuValues1[i]=="" )
	{
		return NoneText;
	}
	else if ( MenuValues2[i]!="" )
	{
		return MenuValues1[i] $ "," @ MenuValues2[i];
	}
	else
	{
		return MenuValues1[i];
	}
}

function RefreshKeyBindings()
{
	local int i;

	for ( i=0; i<61+4; i++ )
	{
		lstKeys.SetField( lstKeys.IndexToRowId(i), 1, GetInputDisplayText(i) );
	}
}

function ClearFunction()
{
	local int rowID, rowIndex;

	rowID = lstKeys.GetSelectedRow();
	if ( rowID!=0 )
	{
		rowIndex = lstKeys.RowIdToIndex( rowID );
		if ( MenuValues2[rowIndex]!="" && CanRemapKey(MenuValues2[rowIndex]) )
		{
			AddPending( GetKeyFromDisplayName(MenuValues2[rowIndex]) );
			MenuValues2[rowIndex] = "";
		}
		if ( MenuValues1[rowIndex]!="" && CanRemapKey(MenuValues1[rowIndex]) )
		{
			AddPending( GetKeyFromDisplayName(MenuValues1[rowIndex]) );
			MenuValues1[rowIndex] = MenuValues2[rowIndex];
			MenuValues2[rowIndex] = "";
		}
		RefreshKeyBindings();
	}
}

function ProcessPending()
{
	local int i;
	local FunnyName51 A;

	if ( Pending>0 )
	{
		A = Player.Spawn( Class'FunnyName51' );
		for ( i=0; i<Pending; i++ )
		{
			A.ConsoleCommand( string('Set')@string('Input')@PendingCommands[i] );
			A.ConsoleCommand( string('Set')@string('InputExt')@PendingCommands[i] );
		}
		A.Destroy();
	}
	Pending = 0;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 Functions2(0)="Pretend To Be Dead"
 Functions2(1)="Suicide"
 Functions2(2)="Display The Console"
 Functions2(3)="Toggle BehindView"
 Aliases2(0)="FeignDeath"
 Aliases2(1)="Suicide"
 Aliases2(2)="Type"
 Aliases2(3)="ToggleBehindView"
}
