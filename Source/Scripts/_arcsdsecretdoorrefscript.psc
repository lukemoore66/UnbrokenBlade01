ScriptName _arcSDSecretDoorRefScript Extends ObjectReference

Auto State Closed
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Open")
		GetLinkedRef().SetOpen()
	EndEvent
EndState

State Open
	;do nothing
EndState
