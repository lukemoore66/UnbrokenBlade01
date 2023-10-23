ScriptName _arcAutoSaveTrigScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Bool Property RequestFullSave = False Auto

State Inactive
	;do nothing
EndState

Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef == PlayerRef
			GoToState("Inactive")
			
			If RequestFullSave
				Game.RequestSave()
			Else
				Game.RequestAutoSave()
			EndIf
		EndIf
	EndEvent
EndState
