ScriptName _arcPuzzleDoorAnimActScript Extends ObjectReference

Sound Property DRSRuinsPuzzleOpenLPM Auto
Quest Property _arcFlashbackQuest003 Auto

Int SoundInstance

Event OnActivate(ObjectReference akActionRef)
	SoundInstance = DRSRuinsPuzzleOpenLPM.Play(Self)
	
	TranslateToRef(GetLinkedRef(), 18.0, 0.0)
EndEvent

Event OnTranslationAlmostComplete()
	Sound.StopInstance(SoundInstance)
	
	_arcFlashbackQuest003.SetStage(60)
EndEvent
