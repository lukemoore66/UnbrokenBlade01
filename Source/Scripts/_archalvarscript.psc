ScriptName _arcHalvarScript Extends Actor

Location Property DragonBridgeFourShieldsTavernLocation Auto
Faction Property _arcTavernTrespassFaction Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == DragonBridgeFourShieldsTavernLocation && IsInFaction(_arcTavernTrespassFaction)
		MoveToPackageLocation()
	EndIf
EndEvent
