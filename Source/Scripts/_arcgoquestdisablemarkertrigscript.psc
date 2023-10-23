ScriptName _arcGOQuestDisableMarkerTrigScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	DisableNoWait()
EndEvent
