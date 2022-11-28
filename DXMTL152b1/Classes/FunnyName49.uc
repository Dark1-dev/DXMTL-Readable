//=============================================================================
// FunnyName49. Rebuild with ScriptRays.
//=============================================================================
class FunnyName49 extends SpawnNotify;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function PreBeginPlay()
{
}

final function FunnyName1()
{
	local Actor A;

	foreach AllActors( Class'Actor', A )
	{
		CBPMutator(Level.Game.BaseMutator).ReplaceMapItem( A, A.Class );
	}
}

event Actor SpawnNotification( Actor A )
{
	CBPMutator(Level.Game.BaseMutator).SpawnNotification( A, A.Class );
	return A;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 RemoteRole=ROLE_None
}
