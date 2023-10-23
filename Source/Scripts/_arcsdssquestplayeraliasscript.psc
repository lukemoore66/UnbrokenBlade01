ScriptName _arcSDSSQuestPlayerAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
_arcSDDSSceneTriggerAliasScript Property SceneTrigger Auto

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		RegisterForSingleUpdate(1.0)
	EndEvent

	Event OnUpdate()
		PlayerRef.GetCombatState()
		If PlayerRef.GetCombatState()
			RegisterForSingleUpdate(1.0)
			Return
		EndIf
		
		UnregisterForUpdate()
		
		;this will set this script to the Inactive state
		;as well as the trigger
		SceneTrigger.OnTriggerLeave(PlayerRef)
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdate()
	EndEvent
EndState
