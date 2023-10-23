ScriptName _arcBrawlQuestOpponentAliasScript Extends ReferenceAlias

Weapon Property Unarmed Auto
Actor Property PlayerRef Auto
Quest Property _arcBrawlQuest Auto

Float InitialConfidence = -1.0

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		Actor OpponentRef = GetReference() as Actor
		
		If akAggressor == PlayerRef
			If (akSource as Weapon && akSource != Unarmed) || ((akSource as Spell) && (akSource as Spell).IsHostile()) || (akSource as Scroll)
				OpponentRef.StopCombat()
				OpponentRef.SendAssaultAlarm()
				OpponentRef.StartCombat(PlayerRef)
				_arcBrawlQuest.SetStage(10)
			EndIf
		EndIf
EndEvent

Event OnEnterBleedout()
	_arcBrawlQuest.SetStage(30)
EndEvent

Event OnCombatStateChanged(Actor akTarget, Int aeCombatState)
	If aeCombatState != 0
		Return
	EndIf

	If _arcBrawlQuest.GetStage() < 10
		Actor kOpponentRef = GetReference() as Actor
		
		If !kOpponentRef.IsBleedingOut()
			kOpponentRef.StartCombat(PlayerRef)
		EndIf
	EndIf
EndEvent

Function SetConfidence(Float afConfidence)
	Actor kActor = GetReference() as Actor
	
	InitialConfidence = kActor.GetActorValue("Confidence")
	
	kActor.SetActorValue("Confidence", afConfidence)
EndFunction

Function ResetConfidence()
	Actor kActor = GetReference() as Actor
	
	If InitialConfidence != -1.0
		kActor.SetActorValue("Confidence", InitialConfidence)
		InitialConfidence = -1.0
	EndIf
EndFunction
