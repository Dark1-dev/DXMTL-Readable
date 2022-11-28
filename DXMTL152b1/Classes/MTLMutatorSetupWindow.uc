//=============================================================================
// MTLMutatorSetupWindow. Rebuild with ScriptRays.
//=============================================================================
class MTLMutatorSetupWindow extends ToolWindow;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var string FunnyName58;
var int NumMutatorClasses;
var MTLMenuScreenHostGame BotmatchParent;
var ToolCheckboxWindow btnKeepCheck;
var ToolListWindow lstMutators;
var ToolButtonWindow btnSave;
var ToolButtonWindow btnCancel;
var ToolButtonWindow btnUp1;
var ToolButtonWindow btnDown1;
var string mList1[200];
var string mClass1[200];
var string FunnyName513;
var bool FunnyName514;
var localized string l_title;
var localized string l_check;
var localized string l_save;
var localized string l_up;
var localized string l_down;
var localized string l_cancel;
var localized string l_yes;
var localized string l_no;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

event InitWindow()
{
	Super.InitWindow();
	SetSize( 500.0, 435.0 );
	SetTitle( l_title );
	FunnyName513 = Player.ConsoleCommand( string('get')@string('MTLMenuScreenHostGame')@string('MutatorList') );
	FunnyName514 = bool(Player.ConsoleCommand(string('get')@string('MTLMenuScreenHostGame')@string('bKeepMutators')));
	FunnyName8();
	FunnyName10();
}

function FunnyName8()
{
	lstMutators = CreateToolList( 6, 40, 484, 360 );
	lstMutators.SetColumns( 3 );
	lstMutators.SetSortColumn( 1 );
	lstMutators.HideColumn( 2 );
	lstMutators.EnableMultiSelect( false );
	lstMutators.EnableAutoExpandColumns( true );
	lstMutators.EnableAutoSort( false );
	btnKeepCheck = ToolCheckboxWindow(NewChild(Class'ToolCheckboxWindow'));
	btnKeepCheck.SetText( l_check );
	btnKeepCheck.SetPos( 9.0, 23.0 );
	btnKeepCheck.SetSize( 300.0, 17.0 );
	btnKeepCheck.SetToggle( FunnyName514 );
	btnSave = CreateToolButton( 40, 405, l_save );
	btnUp1 = CreateToolButton( 155, 405, l_up );
	btnDown1 = CreateToolButton( 270, 405, l_down );
	btnCancel = CreateToolButton( 385, 405, l_cancel );
}

function FunnyName3( int swapnum, int index1m )
{
	local int index2, newindex2, row2, newrow2;
	local string swapstring2;
	local int k;

	if ( swapnum==0 )
	{
		return;
	}
	if ( index1m!=-1 )
	{
		index2 = Clamp( index1m, 0, NumMutatorClasses-1 );
		row2 = lstMutators.IndexToRowId( index2 );
	}
	else
	{
		if ( lstMutators.GetNumSelectedRows()!=1 )
		{
			return;
		}
		row2 = lstMutators.GetSelectedRow();
		index2 = lstMutators.RowIdToIndex( row2 );
	}
	newindex2 = index2+swapnum;
	newindex2 = Clamp( newindex2, 0, NumMutatorClasses-1 );
	newrow2 = lstMutators.IndexToRowId( newindex2 );
	if ( index2==newindex2 )
	{
		return;
	}
	for ( k=0; k<lstMutators.GetNumColumns(); k++ )
	{
		swapstring2 = lstMutators.GetField( row2, k );
		lstMutators.SetField( row2, k, lstMutators.GetField(newrow2,k) );
		lstMutators.SetField( newrow2, k, swapstring2 );
	}
	swapstring2 = mList1[index2];
	mList1[index2] = mList1[newindex2];
	mList1[newindex2] = swapstring2;
	swapstring2 = mClass1[index2];
	mClass1[index2] = mClass1[newindex2];
	mClass1[newindex2] = swapstring2;
	if ( index1m==-1 )
	{
		lstMutators.SelectRow( newrow2 );
	}
}

