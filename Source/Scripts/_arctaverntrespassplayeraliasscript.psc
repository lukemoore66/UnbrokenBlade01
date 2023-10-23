ScriptName _arcTavernTrespassPlayerAliasScript Extends ReferenceAlias

Location Property DragonBridgeFourShieldsTavernLocation Auto
Quest Property _arcTavernTrespassQuest Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akOldLoc == DragonBridgeFourShieldsTavernLocation
		_arcTavernTrespassQuest.Stop()
	EndIf
EndEvent
