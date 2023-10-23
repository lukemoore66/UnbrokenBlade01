ScriptName _arcMessengerOfDeathActScript Extends ObjectReference

ObjectReference Property PlayerRef Auto 
Keyword Property _arcMODQuestKeyword Auto
Int Property TriggerNumber = 0 Auto

Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		_arcMODQuestKeyword.SendStoryEvent(akRef1 = Self, aiValue1 = TriggerNumber)
		
		GoToState("Active")
	EndEvent
	
	;the following reinitializes the trigger
	;if the player enters it from a near load door
	Event OnCellAttach()
		If !IsDisabled()
			Disable()
			Enable()
		EndIf
	EndEvent
EndState

State Inactive
	;do nothing
EndState
