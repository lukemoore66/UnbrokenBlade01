ScriptName _arcTESQuestFrontGateAliasScript Extends ReferenceAlias

ObjectReference GateRef
Int LockLevel

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		;get gate ref
		GateRef = GetReference()
		
		;store initial lock level
		LockLevel = GateRef.GetLockLevel()
		
		;close gate
		GateRef.SetOpen(False)
		
		;unlock gate
		GateRef.Lock(False)
	EndEvent
	
	Event OnEndState()
		;restore initial lock level
		GateRef.SetLockLevel(LockLevel)
		
		;close gate
		GateRef.SetOpen(False)
		
		;lock gate
		GateRef.Lock(True)
	EndEvent
EndState
