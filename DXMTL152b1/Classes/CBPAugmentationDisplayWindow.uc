//=============================================================================
// CBPAugmentationDisplayWindow. Rebuild with ScriptRays.
//=============================================================================
class CBPAugmentationDisplayWindow extends AugmentationDisplayWindow;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function SetSkins( Actor actor, out Texture oldSkins[9] )
{
	local int i;

	for ( i=0; i<8; i++ )
	{
		oldSkins[i] = actor.MultiSkins[i];
	}
	oldSkins[i] = actor.Skin;
	if ( actor.Mesh!=None )
	{
		for ( i=0; i<8; i++ )
		{
			actor.MultiSkins[i] = GetGridTexture( actor.GetMeshTexture(i) );
		}
	}
	else
	{
		for ( i=0; i<8; i++ )
		{
			actor.MultiSkins[i] = None;
		}
	}
	actor.Skin = GetGridTexture( oldSkins[i] );
}

function GetTargetReticleColor( Actor target, out Color xcolor )
{
	if ( Player!=None && Player.PlayerReplicationInfo!=None )
	{
		if ( !target.IsA('DeusExPlayer') || DeusExPlayer(target).PlayerReplicationInfo!=None )
		{
			Super.GetTargetReticleColor( target, xcolor );
		}
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
