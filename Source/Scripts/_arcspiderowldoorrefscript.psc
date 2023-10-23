ScriptName _arcSpiderOwlDoorRefScript Extends _arcPuzzleKeyDoorRefScript

Sound Property _arcOwlDoorSFXLP Auto
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto

ObjectReference DestMarkerRef

Float Duration
Int SoundInstance

Auto State Waiting
	Event OnLoad()
		DestMarkerRef = GetLinkedRef()
		
		Duration = GetDistance(DestMarkerRef) / 20.0
	EndEvent

	Event OnActivate(ObjectReference akActionRef)		
		GoToState("Moving")
		
		OnUpdate()
		
		GetLinkedRef(LinkCustom01).Activate(Self)
		
		SoundInstance = _arcOwlDoorSFXLP.Play(Self)
		
		Utility.Wait(1.0)
		
		TranslateToRef(DestMarkerRef, 20.0, 0.0)
	EndEvent
EndState

State Moving
	Event OnUpdate()
		Rumble()
		RegisterForSingleUpdate(1.0)
	EndEvent

	Event OnTranslationComplete()
		GoToState("Complete")
		
		UnregisterForUpdate()
	
		Sound.StopInstance(SoundInstance)
		
		GetLinkedRef(LinkCustom02).Activate(Self)
	EndEvent
EndState

State Complete
	;do nothing
EndState

Event OnUnload()
	DestMarkerRef = None
EndEvent
