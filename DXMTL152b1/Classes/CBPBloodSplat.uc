//=============================================================================
// CBPBloodSplat. Rebuild with ScriptRays.
//=============================================================================
class CBPBloodSplat extends BloodSplat;

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function BeginPlay()
{
	local float FunnyName340;

	if ( int(Level.NetMode)==int(ENetMode.NM_DedicatedServer) || Class'GameInfo'.default.bLowGore )
	{
		Destroy();
		return;
	}
	FunnyName340 = FRand();
	if ( FunnyName340<0.25 )
	{
		Texture = Texture'DeusExItems.Skins.FlatFXTex3';
	}
	else if ( FunnyName340<0.5 )
	{
		Texture = Texture'DeusExItems.Skins.FlatFXTex5';
	}
	else if ( FunnyName340<0.75 )
	{
		Texture = Texture'DeusExItems.Skins.FlatFXTex6';
	}
	DrawScale += (FRand()-0.5)*0.4;
	Super(Decal).BeginPlay();
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
}
