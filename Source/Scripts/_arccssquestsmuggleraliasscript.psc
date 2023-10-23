ScriptName _arcCSSQuestSmugglerAliasScript Extends _arcQuestActorAliasScript

Quest Property _arcCalderSmuggleSceneQuest Auto
Location Property _arcSmugglersDenLocation Auto
Faction Property _arcSentryAllyFaction Auto
Faction Property BanditFaction Auto

Auto State Inactive
	;do nothing
EndState

State Stage10
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc != _arcSmugglersDenLocation
			Return
		EndIf
		
		GoToState("Inactive")
		
		Actor SmugglerRef = GetReference() as Actor
		SmugglerRef.RemoveFromFaction(_arcSentryAllyFaction)
		SmugglerRef.AddToFaction(BanditFaction)
		
		_arcCalderSmuggleSceneQuest.SetStage(20)
	EndEvent
EndState

Event OnDeath(Actor akKiller)
	_arcCalderSmuggleSceneQuest.Stop()
EndEvent
