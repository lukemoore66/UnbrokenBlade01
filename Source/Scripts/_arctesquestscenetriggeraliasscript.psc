ScriptName _arcTESQuestSceneTriggerAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcThalmorEmbassySceneQuest Auto

Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef == PlayerRef
			GoToState("Inactive")
			_arcThalmorEmbassySceneQuest.SetStage(10)
		EndIf
	EndEvent
EndState

State Inactive
	;do nothing
EndState
