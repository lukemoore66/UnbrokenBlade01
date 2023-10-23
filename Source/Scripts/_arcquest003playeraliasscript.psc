ScriptName _arcQuest003PlayerAliasScript Extends ReferenceAlias

Location Property DragonBridgeLumberCampLocation Auto
Location Property _arcOdeliaLocation Auto
Quest Property _arcQuest003 Auto

Auto State Inactive
	;do nothing
EndState

State Stage0
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == DragonBridgeLumberCampLocation
			GoToState("Inactive")
			_arcQuest003.SetStage(10)
		EndIf
	EndEvent
EndState

State Stage60
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akOldLoc == DragonBridgeLumberCampLocation
			GoToState("Inactive")
			_arcQuest003.SetStage(120)
		EndIf
	EndEvent
EndState

State Stage120
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == _arcOdeliaLocation
			GoToState("Inactive")
			_arcQuest003.SetStage(210)
		EndIf
	EndEvent
EndState
