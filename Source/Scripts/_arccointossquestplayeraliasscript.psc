ScriptName _arcCoinTossQuestPlayerAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcCoinTossQuest Auto
LocationAlias Property CurrentLocation Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If !PlayerRef.IsInLocation(CurrentLocation.GetLocation())
		_arcCoinTossQuest.Stop()
	EndIf
EndEvent