function bool ButtonActivated( Window buttonPressed )
{
	local bool bHandled;

	//
	// 0x0000: EX_LetBool
	// 0x0001:   EX_BoolVariable
	// 0x0002:     EX_LocalVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.ButtonActivated.bHandled)
	// 0x0007:   EX_True
	// 0x0008: EX_Switch (MemSize=4)
	// 0x000A:   EX_LocalVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.ButtonActivated.buttonPressed)
	// 0x000F: EX_Case (NextOffset=0x002A)
	// 0x0012:   EX_InstanceVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.btnUp1)
	// 0x0017: EX_VirtualFunction (FunctionName=FunnyName3,Candidate=DXMTL152b1.MTLMutatorSetupWindow.FunnyName3)
	// 0x001C:   EX_IntConst (IntConst=-1)
	// 0x0021:   EX_IntConst (IntConst=-1)
	// 0x0027: EX_Jump (JumpOffset=0x0089)
	// 0x002A: EX_Case (NextOffset=0x0041)
	// 0x002D:   EX_InstanceVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.btnDown1)
	// 0x0032: EX_VirtualFunction (FunctionName=FunnyName3,Candidate=DXMTL152b1.MTLMutatorSetupWindow.FunnyName3)
	// 0x0037:   EX_IntOne
	// 0x0038:   EX_IntConst (IntConst=-1)
	// 0x003E: EX_Jump (JumpOffset=0x0089)
	// 0x0041: EX_Case (NextOffset=0x0061)
	// 0x0044:   EX_InstanceVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.btnSave)
	// 0x0049: EX_VirtualFunction (FunctionName=SaveConfigs,Candidate=DXMTL152b1.MTLMutatorSetupWindow.SaveConfigs)
	// 0x004F: EX_Context (SkipSize=0x0006,MemSize=0x04)
	// 0x0050:   EX_InstanceVariable (Property=DeusEx.DeusExBaseWindow.Root)
	// 0x0058:   EX_VirtualFunction (FunctionName=PopWindow,Candidate=DeusEx.DeusExRootWindow.PopWindow)
	// 0x005E: EX_Jump (JumpOffset=0x0089)
	// 0x0061: EX_Case (NextOffset=0x007B)
	// 0x0064:   EX_InstanceVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.btnCancel)
	// 0x0069: EX_Context (SkipSize=0x0006,MemSize=0x04)
	// 0x006A:   EX_InstanceVariable (Property=DeusEx.DeusExBaseWindow.Root)
	// 0x0072:   EX_VirtualFunction (FunctionName=PopWindow,Candidate=DeusEx.DeusExRootWindow.PopWindow)
	// 0x0078: EX_Jump (JumpOffset=0x0089)
	// 0x007B: EX_Case (NextOffset=0xFFFF)
	// 0x007E: EX_LetBool
	// 0x007F:   EX_BoolVariable
	// 0x0080:     EX_LocalVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.ButtonActivated.bHandled)
	// 0x0085:   EX_False
	// 0x0086: EX_Jump (JumpOffset=0x0089)
	// 0x0089: EX_JumpIfNot (JumpOffset=0x00A6)
	// 0x008C:   EX_Native (iNative=129,Function=Core.Object.Not_PreBool,OperatorType=2)
	// 0x008D:     EX_BoolVariable
	// 0x008E:       EX_LocalVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.ButtonActivated.bHandled)
	// 0x0094: EX_LetBool
	// 0x0095:   EX_BoolVariable
	// 0x0096:     EX_LocalVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.ButtonActivated.bHandled)
	// 0x009B:   EX_FinalFunction (Function=DeusEx.ToolWindow.ButtonActivated,OperatorType=0)
	// 0x00A0:     EX_LocalVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.ButtonActivated.buttonPressed)
	// 0x00A6: EX_Return
	// 0x00A7:   EX_BoolVariable
	// 0x00A8:     EX_LocalVariable (Property=DXMTL152b1.MTLMutatorSetupWindow.ButtonActivated.bHandled)
	// 0x00AD: EX_Return
	// 0x00AE:   EX_Nothing
	//

	#error nada
}

