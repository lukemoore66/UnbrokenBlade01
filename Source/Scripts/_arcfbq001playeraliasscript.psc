ScriptName _arcFBQ001PlayerAliasScript Extends ReferenceAlias

Location Property DragonBridgeLumberCampLocation Auto
Quest Property _arcFlashbackQuest001 Auto

Auto State Inactive
	;do nothing
EndState

State Stage90
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akOldLoc == DragonBridgeLumberCampLocation
			GoToState("Inactive")
			_arcFlashbackQuest001.Stop()
		EndIf
	EndEvent
EndState
