ScriptName _arcDASQuestDragonFXMarkerAliasScript Extends ReferenceAlias

ObjectReference FXMarkerRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnCellAttach()
		RegisterForSingleUpdate(Utility.RandomFloat(3.0, 10.0))
	EndEvent
	
	Event OnUpdate()
		FXMarkerRef.GetNthLinkedRef(Utility.RandomInt(1, 8)).Activate(FXMarkerRef)
		RegisterForSingleUpdate(Utility.RandomFloat(3.0, 10.0))
	EndEvent
	
	Event OnCellDetach()
		UnregisterForUpdate()
	EndEvent
EndState

Function Start()
	GoToState("Active")
	FXMarkerRef = GetReference()
	RegisterForSingleUpdate(Utility.RandomFloat(3.0, 10.0))
EndFunction

Function Stop()
	GoToState("Inactive")
	UnregisterForUpdate()
	FXMarkerRef = None
EndFunction
