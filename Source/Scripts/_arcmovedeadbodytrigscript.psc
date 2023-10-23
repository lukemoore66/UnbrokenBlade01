;prerequisites:
;set trigger layer to L_DEADACTORZONE
;set trigger to initially disabled
;link an xmarker to move bodies to

ScriptName _arcMoveDeadBodyTrigScript Extends ObjectReference

Auto State Active
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		UnregisterForUpdate()

		Actor ActorRef = akTriggerRef as Actor
		
		If !ActorRef
			Return
		EndIf
		
		If !ActorRef.IsDead()
			Return
		EndIf
		
		ActorRef.ForceRemoveRagdollFromWorld()
		Utility.Wait(0.1)
		ActorRef.MoveTo(GetLinkedRef())
		Utility.Wait(0.1)
		ActorRef.ForceAddRagdollToWorld()
		
		;allow 0.5 seconds, as we are waiting 2x 0.1s
		;plus execution time to move the actor
		RegisterForSingleUpdate(0.5)
	EndEvent

	Event OnUpdate()
		GoToState("Inactive")
		Disable()
	EndEvent
EndState

State Inactive
	;do nothing
EndState
