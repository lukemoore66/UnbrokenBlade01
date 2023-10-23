ScriptName _arcBrawlQuestPlayerAliasScript Extends ReferenceAlias

ReferenceAlias Property Opponent Auto
ReferenceAlias Property OpponentFriend Auto
Quest Property _arcBrawlQuest Auto
Actor Property PlayerRef Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If akAggressor != Opponent.GetReference() && akAggressor != OpponentFriend.GetReference()
		If (akSource as Weapon) || ((akSource as Spell) && (akSource as Spell).IsHostile())
			_arcBrawlQuest.SetStage(10)
		EndIf
	EndIf
EndEvent

Event OnSpellCast(Form akSpell)
	If (akSpell as Spell)
		If (PlayerRef.GetEquippedSpell(0) == (akSpell as Spell) || PlayerRef.GetEquippedSpell(1) == (akSpell as Spell))
			If !(akSpell as Spell).IsHostile()
				_arcBrawlQuest.SetStage(10)
			EndIf
		EndIf
	ElseIf (akSpell as Ingredient) || (akSpell as Potion)
		_arcBrawlQuest.SetStage(10)
	EndIf
EndEvent

Event OnEnterBleedout()
	_arcBrawlQuest.SetStage(20)
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If !PlayerRef.IsInLocation((Opponent.GetReference() as Actor).GetCurrentLocation())
		_arcBrawlQuest.SetStage(20)
	EndIf
EndEvent
