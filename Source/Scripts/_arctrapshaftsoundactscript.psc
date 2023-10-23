ScriptName _arcTrapShaftSoundActScript Extends ObjectReference

Sound Property _arcTrapShaftStartSFX Auto
Sound Property _arcTrapShaftLoopSFXLP Auto
Sound Property _arcTrapShaftStopSFX Auto

Bool Active = False

Int SoundInstance

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		If !Active
			Active = !Active
			
			_arcTrapShaftStartSFX.Play(Self)
			
			Utility.Wait(3.0)
			
			SoundInstance = _arcTrapShaftLoopSFXLP.Play(Self)
			
			Return
		EndIf
		
		GoToState("Inactive")
		
		Active = !Active
		
		Utility.Wait(8.0)
		
		Sound.StopInstance(SoundInstance)
		
		Utility.Wait(1.0)
		
		_arcTrapShaftStopSFX.PlayAndWait(Self)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
