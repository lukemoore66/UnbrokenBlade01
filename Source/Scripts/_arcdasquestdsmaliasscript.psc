ScriptName _arcDASQuestDSMAliasScript Extends ReferenceAlias

Sound Property NPCDragonFlightRoar Auto
Sound Property NPCDragonFlyby Auto

ObjectReference kSoundMarker
ObjectReference kTargetMarker

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnCellLoad()
		Flyby()
	EndEvent
	
	Event OnTranslationComplete()
		Flyby()
	EndEvent

	Event OnUnload()
		kSoundMarker.StopTranslation()
	EndEvent
EndState

Function Start()
	GoToState("Active")
	
	kSoundMarker = GetReference()
	kTargetMarker = kSoundMarker.GetNthLinkedRef(1)
	
	Flyby(False)
EndFunction

Function Stop()
	GoToState("Inactive")
	
	If kSoundMarker
		kSoundMarker.StopTranslation()
	EndIf
	
	kSoundMarker = None
	kTargetMarker = None
EndFunction

Function Flyby(Bool abWait = True)
	If !kSoundMarker.Is3DLoaded()
		Return
	EndIf
	
	If abWait
		Utility.Wait(Utility.RandomFloat(2.0, 5.0))
	EndIf
		
	kTargetMarker = kSoundMarker.GetNthLinkedRef(Utility.RandomInt(1, 4))
		
	kSoundMarker.SplineTranslateTo(kTargetMarker.X, kTargetMarker.Y, kTargetMarker.Z, 0.0, 0.0, 0.0, 320.0, 768.0, 0.0)
		
	NPCDragonFlightRoar.Play(kSoundMarker)
	NPCDragonFlyby.Play(kSoundMarker)
		
	Game.ShakeCamera(kSoundMarker, 0.5, afDuration = 2.0)
	
	Float VibrationPower = Utility.RandomFloat(0.3, 0.7)
	Game.ShakeController(VibrationPower, VibrationPower, 2.0)
EndFunction
