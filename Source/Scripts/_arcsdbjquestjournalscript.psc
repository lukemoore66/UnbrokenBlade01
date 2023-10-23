ScriptName _arcSDBJQuestJournalScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcSDBossJournalQuest Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer != PlayerRef
		Return
	EndIf
	
	;this will complete the quest
	_arcSDBossJournalQuest.SetStage(0)
EndEvent
