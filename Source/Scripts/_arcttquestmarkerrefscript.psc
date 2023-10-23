ScriptName _arcTTQuestMarkerRefScript Extends ObjectReference

Quest Property _arcTavernTrespassQuest Auto

Event OnCellAttach()
	_arcTavernTrespassQuest.Start()
EndEvent

Event OnCellDetach()
	_arcTavernTrespassQuest.Stop()
EndEvent
