ScriptName _arcShaftLeverRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		Utility.Wait(2.0)
		
		GetLinkedRef().Activate(Self)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
