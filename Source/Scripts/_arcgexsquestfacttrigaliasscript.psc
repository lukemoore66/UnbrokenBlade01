ScriptName _arcGExSQuestFactTrigAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
ReferenceAlias Property FactionTrigger Auto
_arcGExSQuestGuardianAliasScript Property Guardian Auto
Faction Property _arcGuardianFavourFaction Auto

Auto State Ready
	Event OnTriggerEnter(ObjectReference akActionRef)
		GoToState("Busy")
		
		Actor ActorRef = akActionRef as Actor
		
		If !ActorRef
			Return
		EndIf
		
		If PlayerRef.GetFactionRank(_arcGuardianFavourFaction) < 1
			Return
		EndIf
		
		;enable the external teleport trigger
		GetReference().GetLinkedRef().EnableNoWait()
				
		(Guardian.GetReference() as _arcSummonFXScript).Banish(True)
		Guardian.GoToState("Inactive")
	EndEvent
EndState

State Busy
	Event OnTriggerLeave(ObjectReference akActionRef)		
		GoToState("Ready")
	EndEvent
EndState
