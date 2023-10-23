ScriptName _arcBronzeDragonClawScript Extends ObjectReference

Quest Property _arcBronzeDragonClawQuest Auto

Auto State Active
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		GoToState("Inactive")
		
		_arcBronzeDragonClawQuest.Start()
	EndEvent
EndState

State Inactive
	;do nothing
EndState
