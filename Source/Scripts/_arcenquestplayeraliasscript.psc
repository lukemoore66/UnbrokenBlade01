ScriptName _arcENQuestPlayerAliasScript Extends ReferenceAlias

Location Property DragonBridgeLumberCampLocation Auto
Quest Property _arcEivindNavigateQuest Auto

Auto State Active
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc != DragonBridgeLumberCampLocation
			Return
		EndIf
		
		_arcEivindNavigateQuest.SetStage(10)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
