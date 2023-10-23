ScriptName _arcTrapShaftDoorRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Keyword Property LinkCustom01 Auto

Auto State Locked
	Event OnOpen(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
	
		GoToState("Unlocked")
	
		GetLinkedRef().Activate(Self)
		
		GetLinkedRef(LinkCustom01).Activate(Self)
		
		Game.ShakeCamera(PlayerRef, 0.3, 1.0)
		Game.ShakeController(0.1, 0.1, 1.0)
	EndEvent
EndState

State Unlocked
	;do nothing
EndState
