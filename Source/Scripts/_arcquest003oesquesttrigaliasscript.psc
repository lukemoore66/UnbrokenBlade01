ScriptName _arcQuest003OESQuestTrigAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
Quest Property _arcQuest003 Auto

ObjectReference TriggerRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		TriggerRef = GetReference()
		
		TriggerRef.EnableNoWait()
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		Actor kActorRef = akActionRef as Actor
		
		If !kActorRef
			Return
		EndIf
		
		If kActorRef == PlayerRef
			GoToState("Inactive")
			_arcQuest003.SetStage(200)
		EndIf
	EndEvent
	
	Event OnEndState()
		TriggerRef.DisableNoWait()
		
		TriggerRef = None
	EndEvent
EndState
