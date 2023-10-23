ScriptName _arcFBQ004ArminahLetterAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
ReferenceAlias Property BurnLetterAct Auto
ReferenceAlias Property Redguard Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer != PlayerRef
		Return
	EndIf
	
	Redguard.Clear()
	
	BurnLetterAct.GetReference().EnableNoWait()
EndEvent
