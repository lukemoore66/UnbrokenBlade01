ScriptName _arcDefaultGhostScript Extends DefaultGhostScript

Bool Property BanishOnDeath = False Auto

;this script overides the behaviour of its parent script (DefaultGhostScript)
;when the OnDying() event is fired
;it now does the following instead of playing effects / placing explosions / disabling
Event OnDying(Actor akKiller)
	If !BanishOnDeath
		Return
	EndIf
	
	_arcSummonFXScript SummonRef = (Self as Actor) as _arcSummonFXScript

	If SummonRef
		SetCriticalStage(CritStage_DisintegrateStart)
	
		SummonRef.Banish()
		
		;banishing disables the actor, we don't want to do that
		;so remove them from the world then enable them again
		SetCriticalStage(CritStage_DisintegrateEnd)
		
		Enable()
	EndIf
EndEvent
