ScriptName _arcSnowWindSoundActRefScript Extends ObjectReference  

Sound Property _arcDungeonWindDoorSFXLP Auto
Sound Property _arcWindGustSFX Auto

Int SoundInstance
_arcSnowSarcophagusTopRefScript DoorRef

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Complete")
		
		_arcWindGustSFX.Play(Self)
		
		Utility.Wait(3.0)
		
		SoundInstance = _arcDungeonWindDoorSFXLP.Play(Self)
	EndEvent
EndState

State Complete
	;do nothing
EndState

Event OnLoad()
	DoorRef = GetLinkedRef() as _arcSnowSarcophagusTopRefScript
	
	If !DoorRef.IsOpened
		SoundInstance = _arcDungeonWindDoorSFXLP.Play(Self)
		Return
	EndIf
	
	If SoundInstance != -1
		Sound.StopInstance(SoundInstance)
	EndIf
EndEvent

Event OnUnload()
	If SoundInstance != -1
		Sound.StopInstance(SoundInstance)
		SoundInstance = -1
	EndIf
	
	DoorRef = None
EndEvent
