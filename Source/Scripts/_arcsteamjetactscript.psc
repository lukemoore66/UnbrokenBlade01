ScriptName _arcSteamJetActScript Extends ObjectReference

Actor Property PlayerRef Auto
Spell Property _arcSteamJetActSpell Auto
MagicEffect Property _arcSteamJetActEffect Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	If PlayerRef.HasMagicEffect(_arcSteamJetActEffect)
		Return
	EndIf
	
	PlayerRef.AddSpell(_arcSteamJetActSpell, False)
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	PlayerRef.RemoveSpell(_arcSteamJetActSpell)
EndEvent
