ScriptName _arcArcadiaRingEffectScript Extends _arcLoopImodMagicEffectScript

Form Property XMarker Auto
MusicType Property _arcMUSSilenceArcadiaRingFX Auto
Sound Property _arcArcadiaRingSFXLP Auto
Quest Property _arcQuest001 Auto
Perk Property _arcArcadiaRingPerk Auto
Quest Property DialogueCrimeGuards Auto

Int SoundInstance

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;disable guards from arresting the player
	DialogueCrimeGuards.Stop()
	
	PlayerRef.AddPerk(_arcArcadiaRingPerk)
	_arcMUSSilenceArcadiaRingFX.Add()
	SoundInstance = _arcArcadiaRingSFXLP.Play(akTarget)
	
	;if the player is not in an interior
	;simulate a location change after 10 seconds
	If !PlayerRef.IsInInterior()
		RegisterForSingleUpdate(10.0)
	EndIf
	
	;the parent version of the function must be run last, 
	;as we must wait for it to return
	;this is because it will lock the thread due to being
	;full of calls to the Wait() function
	Parent.OnEffectStart(akTarget, akCaster)
	
	;we can take advantage of the locked thread from here onwards
	;as dispel will happen after Parent.OnEffectStart(akTarget, akCaster)
	;has finished
	_arcQuest001.SetStage(80)
	
	;enable guards to arrest the player
	DialogueCrimeGuards.Start()
EndEvent

Event OnUpdate()
	OnLocationChange(None, None)
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If PlayerRef.IsInInterior()
		Return
	EndIf
	
	;poll distance so we can check that the player hasn't wandered too far
	;as they may jump into water if they are in dragon bridge
	;this needs to be done, as there is no way of determining that the
	;player is in water / swimming without skse.
	ObjectReference XMarkerRef = PlayerRef.PlaceAtMe(XMarker)
	
	Float TimeLimitSecs = 15.0
	While TimeLimitSecs > 0.0
		If PlayerRef.GetDistance(XMarkerRef) >= 1920.0
			TimeLimitSecs = 0.0
		Else
			Utility.Wait(0.5)
			TimeLimitSecs -= 0.5
		EndIf
	EndWhile
	
	;disable the player's movement, as we have to wait for the parent
	;script (_arcLoopImodMagicEffectScript) to complete it's loop anyway
	Game.DisablePlayerControls(abMovement = True)
	
	Active = False
	XMarkerRef.Delete()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	PlayerRef.RemovePerk(_arcArcadiaRingPerk)
	_arcMUSSilenceArcadiaRingFX.Remove()
	Sound.StopInstance(SoundInstance)
	
	Parent.OnEffectFinish(akTarget, akCaster)
EndEvent
