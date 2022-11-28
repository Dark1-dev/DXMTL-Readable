//=============================================================================
// CBPCarcass. Rebuild with ScriptRays.
//=============================================================================
class CBPCarcass extends DeusExCarcass;

//-----------------------------------------------------------------------------
// Properties.
//-----------------------------------------------------------------------------

var bool FunnyName384;
var bool FunnyName385;
var bool FunnyName386;

//-----------------------------------------------------------------------------
// Network replication.
//-----------------------------------------------------------------------------

replication
{
	reliable if ( int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName385;

	reliable if ( bNetInitial && int(Role)==int(ENetRole.ROLE_Authority) )
		FunnyName386;
}

//-----------------------------------------------------------------------------
// Global Functions.
//-----------------------------------------------------------------------------

function Initfor( Actor Other )
{
	FunnyName96( Other );
	SetScaleGlow();
	Super.Initfor( Other );
}

function Destroyed()
{
	local Inventory FunnyName199;

	while ( Inventory!=None )
	{
		FunnyName199 = Inventory;
		DeleteInventory( FunnyName199 );
		FunnyName199.Destroy();
	}
	Super.Destroyed();
}

final function FunnyName96( Actor A )
{
	local int keyIndex;
	local Mesh FunnyName369;

	if ( A==None || FunnyName384 )
	{
		return;
	}
	FunnyName369 = A.Mesh;
	if ( FunnyName369==LodMesh'MPCharacters.mp_jumpsuit' )
	{
		FunnyName369 = LodMesh'DeusExCharacters.GM_Jumpsuit';
	}
	Mesh = Mesh(DynamicLoadObject(string(FunnyName369)$"_Carcass",Class'Mesh',true));
	Mesh2 = Mesh(DynamicLoadObject(string(FunnyName369)$"_CarcassB",Class'Mesh',true));
	Mesh3 = Mesh(DynamicLoadObject(string(FunnyName369)$"_CarcassC",Class'Mesh',true));
	if ( Mesh==None )
	{
		Mesh = Mesh(DynamicLoadObject(string(FunnyName369)$string('Carcass'),Class'Mesh',true));
	}
	if ( Mesh==None )
	{
		Mesh = FunnyName369;
	}
	if ( Mesh2==None )
	{
		Mesh2 = Mesh;
	}
	if ( Mesh3==None )
	{
		Mesh3 = Mesh;
	}
	if ( Region.Zone.bWaterZone )
	{
		Mesh = Mesh3;
	}
	for ( keyIndex=0; keyIndex<8; keyIndex++ )
	{
		MultiSkins[keyIndex] = A.MultiSkins[keyIndex];
	}
	if ( A.IsA('MTLPlayer') && MTLPlayer(A).FunnyName125 )
	{
		MultiSkins[5] = MTLPlayer(A).FunnyName108[0];
		MultiSkins[6] = MTLPlayer(A).FunnyName108[1];
		MultiSkins[7] = MTLPlayer(A).FunnyName108[2];
	}
	Texture = A.Texture;
	DrawScale = A.DrawScale;
	Fatness = A.Fatness;
}

simulated final function FunnyName1()
{
	local vector HitLocation, HitNormal, FunnyName387;
	local BloodPool FunnyName388;

	if ( !bNotDead && !Region.Zone.bWaterZone )
	{
		FunnyName385 = true;
		if ( int(Level.NetMode)==int(ENetMode.NM_DedicatedServer) )
		{
			return;
		}
		FunnyName387 = Location-vect(0.0,0.0,320.0);
		Trace( HitLocation, HitNormal, FunnyName387, Location, false );
		FunnyName388 = Spawn( Class'BloodPool', , , HitLocation+HitNormal, Rotator(HitNormal) );
		if ( FunnyName388!=None )
		{
			FunnyName388.maxDrawScale = CollisionRadius*0.0225;
			if ( FunnyName386 )
			{
				FunnyName388.Time = 100.0;
				FunnyName388.DrawScale = FunnyName388.maxDrawScale;
				FunnyName388.ReattachDecal( vect(0.1,0.1,0.0) );
			}
		}
	}
}

//-----------------------------------------------------------------------------
// state Dead.
//-----------------------------------------------------------------------------

auto simulated state Dead
{
	function HandleLanding()
	{
		if ( !bNotDead )
		{
			AIStartEvent( 'Food', EAITYPE_Visual );
		}
		if ( !bAnimalCarcass )
		{
			SetCollisionSize( 40.0, default.CollisionHeight );
		}
		if ( bEmitCarcass )
		{
			AIStartEvent( 'Carcass', EAITYPE_Visual );
		}
		FunnyName1();
	}

Begin:

Begin:
	if ( int(Role)==int(ENetRole.ROLE_Authority) )
	{
		while ( int(Physics)==int(EPhysics.PHYS_Falling) )
		{
			Sleep( 1.0 );
		}
		HandleLanding();
		Sleep( 4.0 );
		FunnyName386 = true;
	}
	else
	{
		while ( !FunnyName385 )
		{
			Sleep( 1.0 );
		}
		Sleep( 0.2 );
		FunnyName1();
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

defaultproperties
{
 Mesh2=LodMesh'DeusExItems.TestBox'
 Mesh3=LodMesh'DeusExItems.TestBox'
 Texture=Texture'DeusExItems.Skins.PinkMaskTex'
 Mesh=LodMesh'DeusExItems.TestBox'
 CollisionRadius=40.000000
}
