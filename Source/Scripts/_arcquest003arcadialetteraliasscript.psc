ScriptName _arcQuest003ArcadiaLetterAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto 
Quest Property _arcQuest003 Auto
Form Property _arcArcadiaLetter Auto

Event OnRead()
	If _arcQuest003.GetStage() < 40
		_arcQuest003.SetStage(40)
	EndIf
EndEvent
	
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If _arcQuest003.GetStage() < 40
		_arcQuest003.SetStage(40)
	EndIf
	
	If akNewContainer != PlayerRef
		Return
	EndIf
	
	Int LetterCount = PlayerRef.GetItemCount(_arcArcadiaLetter)
	If LetterCount > 1
		PlayerRef.RemoveItem(_arcArcadiaLetter, LetterCount - 1, True)
	EndIf
EndEvent
