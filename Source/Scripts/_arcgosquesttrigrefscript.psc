ScriptName _arcGOSQuestTrigRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Quest Property _arcGuardianObjectiveSceneQuest Auto

Auto State Active
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf
		
		If !_arcGuardianObjectiveSceneQuest.Start()
			Return
		EndIf
		
		GoToState("Inactive")
		
		DisableNoWait()
	EndEvent
EndState

State Inactive
	;do nothing
EndState
