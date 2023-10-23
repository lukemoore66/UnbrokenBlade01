ScriptName _arcLCSQuestLumberCampDoorIntScript Extends ReferenceAlias  

ReferenceAlias Property ThalmorAgent01 Auto
ReferenceAlias Property ThalmorAgent02 Auto
ReferenceAlias Property ExtMarker Auto

Sound Property _arcLumberCampDoorUnlockSFX Auto
Sound Property _arcLumberCampDoorIntOpenSFX Auto
Sound Property _arcLumberCampDoorIntCloseSFX Auto

ObjectReference ThalmorAgent01Ref
ObjectReference ThalmorAgent02Ref
ObjectReference ExtMarkerRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		ThalmorAgent01Ref = ThalmorAgent01.GetReference()
		ThalmorAgent02Ref = ThalmorAgent02.GetReference()
		ExtMarkerRef = ExtMarker.GetReference()
	
		ObjectReference LumberCampDoorIntRef = GetReference()

		;activate door so animation plays, default processing only
		;no sound will play, as it must normally be activated by an actor, it is likely more performant
		;to run a couple of lines of script here to do this, instead of loading in an extra actor to do this
		LumberCampDoorIntRef.Activate(LumberCampDoorIntRef, True)

		;play internal door open and close sounds manually, the sound wont work unless an actor
		;activates it otherwise, so this is cleaner

		;play open sound
		_arcLumberCampDoorIntOpenSFX.Play(LumberCampDoorIntRef)

		;wait 0.6s for open animation (farmhouseldoor01.nif)
		Utility.Wait(0.6)

		;play close sound
		_arcLumberCampDoorIntCloseSFX.Play(LumberCampDoorIntRef)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != ThalmorAgent01Ref && akActionRef != ThalmorAgent02Ref
			Return
		EndIf
		
		akActionRef.Disable(True)
		Utility.Wait(1.0)
		akActionRef.MoveTo(ExtMarkerRef)
		akActionRef.Enable(False)
		(akActionRef as Actor).EvaluatePackage()
	EndEvent
	
	Event OnCellDetach()
		GoToState("Inactive")
	EndEvent
	
	Event OnEndState()
		ThalmorAgent01Ref = None
		ThalmorAgent02Ref = None
		ExtMarkerRef = None
	EndEvent
EndState
