ScriptName _arcQuestTelishaAliasScript Extends _arcQuestActorAliasScript

ReferenceAlias Property VictimMarker Auto

State Inactive
	;do nothing
EndState

State Missing
	Event OnBeginState()
		If !GetReference().Is3DLoaded()
			GoToState("Inactive")
			
			TryMoveTo(VictimMarker.GetReference(), False)
		EndIf
	EndEvent

	Event OnDetachedFromCell()
		GoToState("Inactive")
		
		TryMoveTo(VictimMarker.GetReference(), False)
	EndEvent
	
	Event OnCellDetach()
		GoToState("Inactive")
		
		TryMoveTo(VictimMarker.GetReference(), False)
	EndEvent
EndState
