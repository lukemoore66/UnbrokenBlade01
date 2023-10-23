ScriptName _arcEivindBehaviourPlayerAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcEivindBehaviourQuest Auto
Location Property DragonBridgeLocation Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If PlayerRef.IsInLocation(DragonBridgeLocation) == False
		_arcEivindBehaviourQuest.Stop()
	EndIf
EndEvent
