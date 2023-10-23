ScriptName _arcQuest001HalvarAliasScript Extends ReferenceAlias  

Location Property _arcSmugglersDenLocation Auto

State Inactive
	;do nothing
EndState

Auto State Stage70
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == _arcSmugglersDenLocation
			GoToState("Inactive")
			GetReference().Disable()
		EndIf
	EndEvent
EndState
