//=============================================================================
// CBPAugmentationManager. Rebuild with ScriptRays.
//=============================================================================
class CBPAugmentationManager extends AugmentationManager;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function CreateAugmentations( DeusExPlayer newPlayer )
{
	local Augmentation anAug;

	FunnyName7();
	Super.CreateAugmentations( newPlayer );
	for ( anAug=FirstAug; anAug!=None; anAug=anAug.Next )
	{
		anAug.NetPriority = 1.4;
	}
}

function Destroyed()
{
	FunnyName7();
	Super.Destroyed();
}

final function FunnyName7()
{
	ResetAugmentations();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 augClasses(12)=Class'DXMTL152b1.CBPAugLight'
 defaultAugs(0)=Class'DXMTL152b1.CBPAugLight'
 NetPriority=1.400000
}
