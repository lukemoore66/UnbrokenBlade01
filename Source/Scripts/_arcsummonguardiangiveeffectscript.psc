ScriptName _arcSummonGuardianGiveEffectScript Extends ActiveMagicEffect

ImagespaceModifier Property _arcSummonGuardianGiveImod Auto
VisualEffect Property AbsorbBlueCastVFX01 Auto
Sound Property _arcSummonGuardianGiveSFX Auto

Bool IsFinishing = False
ObjectReference Target
ObjectReference Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Target = akTarget as ObjectReference
	Caster = akCaster as ObjectReference
	
	_arcSummonGuardianGiveImod.Apply()
	
	If IsFinishing == False
		PlayVisualEffects(True)
	Else
		PlayVisualEffects(True, 2.0)
	EndIf
	
	_arcSummonGuardianGiveSFX.Play(akTarget)
	
	Game.ShakeCamera(None, 0.25, 3.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	IsFinishing = True
	
	PlayVisualEffects(False)
EndEvent

Function PlayVisualEffects(Bool abPlayEffect, Float afDuration = -1.0)
	If abPlayEffect
		AbsorbBlueCastVFX01.Play(Target, afDuration, Caster)
		Return
	EndIf

	AbsorbBlueCastVFX01.Stop(Target)
EndFunction
