ScriptName _arcSDDSQuestCageDoorAliasScript Extends ReferenceAlias

ReferenceAlias Property Calder Auto
_arcSDDSQuestHalvarAliasScript Property Halvar Auto

ObjectReference CageDoorRef
ObjectReference CalderRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		CageDoorRef = GetReference()
		CalderRef = Calder.GetReference()
		
		;this will always reset the cage to make sure it is both shut and locked
		CageDoorRef.Reset()
	EndEvent

	Event OnOpen(ObjectReference akActionRef)
		GoToState("Inactive")
		Halvar.GoToState("Inactive")
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == CalderRef
			
			;SetOpen() will remove the lock level on the cage until it is next reset
			;no big deal, as this is the only time it actually matters
			CageDoorRef.SetOpen()
			GoToState("Inactive")
		EndIf
	EndEvent
	
	Event OnEndState()
		CageDoorRef = None
		CalderRef = None
	EndEvent
EndState
