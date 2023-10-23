ScriptName _arcSnowBeamActRefScript Extends ObjectReference

Bool Property BeamsOn = False Auto
Keyword Property LinkCustom01 Auto

Event OnLoad()
	Activate(Self)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	_arcSnowTrigRefScript TriggerRef = GetLinkedRef() as _arcSnowTrigRefScript
	_arcSnowSarcophagusTopRefScript DoorRef = GetLinkedRef(LinkCustom01) as _arcSnowSarcophagusTopRefScript
	
	If !TriggerRef.InTrigger && DoorRef.IsOpened
		BeamsOn = True
		
		Return
	EndIf
	
	BeamsOn = False
EndEvent
