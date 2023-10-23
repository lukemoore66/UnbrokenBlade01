ScriptName _arcOESQuestEivindAliasScript Extends _arcQuestActorAliasScript

Quest Property _arcOdeliaEntrySceneQuest Auto

Auto State Inactive
	;do nothing
EndState

State Stage130
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		GoToState("Inactive")
		
		_arcOdeliaEntrySceneQuest.SetStage(140)
	EndEvent
EndState
