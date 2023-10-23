ScriptName _arcBronzeForgeTrigScript Extends ObjectReference

Actor Property PlayerRef Auto
Spell Property _arcBronzeForgeSpell Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	PlayerRef.AddSpell(_arcBronzeForgeSpell, False)
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	PlayerRef.RemoveSpell(_arcBronzeForgeSpell)
EndEvent
