ScriptName _arcQuest002TyraAliasScript Extends ReferenceAlias

Quest Property _arcQuest002 Auto
Actor Property PlayerRef Auto

Actor TyraRef

Event OnDeath(Actor akKiller)
	GoToState("Inactive")
	_arcQuest002.SetStage(40)
EndEvent

Auto State Inactive
	;do nothing
EndState

State Stage20
	Event OnBeginState()
		TyraRef = GetReference() as Actor
	EndEvent
	
	Event OnCombatStateChanged(Actor akTarget, Int aeCombatState)
		If aeCombatState < 1
			Return
		EndIf
		
		If akTarget != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		_arcQuest002.SetStage(30)
		TyraRef = None
	EndEvent
EndState
