ScriptName _arcSummonSFXActScript Extends ObjectReference

Sound Property SummonSFX Auto

Event OnLoad()
	SummonSFX.PlayAndWait(Self)
	Delete()
EndEvent
