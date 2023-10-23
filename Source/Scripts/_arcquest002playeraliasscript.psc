ScriptName _arcQuest002PlayerAliasScript Extends ReferenceAlias

Quest Property _arcQuest002 Auto
Location Property _arcSmugglersDenLocation Auto
Location Property DragonBridgeLocation Auto
Location Property DragonBridgeFourShieldsTavernLocation Auto

Auto State Inactive
	;do nothing
EndState

State Stage10
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == _arcSmugglersDenLocation
			GoToState("Inactive")
			_arcQuest002.SetStage(20)
		EndIf
	EndEvent
EndState

State Stage70
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akOldLoc == _arcSmugglersDenLocation
			GoToState("Inactive")
			_arcQuest002.SetStage(80)
		EndIf
	EndEvent
EndState

State Stage80
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == DragonBridgeLocation
			GoToState("Inactive")
			_arcQuest002.SetStage(110)
		EndIf
	EndEvent
EndState
