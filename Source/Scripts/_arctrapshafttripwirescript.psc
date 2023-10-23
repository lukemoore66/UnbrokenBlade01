ScriptName _arcTrapShaftTripwireScript Extends ObjectReference

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto

Auto State Active
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, \
	Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
		GoToState("Inactive")
		
		(GetLinkedRef(LinkCustom01) as _arcTrapShaftTripwireScript).GoToState("Inactive")
		(GetLinkedRef(LinkCustom02) as _arcTrapShaftTripwireScript).GoToState("Inactive")
		
		GetLinkedRef().Activate(Self)
	EndEvent
	
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		GoToState("Inactive")
		
		GetLinkedRef().Activate(Self)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
