ScriptName _arcGPSQuestPullBarLowAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcGuardianPinkSceneQuest Auto

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		Utility.Wait(1.0)
		
		_arcGuardianPinkSceneQuest.SetStage(90)
	EndEvent
EndState
