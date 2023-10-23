ScriptName _arcGExSQuestPullChainExtRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Quest Property _arcGuardianExitSceneQuest Auto

State Busy
	;do nothing
EndState

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Busy")
		
		PlayAnimationandWait("Pull", "Reset")
		
		;if guard exit quest is not running, start it
		If !_arcGuardianExitSceneQuest.IsRunning()
			_arcGuardianExitSceneQuest.Start()
			Return
		EndIf
		
		;the 'Ready' state is re-entered in stage 30 of _arcGuardianExitSceneQuest
	EndEvent
EndState
