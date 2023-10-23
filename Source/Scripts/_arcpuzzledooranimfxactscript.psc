ScriptName _arcPuzzleDoorAnimFXActScript Extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	TranslateToRef(GetLinkedRef(), 18.0, 0.0)
	
	Utility.Wait(4.0)
	
	PlayAnimation("FXDoorOpen")
EndEvent
