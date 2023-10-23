ScriptName _arcFBQ001MusicTrigRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
MusicType Property _arcMUSFlashback001Sting Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef != PlayerRef
		Return
	EndIf
	
	DisableNoWait()
	
	_arcMUSFlashback001Sting.Add()
EndEvent
