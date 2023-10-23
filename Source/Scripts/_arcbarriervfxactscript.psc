ScriptName _arcBarrierVFXActScript Extends ObjectReference

Event OnLoad()
	Utility.Wait(2.0)
	
	Disable(True)
	
	Utility.Wait(1.0)
	
	Delete()
EndEvent
