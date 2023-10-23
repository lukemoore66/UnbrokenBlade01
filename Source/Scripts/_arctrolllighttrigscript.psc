ScriptName _arcTrollLightTrigScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Waiting
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf
		
		DisableNoWait()
		
		GoToState("Complete")
		
		Activate(Self)
	EndEvent
EndState

State Complete
	;do nothing
EndState
