ScriptName _arcPedestalDoorBeamRefScript Extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	If  (akActionRef as _arcPedestalDoorBeamActRefScript).BeamsOn
		EnableNoWait(True)
		Return
	EndIf
	
	DisableNoWait(True)
EndEvent
