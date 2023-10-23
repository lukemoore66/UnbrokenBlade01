ScriptName _arcSummonedGuardianPinkEffectScript Extends ActiveMagicEffect

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_arcSummonFXScript SummonRef = akCaster as _arcSummonFXScript
	
	If SummonRef
		SummonRef.Banish()
	EndIf

	akCaster.SetCriticalStage(akCaster.CritStage_DisintegrateEnd)
EndEvent
