ScriptName _arcENQuestTableTrigAliasScript Extends ReferenceAlias

Quest Property _arcEivindNavigateQuest Auto
FormList Property _arcENQuestFormList Auto

Auto State Active
	Event OnTrigger(ObjectReference akTriggerRef)
		UnregisterForUpdate()
		
		akTriggerRef.DisableNoWait(False)
		_arcENQuestFormList.AddForm(akTriggerRef)
		
		RegisterForSingleUpdate(0.25)
	EndEvent
	
	Event OnUpdate()
		GoToState("Inactive")
		
		GetReference().DisableNoWait(False)
		
		_arcEivindNavigateQuest.SetStage(30)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
