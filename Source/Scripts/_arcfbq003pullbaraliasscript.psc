ScriptName _arcFBQ003PullBarAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		ObjectReference PuzzleDoorDelayActRef = GetReference().GetLinkedRef()
		
		PuzzleDoorDelayActRef.Activate(PuzzleDoorDelayActRef)
	EndEvent
EndState
