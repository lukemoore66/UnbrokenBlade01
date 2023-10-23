ScriptName _arcSoundActScript Extends ObjectReference

Sound Property SoundToPlay Auto
Bool Property DoOnce = False Auto
Bool Property DeleteWhenDone = False Auto
Float Property Duration = -1.0 Auto
Int Property MarkerType = 0 Auto
{0 = PlayOnActivate, 1 = PlayOnLoad}

Event OnInit()
	If MarkerType
		GoToState("PlayOnLoad")
		Return
	EndIf
	
	GoToState("PlayOnActivate")
EndEvent

State Inactive
	;do nothing
EndState

State PlayOnActivate
	Event OnActivate(ObjectReference akActionRef)
		PlaySound()
	EndEvent
EndState

State PlayOnLoad
	Event OnLoad()
		PlaySound()
	EndEvent
EndState

Function PlaySound()
	If DoOnce
		GoToState("Inactive")
	EndIf
	
	Enable()
	
	If Duration > 0.0
		SoundToPlay.Play(Self)
		
		Utility.Wait(Duration)
		
		Disable()
		
		If DeleteWhenDone
			Utility.Wait(1.0)
			
			Delete()
		EndIf
		
		Return
	EndIf
	
	SoundToPlay.PlayAndWait(Self)
	
	If DeleteWhenDone
		Delete()
	EndIf
EndFunction
