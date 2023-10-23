ScriptName _arcQuest001RingAliasScript Extends ReferenceAlias

_arcQuest001Script Property _arcQuest001 Auto
ObjectReference Property PlayerRef Auto
ReferenceAlias Property TelishaLockbox Auto

Auto State NotTaken
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		If akNewContainer == PlayerRef
			GoToState("Taken")
			_arcQuest001.RingGiver = 2
			_arcQuest001.SetStage(70)
		EndIf
	EndEvent
EndState

State Taken
	;do nothing
EndState
