ScriptName _arcSnowBeamRefScript Extends ObjectReference

Event OnActivate(ObjectReference akActionRef)	
	If  (akActionRef as _arcSnowBeamActRefScript).BeamsOn
		EnableNoWait(True)
		Return
	EndIf
	
	DisableNoWait(True)
EndEvent
