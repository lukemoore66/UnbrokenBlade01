ScriptName _arcGESQuestShoutTriggerAliasScript Extends ReferenceAlias

_arcGESQuestGuardianAliasScript Property Guardian Auto

;use this trigger to pass on any hit events to the guardian
;this way we can fake hitting him, even though the collision
;for the portcullis is active
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	Guardian.OnHit(akAggressor, akSource, akProjectile, abPowerAttack, abSneakAttack, abBashAttack, abHitBlocked)
EndEvent
