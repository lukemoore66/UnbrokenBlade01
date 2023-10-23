ScriptName _arcDefaultGhostScriptRefAlias Extends DefaultGhostScriptRefAlias

Bool Property BanishOnDeath = False Auto

;this script overides the behaviour of its parent script (DefaultGhostScriptRefAlias)
;when the OnDying() event is fired
;it now does the following instead of playing effects / placing explosions / disabling
Event OnDying(Actor akKiller)
	If !BanishOnDeath
		Return
	EndIf
	
	_arcSummonFXAliasScript SummonAlias = (Self as ReferenceAlias) as _arcSummonFXAliasScript

	
	If SummonAlias
		Actor ActorRef = GetReference() as Actor
		
		ActorRef.SetCriticalStage(ActorRef.CritStage_DisintegrateStart)
		
		SummonAlias.Banish()
		
		;BanishOnDeathing disables the actor, we don't want to do that
		;so remove them from the world then enable them again
		ActorRef.SetCriticalStage(ActorRef.CritStage_DisintegrateEnd)
		
		ActorRef.Enable()
	EndIf
EndEvent
