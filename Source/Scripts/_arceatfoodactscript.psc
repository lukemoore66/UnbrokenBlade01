ScriptName _arcEatFoodActScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf

	GoToState("Inactive")
	
	ObjectReference CurrentLinkedRef = GetLinkedRef()
	CurrentLinkedRef.DisableNoWait()
	
	While CurrentLinkedRef
		CurrentLinkedRef = CurrentLinkedRef.GetLinkedRef()
		
		If CurrentLinkedRef
			CurrentLinkedRef.DisableNoWait()
		EndIf
	EndWhile
	
	DisableNoWait()
	EndEvent
EndState

State Inactive
	;do nothing
EndState
