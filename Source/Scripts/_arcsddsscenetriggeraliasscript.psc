ScriptName _arcSDDSSceneTriggerAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
Quest Property _arcSDDeathSceneQuest Auto
_arcSDSSQuestPlayerAliasScript Property Player Auto

ObjectReference kTriggerRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		kTriggerRef = GetReference()
		kTriggerRef.EnableNoWait()
	EndEvent
	
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
				
		Player.GoToState("Active")
		
		;call GetCombatState() once beforehand
		;this is a workaround for a vanilla bug
		PlayerRef.GetCombatState()
		If PlayerRef.GetCombatState()
			Return
		EndIf
				
		GoToState("Inactive")
		Player.GoToState("Inactive")
		_arcSDDeathSceneQuest.SetStage(20)
	EndEvent
	
	Event OnTriggerLeave(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
				
		Player.GoToState("Inactive")
		
		;call GetCombatState() once beforehand
		;this is a workaround for a vanilla bug
		PlayerRef.GetCombatState()
		If PlayerRef.GetCombatState()
			Return
		EndIf
				
		GoToState("Inactive")
		_arcSDDeathSceneQuest.SetStage(20)
	EndEvent
	
	Event OnEndState()
		;we only want to disable as it will be carried over if the cell resets
		kTriggerRef.DisableNoWait()
		kTriggerRef = None
	EndEvent
EndState
