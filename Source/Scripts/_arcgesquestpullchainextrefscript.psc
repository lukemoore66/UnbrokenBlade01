ScriptName _arcGESQuestPullChainExtRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Quest Property _arcGuardianEntrySceneQuest Auto
Quest Property _arcGuardianObjectiveSceneQuest Auto
Bool Property BlockActivation = False Auto Hidden

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Busy")
		
		PlayAnimationandWait("Pull", "Reset")
		
		;if the player is inside odelia
		;return here and set state to ready
		If BlockActivation
			GoToState("Ready")
			Return
		EndIf
		
		;if the entry scene already is running, return here
		;the state will reset to Ready at the end of the quest
		If _arcGuardianEntrySceneQuest.IsRunning()
			Return
		EndIf
		
		;if the objective quest is running
		;set to ready and return here
		If _arcGuardianObjectiveSceneQuest.IsRunning()
			GoToState("Ready")
			Return
		EndIf
		
		;otherwise, start the entry scene quest
		;the state will reset to Ready at the end of the quest
		_arcGuardianEntrySceneQuest.Start()
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		BlockActivation(True)
		
		PlayAnimationandWait("Pull", "Reset")
		
		BlockActivation(False)
	EndEvent
EndState