function SaveConfigs()
{
	local string FunnyName515;
	local int i, Row;

	for ( i=0; i<NumMutatorClasses; i++ )
	{
		Row = lstMutators.IndexToRowId( i );
		if ( lstMutators.GetField(Row,0)~=l_yes )
		{
			if ( FunnyName515=="" )
			{
				FunnyName515 = lstMutators.GetField( Row, 2 );
			}
			else
			{
				FunnyName515 = FunnyName515 $ "," $ lstMutators.GetField( Row, 2 );
			}
		}
	}
	BotmatchParent.MutatorList = FunnyName515;
	BotmatchParent.bKeepMutators = btnKeepCheck.GetToggle();
	BotmatchParent.SaveSettings();
}

function int FunnyName9( string FunnyName516 )
{
	local int keyIndex;

	for ( keyIndex=0; keyIndex<NumMutatorClasses; keyIndex++ )
	{
		if ( mClass1[keyIndex]~=FunnyName516 )
		{
			return keyIndex;
		}
	}
	return -1;
}

function FunnyName10()
{
	local string FunnyName515, NextMutator, NextDesc;
	local int k, i, topswapindex;

	NumMutatorClasses = 0;
	Player.GetNextIntDesc( FunnyName58, NumMutatorClasses, NextMutator, NextDesc );
	while ( NextMutator!="" && NumMutatorClasses<200 )
	{
		mClass1[NumMutatorClasses] = NextMutator;
		k = InStr( NextDesc, ";" );
		if ( k==-1 )
		{
			mList1[NumMutatorClasses] = NextDesc;
		}
		else
		{
			mList1[NumMutatorClasses] = Left( NextDesc, k );
		}
		NumMutatorClasses++;
		Player.GetNextIntDesc( FunnyName58, NumMutatorClasses, NextMutator, NextDesc );
	}
	lstMutators.DeleteAllRows();
	for ( i=0; i<NumMutatorClasses; i++ )
	{
		lstMutators.AddRow( l_no$";"$mList1[i]$";"$mClass1[i] );
	}
	FunnyName515 = FunnyName513;
	topswapindex = 0;
	while ( FunnyName515!="" )
	{
		k = InStr( FunnyName515, "," );
		if ( k==-1 )
		{
			NextMutator = FunnyName515;
			FunnyName515 = "";
		}
		else
		{
			NextMutator = Left( FunnyName515, k );
			FunnyName515 = mid( FunnyName515, k+1 );
		}
		i = FunnyName9( NextMutator );
		if ( i!=-1 )
		{
			lstMutators.SetField( lstMutators.IndexToRowId(i), 0, l_yes );
			FunnyName3( topswapindex-i, i );
			topswapindex++;
		}
		else
		{
			Log( "Unknown mutator in mutator list: "$NextMutator, 'DXMTL' );
		}
	}
}

event bool ListRowActivated( Window list, int rowId )
{
	local ListWindow FunnyName517;

	FunnyName517 = ListWindow(list);
	if ( FunnyName517.GetField(rowId,0)~=l_no )
	{
		FunnyName517.SetField( rowId, 0, l_yes );
	}
	else
	{
		FunnyName517.SetField( rowId, 0, l_no );
	}
	return false;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 FunnyName58="Engine.Mutator"
 l_title="Configure Mutators"
 l_check="|&Always use these mutators"
 l_save="|&Save Config"
 l_up="|&Up"
 l_down="|&Down"
 l_cancel="|&Cancel"
 l_yes="Yes"
 l_no="No"
}
