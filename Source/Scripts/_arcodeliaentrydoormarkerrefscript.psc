ScriptName _arcOdeliaEntryDoorMarkerRefScript Extends ObjectReference

Sound Property _arcOdeliaEntryDoorIntCloseSFX Auto

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		
		_arcOdeliaEntryDoorIntCloseSFX.PlayAndWait(Self)
		
		GoToState("Ready")
	EndEvent
EndState

State Busy
	;do nothing
EndState
