ScriptName _arcSDSecretDoorEnableMarkerRefScript Extends ObjectReference

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Inactive")
		Disable()
	EndEvent
EndState

State Inactive
	;do nothing
EndState
