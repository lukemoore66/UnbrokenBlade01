ScriptName _arcOdeliaEntryDoorScript Extends ObjectReference

Actor Property PlayerRef Auto
Bool Property IsInside = False Auto
Location Property _arcOdeliaLocation Auto

Event OnActivate(ObjectReference akActionRef)
	If IsLocked()
		Return
	EndIf
	
	;if we are the outside door
	If !IsInside
		;if the player activates the door, play the sound at the inside marker
		If akActionRef == PlayerRef
			Utility.Wait(1.0)
		
			GetLinkedRef().Activate(GetLinkedRef())
			
			Return
		EndIf
		
		;if someone else activates the door, play the sound if the player is inside
		;and close enough to hear it
		If PlayerRef.GetCurrentLocation() == _arcOdeliaLocation && PlayerRef.GetDistance(Self) <= 6656.0
			GetLinkedRef().Activate(GetLinkedRef())
			
			Return
		EndIf
	EndIf
	
	;otherwise we are the inside door
	;as long as anyone else but the player activates the door
	;play the sound
	If akActionRef != PlayerRef
		GetLinkedRef().Activate(GetLinkedRef())
	EndIf
EndEvent
