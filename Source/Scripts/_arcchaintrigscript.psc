ScriptName _arcChainTrigScript Extends ObjectReference

Int Property ReleaseCount = 0 Auto Hidden

ObjectReference Property PlayerRef Auto

Auto State Active
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf
		
		If ReleaseCount < 7
			Return
		EndIf
		
		GoToState("Inactive")
		
		;this activates each of the draugr via parent activation
		;causing them to be banished and moved into their respective
		;sarcophagi
		;it also activates the glow reference
		Activate(Self)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
