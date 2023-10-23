ScriptName _arcQuest003ThalmorVoiceAliasScript Extends ReferenceAlias

Sound Property _arcLumberCampDoorKnockSFX Auto
Scene Property _arcLumberCampSceneQuestKnockThalmorScene Auto

ObjectReference ThalmorVoiceRef
Int SoundInstance

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		ThalmorVoiceRef = GetReference()
		ThalmorVoiceRef.EnableNoWait()
		SoundInstance = _arcLumberCampDoorKnockSFX.Play(ThalmorVoiceRef)
		RegisterForSingleUpdate(Utility.RandomFloat(5.0, 15.0))
		_arcLumberCampSceneQuestKnockThalmorScene.Start()
	EndEvent
	
	Event OnUpdate()
		SoundInstance = _arcLumberCampDoorKnockSFX.Play(ThalmorVoiceRef)
		RegisterForSingleUpdate(Utility.RandomFloat(5.0, 15.0))
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdate()
		_arcLumberCampSceneQuestKnockThalmorScene.Stop()
		Sound.StopInstance(SoundInstance)
		ThalmorVoiceRef.DisableNoWait()
		ThalmorVoiceRef = None
	EndEvent
EndState
