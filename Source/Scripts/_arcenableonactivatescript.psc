ScriptName _arcEnableOnActivateScript Extends ObjectReference

Float Property DisableTimer = -1.0 Auto
Bool Property Fade = False Auto

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		Enable(Fade)
		
		;only use timer if it has a valid amount of time
		If DisableTimer > 0.0
			GoToState("Busy")
			
			RegisterForSingleUpdate(DisableTimer)
			
			Return
		EndIf
		
		;go to busy state with no update, this will do nothing
		;on the next activation
		GoToState("Busy")
	EndEvent
EndState

State Busy
	Event OnUpdate()
		Disable(Fade)
		
		GoToState("Waiting")
	EndEvent
EndState
