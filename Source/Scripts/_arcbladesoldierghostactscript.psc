ScriptName _arcBladeSoldierGhostActScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Form Property _arcLvlBladeSoldierGhostAct Auto

_arcSummonFXScript BladeSoldierGhostRef

State Inactive
	;do nothing
EndState

Auto State Active
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		If !BladeSoldierGhostRef
			OnCellAttach()
		EndIf
		
		BladeSoldierGhostRef.MoveTo(Self)
		
		BladeSoldierGhostRef.Summon()
		
		GoToState("Active")
	EndEvent

	Event OnTriggerLeave(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		If !BladeSoldierGhostRef
			OnCellAttach()
		EndIf
		
		BladeSoldierGhostRef.Banish()
		
		GoToState("Active")
	EndEvent
EndState

Event OnCellAttach()
	If !BladeSoldierGhostRef
		BladeSoldierGhostRef = PlaceAtMe(_arcLvlBladeSoldierGhostAct, abInitiallyDisabled = True) as _arcSummonFXScript
	EndIf
EndEvent

Event OnCellDetach()
	If BladeSoldierGhostRef
		BladeSoldierGhostRef.Delete()
	EndIf
	
	BladeSoldierGhostRef = None
EndEvent
