ScriptName _arcFBQ004EatFoodActivatorAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcFlashbackQuest004 Auto

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		_arcFlashbackQuest004.SetStage(50)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
