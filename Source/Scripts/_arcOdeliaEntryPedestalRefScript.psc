ScriptName _arcOdeliaEntryPedestalRefScript Extends ObjectReference

Form Property _arcBoneHumanSkullFull Auto

Auto State Waiting
	Event OnTriggerLeave(ObjectReference akTriggerRef)
		If akTriggerRef.GetBaseObject() != _arcBoneHumanSkullFull
			Return
		EndIf
		
		GoToState("Complete")
		
		GetLinkedRef().Activate(Self)
	EndEvent
EndState

State Complete
	;do nothing
EndState
