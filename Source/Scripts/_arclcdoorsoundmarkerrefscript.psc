ScriptName _arcLCDoorSoundMarkerRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Keyword Property LinkCustom01 Auto
Sound Property _arcLumberCampDoorLockSFX Auto

Bool Property Exterior Auto

State Busy
	;do nothing
EndState

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		ObjectReference DoorExtRef = GetLinkedRef()
		ObjectReference DoorIntRef = GetLinkedRef(LinkCustom01)
		
		If Exterior && DoorExtRef.IsLocked()
			Return
		EndIf
		
		GoToState("Busy")
		
		Utility.Wait(1.0)
		
		If DoorExtRef.Is3DLoaded() && DoorExtRef.GetParentCell().IsAttached()
			_arcLumberCampDoorLockSFX.Play(DoorExtRef)
		EndIf
		
		If DoorIntRef.Is3DLoaded() && DoorIntRef.GetParentCell().IsAttached()
			_arcLumberCampDoorLockSFX.Play(DoorIntRef)
		EndIf
		
		GoToState("Ready")
	EndEvent
EndState

Event OnCellAttach()
	SetLockState()
EndEvent

Function SetLockState()
	;always unlock the internal door / lock external door
	GetLinkedRef(LinkCustom01).Lock(False)
	GetLinkedRef().Lock(True)
EndFunction
