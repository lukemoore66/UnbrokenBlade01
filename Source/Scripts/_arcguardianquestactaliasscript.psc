ScriptName _arcGuardianQuestActAliasScript Extends ReferenceAlias

_arcGuardianQuestScript Property CurrentGuardianQuest Auto

Event OnActivate(ObjectReference akActionRef)
	If akActionRef != CurrentGuardianQuest.GuardianRef
		Return
	EndIf
	
	ObjectReference LinkedRef = GetReference().GetLinkedRef()
	
	If LinkedRef
		LinkedRef.Activate(CurrentGuardianQuest.GuardianRef)
	EndIf
EndEvent
