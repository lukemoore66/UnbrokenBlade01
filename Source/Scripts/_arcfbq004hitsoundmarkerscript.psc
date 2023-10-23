ScriptName _arcFBQ004HitSoundMarkerScript Extends ReferenceAlias

ObjectReference SoundMarkerRef

State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		SoundMarkerRef = GetReference()
		RegisterForSingleUpdate(2.0)
	EndEvent

	Event OnUpdate()
		SoundMarkerRef.Activate(SoundMarkerRef)
		RegisterForSingleUpdate(Utility.RandomFloat(0.6, 2.5))
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdate()
		SoundMarkerRef = None
	EndEvent
EndState
