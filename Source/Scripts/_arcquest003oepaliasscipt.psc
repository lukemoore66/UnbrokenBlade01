ScriptName _arcQuest003OEPAliasScipt Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcQuest003 Auto

ObjectReference PedestalRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnActivate (ObjectReference akActionRef)
		GoToState("Inactive")
		PlayerRef.KnockAreaEffect(PlayerRef.GetWidth(), 1500.0)
		_arcQuest003.SetStage(220)
	EndEvent
EndState
