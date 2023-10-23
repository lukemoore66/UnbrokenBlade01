ScriptName _arcForgePedestalRefScript Extends ObjectReference

Form Property _arcBronzeBook Auto
Keyword Property LinkCustom01 Auto

Bool BookMounted = False

Auto State Waiting
	Event OnTriggerLeave(ObjectReference akTriggerRef)
		If akTriggerRef.GetBaseObject() != _arcBronzeBook
			Return
		EndIf
		
		GoToState("Complete")
		
		GetLinkedRef().Activate(Self)
	EndEvent
EndState

State Complete
	;do nothing
EndState
