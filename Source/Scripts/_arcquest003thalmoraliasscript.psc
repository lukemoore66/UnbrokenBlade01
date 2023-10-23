ScriptName _arcQuest003ThalmorAliasScript Extends _arcQuestActorAliasScript

Quest Property _arcQuest003 Auto
Location Property DragonBridgeLumberCampLocation Auto
Faction Property DragonBridgeHorgeirHouse Auto

Auto State Inactive
	;do nothing
EndState

State Stage60
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		;combat state from event is unreliable
		;combat state from actor objects is unreliable
		;unless you call it once beforehand
		Actor ActorRef = GetReference() as Actor
		ActorRef.GetCombatState()
		
		;if the combat state is not 'in combat', do nothing
		If ActorRef.GetCombatState() != 1
			Return
		EndIf
		
		;otherwise combat has begun, go to the inactive state
		GoToState("Inactive")
		
		;it is better to check stage here, rather than in quest fragments
		;as we don't want the stage of the quest to advance in this case
		;if we have ceased combat or
		;finished combat or
		;the thalmor are inert
		;then, stop here
		If _arcQuest003.GetStage() >= 130
			Return
		EndIf
		
		;otherwise set logs / objectives etc. to 'fight the thalmor'
		_arcQuest003.SetStage(130)
	EndEvent
EndState

Event OnEnterBleedout()
	Utility.Wait(3.0)
	
	;not storing ObjectReference for multiple use
	;this is far lees trouble given the nature of this script
	(GetReference() as Actor).ResetHealthAndLimbs()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akOldLoc != DragonBridgeLumberCampLocation
		Return
	EndIf
	
	(GetReference() as Actor).RemoveFromFaction(DragonBridgeHorgeirHouse)
EndEvent
