ScriptName _arcSteamJetActEffectScript Extends ActiveMagicEffect

ImagespaceModifier Property _arcSteamSpellImod Auto
Sound Property _arcSteamSpellSFXLP Auto

Int SoundInstance
Bool Active = False

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SoundInstance = _arcSteamSpellSFXLP.Play(akCaster)
	
	While Active == False
		_arcSteamSpellImod.Apply()
		
		Utility.Wait(1.5)
	EndWhile
	
	Sound.StopInstance(SoundInstance)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Active = True
EndEvent
