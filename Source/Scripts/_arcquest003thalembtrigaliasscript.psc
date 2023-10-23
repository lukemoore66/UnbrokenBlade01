ScriptName _arcQuest003ThalEmbTrigAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
ReferenceAlias Property Eivind Auto
Keyword Property _arcThalmorEmbassySceneQuestKeyword Auto
Quest Property _arcThalmorEmbassySceneQuest Auto

Actor EivindRef
ObjectReference TriggerRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		EivindRef = Eivind.GetReference() as Actor
		TriggerRef = GetReference()
		
		TriggerRef.EnableNoWait()
	EndEvent
	
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef == EivindRef
			EivindRef.EvaluatePackage()
			Return
		EndIf
		
		If akActionRef == PlayerRef
			_arcThalmorEmbassySceneQuestKeyword.SendStoryEvent()
		EndIf
	EndEvent
	
	Event OnTriggerLeave(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		If !_arcThalmorEmbassySceneQuest.IsRunning()
			Return
		EndIf
		
		;if we have triggered the first scene
		;knock out the player, and set the trigger alias to inactive
		If _arcThalmorEmbassySceneQuest.GetStage() >= 10
			GoToState("Inactive")
			
			_arcThalmorEmbassySceneQuest.SetStage(30)
			Return
		EndIf
		
		;otherwise, stop the quest by default
		_arcThalmorEmbassySceneQuest.Stop()
	EndEvent
	
	Event OnEndState()
		TriggerRef.DisableNoWait()
		
		EivindRef = None
		TriggerRef = None
	EndEvent
EndState
