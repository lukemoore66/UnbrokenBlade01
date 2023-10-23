ScriptName _arcPedestalDoorBeamActRefScript Extends ObjectReference

Keyword Property LinkCustom01 Auto
Bool Property BeamsOn = False Auto

Event OnActivate(ObjectReference akActionRef)
	_arcOdeliaEntryTrigBeamRefScript TrigRef = GetLinkedRef() as _arcOdeliaEntryTrigBeamRefScript
	_arcNorRotatingDoorScript DoorRef = GetLinkedRef(LinkCustom01) as _arcNorRotatingDoorScript
	
	;door IsOpen logic is reversed
	If !TrigRef.InTrigger && DoorRef.IsOpen
		BeamsOn = True
	Else
		BeamsOn = False
	EndIf
EndEvent
