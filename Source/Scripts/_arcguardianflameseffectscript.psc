ScriptName _arcGuardianFlamesEffectScript Extends ActiveMagicEffect

Faction Property _arcGuardianEnemyFaction Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddToFaction(_arcGuardianEnemyFaction)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveFromFaction(_arcGuardianEnemyFaction)
EndEvent
