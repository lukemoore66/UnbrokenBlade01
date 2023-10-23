ScriptName _arcTortureSecretDoorPullBarRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Complete")
		
		UTility.Wait(1.0)
		
		GetLinkedRef().Activate(Self)
	EndEvent
EndState

State Complete
	;do nothing
EndState
