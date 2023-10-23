ScriptName _arcQuest002SentryAliasScript Extends _arcQuestActorAliasScript

Faction Property _arcSentryAllyFaction Auto

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		If !GetReference().Is3DLoaded()
			Return
		EndIf
		
		OnLoad()
	EndEvent

	Event OnLoad()
		(GetReference() as Actor).AddToFaction(_arcSentryAllyFaction)
	EndEvent
	
	Event OnEndState()
		(GetReference() as Actor).RemoveFromFaction(_arcSentryAllyFaction)
	EndEvent
EndState
