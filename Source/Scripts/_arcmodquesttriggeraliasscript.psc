ScriptName _arcMODQuestTriggerAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcMessengerOfDeathQuest Auto
ReferenceAlias Property Messenger Auto

Auto State Active
	Event OnTriggerLeave(ObjectReference akActionRef)		
		If akActionRef != PlayerRef
			Return
		EndIf
		
		If _arcMessengerOfDeathQuest.IsRunning()
			;go to the Inactive state, we do not want to keep setting off the trigger
			;we only want to set to stage 40 once
			GoToState("Inactive")
		
			;setting the stage to 50 tells the quest that we have exited the trigger at some point
			_arcMessengerOfDeathQuest.SetStage(50)
		EndIf
	EndEvent
EndState

State Inactive
	;do nothing
EndState

Event OnCellDetach()
	;the messenger carries himself over to adjacent cells if we are interacting with him
	;immediately disable the messenger, this way he will not banish if the player has changed cells.
	Messenger.GetReference().Disable()
	OnTriggerLeave(PlayerRef)
EndEvent
