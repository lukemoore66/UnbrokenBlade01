ScriptName _arcCalderScheduleScript Extends ObjectReference

Quest Property _arcCalderScheduleQuest Auto

Auto State WaitingForLoad
	Event OnLoad()
		GoToState("WaitingForQuest")
		BlockActivation(True)
		_arcCalderScheduleQuest.Start()
	EndEvent
EndState

State WaitingForQuest
	Event OnActivate(ObjectReference akActivator)
		If akActivator == Self
			GoToState("WaitingForPlayer")
			BlockActivation(False)
		EndIf
	EndEvent
EndState

State WaitingForPlayer
	Event OnRead()
		GoToState("Complete")
	EndEvent
	
	Event OnUnload()
		GoToState("WaitingForLoad")
	EndEvent
EndState

State Complete
	;do nothing
EndState
