ScriptName _arcSDESQuestScript Extends Quest

Event OnUpdate()
	If IsStarting()
		RegisterForSingleUpdate(0.1)
		Return
	EndIf
	
	SetStage(10)
EndEvent
