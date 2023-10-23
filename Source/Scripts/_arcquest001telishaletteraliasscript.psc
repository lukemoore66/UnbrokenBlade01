ScriptName _arcQuest001TelishaLetterAliasScript Extends ReferenceAlias

Quest Property _arcQuest001 Auto

Auto State Inactive
	;do nothing
EndState

State Sent
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		GoToState("NotRead")
		GetReference().EnableNoWait()
	EndEvent
EndState

State NotRead
	Event OnRead()
		GoToState("Read")
		_arcQuest001.SetStage(130)
	EndEvent
EndState

State Read
	;do nothing
EndState
