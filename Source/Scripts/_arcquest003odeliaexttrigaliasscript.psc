ScriptName _arcQuest003OdeliaExtTrigAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
Quest Property _arcQuest003 Auto
ReferenceAlias Property Eivind Auto

Actor EivindRef
ObjectReference TriggerRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		TriggerRef = GetReference()
		EivindRef = Eivind.GetReference() as Actor
		
		TriggerRef.EnableNoWait()
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		Actor kActorRef = akActionRef as Actor
		
		If !kActorRef
			Return
		EndIf
		
		If kActorRef == PlayerRef
			_arcQuest003.SetStage(190)
			EivindRef.EvaluatePackage()
			GoToState("Inactive")
		EndIf
	EndEvent
	
	Event OnEndState()
		TriggerRef.DisableNoWait()
		
		TriggerRef = None
		EivindRef = None
	EndEvent
EndState
