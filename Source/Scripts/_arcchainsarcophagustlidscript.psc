Scriptname _arcChainSarcophagustLidScript extends ObjectReference  

Bool IsOpened = False

Event OnReset()
	OnLoad()
EndEvent

Event OnLoad()
	If !IsOpened
		PlayAnimation("SnapClosed")
	EndIf
EndEvent

Auto State Waiting
	Event OnActivate (ObjectReference akActionRef)
		GoToState("Released")
	EndEvent
EndState

State Released
	Event OnActivate (ObjectReference akActionRef)
		GoToState("Complete")
		
		IsOpened = True
		
		PlayAnimation("OpenStart")	
	EndEvent
EndState

State Complete
	;do nothing
EndState
