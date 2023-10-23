ScriptName _arcMODQuestExtraTrigRefScript Extends ObjectReference  

ObjectReference Property PlayerRef Auto
Quest Property _arcMessengerOfDeathQuest Auto

Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		If !_arcMessengerOfDeathQuest.IsRunning()
			Return
		EndIf
		
		GoToState("Inactive")
		
		_arcMessengerOfDeathQuest.SetStage(20)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
