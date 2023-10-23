ScriptName _arcKnockOutEffectScript Extends ActiveMagicEffect

Actor TargetRef

Event OnEffectStart(Actor akTarget, Actor akCaster)
	TargetRef = akTarget
	
	TargetRef.PushActorAway(TargetRef, 0.0)
	
	TargetRef.ModActorValue("Paralysis", 1.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	TargetRef.ModActorValue("Paralysis", -1.0)
	
	TargetRef = None
EndEvent
