ScriptName _arcFlashbackQuestScript Extends _arcQuestScript

Form Property XMarker Auto
Explosion Property _arcShoutExplosion Auto
ImagespaceModifier Property _arcSoulAbsorbInImod Auto
ImagespaceModifier Property _arcBlackImod Auto
ImagespaceModifier Property _arcFlashbackImod Auto
ImagespaceModifier Property _arcSoulAbsorbOutImod Auto
Sound Property _arcShoutOutSFX Auto
ObjectReference Property FlashbackPlayerReturnMarker Auto Hidden
Spell Property _arcInvulnerableSpell Auto

Function FlashbackIn(ObjectReference akFlashbackMarker, Sound akShoutIn = None)
	PlayerRef.StopCombat()
	CancelTransformations()
	ForceDismount()
	PlayerRef.ForceRemoveRagdollFromWorld()
	
	Game.DisablePlayerControls(abCamSwitch = True, abSneaking = True)
	Game.SetInChargen(True, True, False)
	Game.SetPlayerAIDriven(True)
	Game.ForceFirstPerson()
	Game.ShowFirstPersonGeometry(False)
	
	_arcSoulAbsorbInImod.Apply()

	PlayerRef.PlaceAtMe(_arcShoutExplosion)
	FlashbackPlayerReturnMarker = PlayerRef.PlaceAtMe(XMarker)
	FlashbackPlayerReturnMarker.KnockAreaEffect(1.0, PlayerRef.GetLength())
	
	Int SoundInstance
	If !akShoutIn
		SoundInstance = _arcShoutOutSFX.Play(PlayerRef)
	Else
		SoundInstance = akShoutIn.Play(PlayerRef)
	EndIf
	
	;wait for _arcSoulAbsorbInImod
	Utility.Wait(4.5)

	_arcSoulAbsorbInImod.PopTo(_arcBlackImod)
	
	;disable looking so we don't get weird angles if the player moves the mouse during imod
	Game.DisablePlayerControls(abCamSwitch = True, abSneaking = True, abLooking = True)
	
	_arcFlashbackImod.Apply()
	
	;wait for _arcShoutVoiceStingIn to finish
	;4.5s for _arcSoulAbsorbInImod + 3.6s more for total of 8.1s
	Utility.Wait(3.6)
	
	Sound.StopInstance(SoundInstance)
	
	PlayerRef.MoveTo(akFlashbackMarker)
	
	PlayerRef.AddSpell(_arcInvulnerableSpell, False)
	
	_arcBlackImod.PopTo(_arcSoulAbsorbOutImod)
	
	;wait for _arcSoulAbsorbOutImod so function won't return early
	Utility.Wait(6.0)
	
	;enable looking only, once the imod has finished
	Game.EnablePlayerControls(False, False, False, True, False, False, False, False, 0)
EndFunction

Function FlashbackOut(ObjectReference akFlashbackMarker = None, Bool abEnableControls = True)
	If !akFlashbackMarker
		akFlashbackMarker = FlashbackPlayerReturnMarker
	EndIf
	
	Game.EnableFastTravel(False)
	Game.DisablePlayerControls(abLooking = True, abCamSwitch = True, abSneaking = True)
	PlayerRef.StopCombat()
	CancelTransformations()
	ForceDismount()
	PlayerRef.ForceRemoveRagdollFromWorld()
	
	_arcSoulAbsorbInImod.Apply()

	PlayerRef.PlaceAtMe(_arcShoutExplosion)
	ObjectReference XMarkerRef = PlayerRef.PlaceAtMe(XMarker)
	XMarkerRef.KnockAreaEffect(1.0, PlayerRef.GetLength())
	XMarkerRef.Delete()
	XMarkerRef = None
	
	Int SoundInstance = _arcShoutOutSFX.Play(PlayerRef)
	
	;wait for _arcSoulAbsorbInImod
	Utility.Wait(4.5)

	_arcSoulAbsorbInImod.PopTo(_arcBlackImod)
	_arcFlashBackImod.Remove()
	
	;wait for _arcShoutOutSFX to finish
	;(4.5 for _arcSoulAbsorbInImod + 3.6 more for total of 8.1 sec)
	Utility.Wait(3.6)
	
	Sound.StopInstance(SoundInstance)
	
	PlayerRef.MoveTo(akFlashbackMarker)
	
	PlayerRef.RemoveSpell(_arcInvulnerableSpell)

	_arcBlackImod.PopTo(_arcSoulAbsorbOutImod)
	
	;wait for _arcSoulAbsorbOutImod
	Utility.Wait(6.0)
	
	If abEnableControls
		Game.EnablePlayerControls()
	EndIf
	
	Game.SetInChargen(False, False, False)
	Game.SetPlayerAIDriven(False)
	Game.ShowFirstPersonGeometry(True)
	Game.EnableFastTravel(True)

	FlashbackPlayerReturnMarker.Delete()
	FlashbackPlayerReturnMarker = None
EndFunction
