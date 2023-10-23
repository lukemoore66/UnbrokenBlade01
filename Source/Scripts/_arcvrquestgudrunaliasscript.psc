ScriptName _arcVRQuestGudrunAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcVihtoriRingQuest Auto

Event OnActivate(ObjectReference akActionRef)
	If akActionRef != PlayerRef
		Return
	EndIf
	
	_arcVihtoriRingQuest.Stop()
EndEvent
