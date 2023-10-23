;this trigger is enabled / disabled via _arcTrapShaftSpearActRefScript
;so it will only function while the trap is active

ScriptName _arcTrapShaftCameraShakeTrigScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Inactive
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf
		
		GoToState("Active")
		OnUpdate()
	EndEvent
EndState

State Active
	Event OnUpdate()
		Game.ShakeCamera(PlayerRef, 0.2, 3.0)
		Game.ShakeController(0.1, 0.1, 3.0)
		
		RegisterForSingleUpdate(3.0)
	EndEvent
EndState

Event OnTriggerLeave(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf

	GoToState("Inactive")
	UnregisterForUpdate()
EndEvent
