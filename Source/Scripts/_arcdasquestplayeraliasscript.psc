ScriptName _arcDASQuestPlayerAliasScript Extends ReferenceAlias

Location Property DragonBridgeFourShieldsTavernLocation Auto
Quest Property _arcDragonAttackSceneQuest Auto

Auto State Inactive
	;do nothing
EndState

State Stage0
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == DragonBridgeFourShieldsTavernLocation
			GoToState("Inactive")
			_arcDragonAttackSceneQuest.SetStage(10)
		EndIf
	EndEvent
EndState

State Stage10
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akOldLoc == DragonBridgeFourShieldsTavernLocation
			GoToState("Inactive")
			_arcDragonAttackSceneQuest.SetStage(30)
		EndIf
	EndEvent
EndState

State Stage30
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == DragonBridgeFourShieldsTavernLocation
			GoToState("Inactive")
			_arcDragonAttackSceneQuest.SetStage(35)
		EndIf
	EndEvent
EndState
