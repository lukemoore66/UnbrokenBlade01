ScriptName _arcGExSFlameTrigRefScript Extends ObjectReference

Actor Property PlayerRef Auto
Spell Property _arcGuardianFlamesSpell Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
	Actor ActorRef = akTriggerRef as Actor
	
	If !ActorRef
		Return
	EndIf
	
	ActorRef.DispelSpell(_arcGuardianFlamesSpell)
EndEvent

Event OnTriggerLeave(ObjectReference akTriggerRef)
	Actor ActorRef = akTriggerRef as Actor
	
	If !ActorRef
		Return
	EndIf
	
	If Is3DLoaded()
		_arcGuardianFlamesSpell.Cast(Self, ActorRef)
	EndIf
EndEvent
