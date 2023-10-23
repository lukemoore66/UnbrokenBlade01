ScriptName _arcTrapShaftDoorDelayRefScript Extends ObjectReference

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Inactive")
		
		GetLinkedRef().Lock(False)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
