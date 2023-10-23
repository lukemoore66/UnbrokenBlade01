;the open and close animations in this script are opposite
;to what you would expect
;this is likely because the door is placed upside down

ScriptName _arcNorRotatingDoorScript Extends ObjectReference  

Bool Property IsOpen = False Auto

State Active
	;do nothing
EndState

Auto State Inactive
	Event OnActivate(ObjectReference akActivator)		
		GoToState("Active")
		
		;animation name logic is reversed
		If IsOpen
			IsOpen = False
			PlayAnimationAndWait("RotateOpen", "Trans02")
		Else
			IsOpen = True
			PlayAnimationAndWait("RotateClosed", "Trans01")
		EndIf
		
		GoToState("Inactive")
	EndEvent
EndState

Event OnCellAttach()
	If IsOpen
		SnapOpen()
		Return
	EndIf
	
	SnapClosed()
EndEvent

;animation name logic is reversed
Function SnapOpen()
	IsOpen = True
	PlayAnimation("SnapClosed")
EndFunction

;animation name logic is reversed
Function SnapClosed()
	IsOpen = False
	PlayAnimation("SnapOpen")
EndFunction
