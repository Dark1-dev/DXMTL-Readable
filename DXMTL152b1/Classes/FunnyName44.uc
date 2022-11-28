//=============================================================================
// FunnyName44. Rebuild with ScriptRays.
//=============================================================================
class FunnyName44 extends Keypoint;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var float FunnyName97;
var bool FunnyName341;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function PreBeginPlay()
{
}

function PostPostBeginPlay()
{
	SetCollision( true, true, true );
}

function Timer()
{
	FunnyName341 = false;
	SetCollision( true, true, true );
}

function Trigger( Actor A, Pawn Player )
{
	if ( !FunnyName341 )
	{
		FunnyName341 = true;
		SetCollision( false, false, false );
		SetTimer( FunnyName97, false );
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 FunnyName97=28.000000
 bStatic=False
 bAlwaysRelevant=True
 CollisionRadius=60.000000
 CollisionHeight=45.000000
 NetPriority=2.000000
}
