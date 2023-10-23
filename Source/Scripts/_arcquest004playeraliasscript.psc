ScriptName _arcQuest004PlayerAliasScript Extends ReferenceAlias

Location Property _arcOdeliaLocation Auto
Quest Property _arcQuest004 Auto

Auto State Inactive
	;do nothing
EndState

State Stage80
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc != _arcOdeliaLocation
			GoToState("Inactive")
			
			Utility.Wait(3.0)
			
			_arcQuest004.SetStage(90)
		EndIf
	EndEvent
EndState
