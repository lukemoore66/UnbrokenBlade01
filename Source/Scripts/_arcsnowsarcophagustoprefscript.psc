ScriptName _arcSnowSarcophagusTopRefScript Extends ObjectReference

Bool Property IsOpened = False Auto

Int SoundInstance = -1

Event OnReset()
	OnLoad()
EndEvent

Event OnLoad()
	If !IsOpened
		PlayAnimation("SnapClosed")
		Return
	EndIf
EndEvent

Auto State Waiting
	Event OnActivate (objectReference akTriggerRef)
		GoToState ("Complete")
		
		IsOpened = True
		
		PlayAnimation("OpenStart")
	EndEvent
EndState


State Complete
	;do nothing
EndState
