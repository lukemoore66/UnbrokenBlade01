ScriptName _arcSDDSQuestEivindScript Extends _arcQuestActorFollowerAliasScript

Location Property _arcSmugglersDenLocation Auto
Quest Property _arcSDDeathSceneQuest Auto

Auto State Inactive
	;do nothing
EndState

State Stage85
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akOldLoc == _arcSmugglersDenLocation
			GoToState("Inactive")
			_arcSDDeathSceneQuest.SetStage(86)
		EndIf
	EndEvent
EndState
