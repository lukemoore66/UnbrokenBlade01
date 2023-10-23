ScriptName _arcQuest001TelishaLockboxAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
_arcQuest001Script Property _arcQuest001 Auto

Auto State Locked
	Event OnLockStateChanged()
		If !GetReference().IsLocked()
			GoToState("NotOpened")
		EndIf
	EndEvent
EndState

State NotOpened
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == PlayerRef
			GoToState("Opened")
		EndIf
	EndEvent
EndState

State Opened
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == PlayerRef 
			GoToState("Inactive")
			;_arcQuest001.RingGiver = 2
			;_arcQuest001.SetStage(70)
		EndIf
	EndEvent
EndState

State RingMissing
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == PlayerRef
			GoToState("Inactive")
			_arcQuest001.SetStage(90)
		EndIf
	EndEvent
EndState

State Inactive
	;do nothing
EndState
