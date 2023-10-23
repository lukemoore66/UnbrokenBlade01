ScriptName _arcOdeliaEntryTrigFireLantRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Keyword Property LinkCustom02 Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	TrapFallingOilLampColLayer LanternRef = GetLinkedRef(LinkCustom02) as TrapFallingOilLampColLayer
	
	If !LanternRef
		Return
	EndIf
	
	If LanternRef.GetState() != "waiting"
		Return
	EndIf
	
	LanternRef.GoToState("")
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	TrapFallingOilLampColLayer LanternRef = GetLinkedRef(LinkCustom02) as TrapFallingOilLampColLayer
	
	If !LanternRef
		Return
	EndIf
	
	If LanternRef.GetState() != ""
		Return
	EndIf
	
	LanternRef.GoToState("waiting")
EndEvent
