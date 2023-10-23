ScriptName _arcSDSecretDoorOpenTrigScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef == PlayerRef
			GoToState("Inactive")
			Activate(Self)
		EndIf
	EndEvent
EndState

State Inactive
	;do nothing
EndState
