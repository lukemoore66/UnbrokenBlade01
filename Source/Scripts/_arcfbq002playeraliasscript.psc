ScriptName _arcFBQ002PlayerAliasScript Extends ReferenceAlias

Location Property _arcThalmorOutpostLocation Auto
Quest Property _arcFlashbackQuest002 Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == _arcThalmorOutpostLocation
		_arcFlashbackQuest002.SetStage(5)
		Return
	EndIf
	
	If akOldLoc == _arcThalmorOutpostLocation
		_arcFlashbackQuest002.SetStage(60)
		Return
	EndIf
EndEvent
