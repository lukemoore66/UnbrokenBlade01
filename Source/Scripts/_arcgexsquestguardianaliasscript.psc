ScriptName _arcGExSQuestGuardianAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto

_arcSummonFXScript GuardianRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		GuardianRef = GetReference() as _arcSummonFXScript
		GuardianRef.SetGhost(False)
	EndEvent
	
	Event OnEndState()
		GuardianRef.SetGhost(True)
		GuardianRef = None
	EndEvent
EndState
