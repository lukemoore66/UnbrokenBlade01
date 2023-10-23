ScriptName _arcTaintedMeatEffectScript Extends ActiveMagicEffect

ObjectReference Property PlayerRef Auto
ImageSpaceModifier Property _arcTaintedMeatInImod Auto
ImageSpaceModifier Property _arcTaintedMeatMainImod Auto
ImageSpaceModifier Property _arcTaintedMeatOutImod Auto

Bool IsFinishing
Bool IsPlaying

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akTarget == PlayerRef
		IsPlaying = True
		
		_arcTaintedMeatInImod.Remove()
		_arcTaintedMeatMainImod.Remove()
		_arcTaintedMeatOutImod.Remove()	
		
		_arcTaintedMeatInImod.Apply()
		
		ShakeCameraEffect()
		
		Utility.Wait(1.75)
	
		If IsFinishing == False
			_arcTaintedMeatInImod.PopTo(_arcTaintedMeatMainImod)
		EndIf
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If akTarget == PlayerRef
		IsPlaying = False
		
		IsFinishing = True
		
		_arcTaintedMeatInImod.Remove()
		_arcTaintedMeatMainImod.PopTo(_arcTaintedMeatOutImod)
	EndIf
EndEvent

Event OnUpdate()
	ShakeCameraEffect()
EndEvent

Function ShakeCameraEffect()
	If IsPlaying == True
		Game.ShakeCamera(afStrength = 0.25, afDuration = 0.9)
		RegisterForSingleUpdate(1.0)
	EndIf
EndFunction
