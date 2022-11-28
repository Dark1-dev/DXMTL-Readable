//=============================================================================
// CBPSkillManager. Rebuild with ScriptRays.
//=============================================================================
class CBPSkillManager extends SkillManager;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function CreateSkills( DeusExPlayer newPlayer )
{
	local Skill aSkill;

	FunnyName7();
	Super.CreateSkills( newPlayer );
	for ( aSkill=FirstSkill; aSkill!=None; aSkill=aSkill.Next )
	{
		aSkill.NetPriority = 1.4;
	}
}

function Destroyed()
{
	FunnyName7();
	Super.Destroyed();
}

final function FunnyName7()
{
	local Skill FunnyName173;

	for ( FunnyName173=FirstSkill; FunnyName173!=None; FunnyName173=FunnyName173.Next )
	{
		FunnyName173.Destroy();
	}
	FirstSkill = None;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 NetPriority=1.400000
}
