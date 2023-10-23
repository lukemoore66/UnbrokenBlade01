ScriptName _arcGPSQuestPullBarHighRefScript Extends ObjectReference

Quest Property _arcGuardianPinkSceneQuest Auto
ObjectReference Property PlayerRef Auto

Int Property ActivationCounter = -1 Auto Hidden

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		If _arcGuardianPinkSceneQuest.IsRunning()
			Return
		EndIf
		
		ActivationCounter += 1
		
		_arcGuardianPinkSceneQuest.Start()
	EndEvent
EndState

State Complete
	;do nothing
EndState
