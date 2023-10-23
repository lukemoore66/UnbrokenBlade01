ScriptName _arcSnowTrigRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Bool Property InTrigger = False Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	InTrigger = True
	
	Activate(Self)
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	InTrigger = False
	
	Activate(Self)
EndEvent
