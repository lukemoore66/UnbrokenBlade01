ScriptName _arcToggleLightTrigScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Bool Property IsOn = False Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	IsOn = True
	
	Activate(Self)
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	IsOn = False
	
	Activate(Self)
EndEvent

Event OnCellDetach()
	IsOn = False
	
	Activate(Self)
EndEvent
