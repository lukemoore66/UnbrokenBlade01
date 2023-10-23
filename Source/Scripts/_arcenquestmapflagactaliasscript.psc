ScriptName _arcENQuestMapFlagActAliasScript Extends ReferenceAlias

ReferenceAlias Property OdeliaMapMarker Auto
ObjectReference Property PlayerRef Auto

Auto State Active 
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		OdeliaMapMarker.GetReference().AddToMap()
	EndEvent
EndState

State Inactive
	;do nothing
EndState
