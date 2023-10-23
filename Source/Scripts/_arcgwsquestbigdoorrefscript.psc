ScriptName _arcGWSQuestBigDoorRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Complete")
		
		Game.ShakeCamera(PlayerRef, 0.125, 4.0)
		Game.ShakeController(0.125, 0.125, 4.0)
	EndEvent
EndState

State Complete
	;do nothing
EndState
