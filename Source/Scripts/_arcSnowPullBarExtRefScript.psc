ScriptName _arcSnowPullBarExtRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Keyword Property LinkCustom01 Auto

Auto State Closed
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
	
		GoToState("Opened")
		
		GetLinkedRef(LinkCustom01).Activate(Self)
	EndEvent
EndState

State Opened
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		BlockActivation(True)
		
		Utility.Wait(1.0)
	
		GetLinkedRef().Activate(Self)
		
		BlockActivation(False)
	EndEvent
EndState
