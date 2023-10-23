ScriptName _arcTrapShaftActScript Extends ObjectReference

Bool Clockwise = True

Auto State Inactive
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Active")
		OnUpdate()
	EndEvent
EndState

State Active
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Inactive")
		
		UnregisterForUpdate()
	EndEvent

	Event OnUpdate()
		If Clockwise
			PlayGamebryoAnimation("RotateClockwise", True)
		Else
			PlayGamebryoAnimation("RotateAntiClockwise", True)
		EndIf
		
		Clockwise = !Clockwise
		
		RegisterForSingleUpdate(8.0)
	EndEvent
EndState
