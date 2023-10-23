ScriptName _arcCalderTrespassPlayerAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcCalderTrespassQuest Auto
Location Property DragonBridgeLocation Auto
Scene Property _arcCalderTrespassQuestScene Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If !PlayerRef.IsInLocation(DragonBridgeLocation) && !_arcCalderTrespassQuestScene.IsPlaying()
		_arcCalderTrespassQuest.Stop()
	EndIf
EndEvent
