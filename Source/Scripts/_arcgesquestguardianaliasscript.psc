ScriptName _arcGESQuestGuardianAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
Faction Property _arcGuardianEnemyFaction Auto
MagicEffect Property _arcGuardianFlamesEffect Auto
ReferenceAlias Property TeleportTriggerExt Auto
Spell Property VoiceUnrelentingForce1 Auto
Spell Property VoiceUnrelentingForce2 Auto
Spell Property VoiceUnrelentingForce3 Auto

_arcSummonFXScript GuardianRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		GuardianRef = GetReference() as _arcSummonFXScript
		GuardianRef.SetGhost(False)
	EndEvent

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		If akAggressor != PlayerRef
			Return
		EndIf
		
		;if the player has entered without shouting yet, just go into the inactive state
		;no matter what
		If PlayerRef.HasMagicEffect(_arcGuardianFlamesEffect)
			GoToState("Inactive")
		EndIf
		
		Spell kSource = akSource as Spell
		
		If !kSource
			Return
		EndIf
		
		If kSource == VoiceUnrelentingForce1 || kSource == VoiceUnrelentingForce2 || kSource == VoiceUnrelentingForce3
			TeleportTriggerExt.GetReference().EnableNoWait()
			PlayerRef.RemoveFromFaction(_arcGuardianEnemyFaction)
			GuardianRef.Banish(True)
			GoToState("Inactive")
		EndIf
	EndEvent
	
	Event OnEndState()
		GuardianRef.SetGhost(True)
		GuardianRef = None
	EndEvent
EndState
