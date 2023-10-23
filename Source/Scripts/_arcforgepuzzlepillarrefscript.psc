ScriptName _arcForgePuzzlePillarRefScript Extends ObjectReference  

Auto STATE Inactive
	EVENT onActivate (objectReference triggerRef)
		GoToState("Active")
		
		playAnimationandWait("Trigger01", "Turned01")
		playAnimationandWait("Trigger02", "Turned02")
		playAnimationandWait("Trigger03", "Turned03")
		
		GoToState("Inactive")
	endEVENT
endState

State Active
	;do nothing
EndState
