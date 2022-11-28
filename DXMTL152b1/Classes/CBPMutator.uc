//=============================================================================
// CBPMutator. Rebuild with ScriptRays.
//=============================================================================
class CBPMutator extends Mutator;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var CBPMutator NextCBPMutator;
var bool bReplaceGameRelevant;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function AddCBPMutator( CBPMutator FunnyName369 )
{
	if ( NextCBPMutator==None )
	{
		NextCBPMutator = FunnyName369;
	}
	else
	{
		NextCBPMutator.AddCBPMutator( FunnyName369 );
	}
}

function ReplaceMapItem( out Actor A, Class<Actor> FunnyName370 )
{
	if ( NextCBPMutator!=None )
	{
		NextCBPMutator.ReplaceMapItem( A, FunnyName370 );
	}
}

function SpawnNotification( out Actor A, Class<Actor> FunnyName370 )
{
	if ( !FunnyName370.default.bGameRelevant || bReplaceGameRelevant )
	{
		DynamicReplacement( A, FunnyName370 );
	}
	if ( NextCBPMutator!=None )
	{
		NextCBPMutator.SpawnNotification( A, FunnyName370 );
	}
}

function DynamicReplacement( out Actor A, Class<Actor> FunnyName370 )
{
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
