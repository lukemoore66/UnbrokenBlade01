ScriptName _arcQuest002ArcadiaRingAliasScript Extends ReferenceAlias

Quest Property _arcQuest002 Auto
ObjectReference Property PlayerRef Auto

Auto State NotTaken
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		If akNewContainer == PlayerRef
			GoToState("Taken")
			_arcQuest002.SetStage(50)
		EndIf
	EndEvent
EndState
	
State Taken
	;do nothing
EndState
