ScriptName _arcFollowerManagerMarkerRefScript Extends ObjectReference

Faction Property _arcGuardianFavourFaction Auto
Actor Property PlayerRef Auto
Quest Property _arcFollowerManagerQuest Auto

;these markers only exist in odelia
Event OnCellAttach()
	;if the player is not honoured by the guardians
	If PlayerRef.GetFactionRank(_arcGuardianFavourFaction) < 1
		Return
	EndIf
	
	;if the quest is already running
	If _arcFollowerManagerQuest.IsRunning()
		Return
	EndIf
	
	_arcFollowerManagerQuest.Start()
EndEvent

Event OnCellDetach()
	;if the player is not honoured by the guardians
	If PlayerRef.GetFactionRank(_arcGuardianFavourFaction) < 1
		Return
	EndIf
	
	_arcFollowerManagerQuest.Stop()
EndEvent
