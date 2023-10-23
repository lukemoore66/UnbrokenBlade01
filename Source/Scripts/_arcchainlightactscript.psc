ScriptName _arcChainLightActScript Extends ObjectReference

ObjectReference DraugrRef

Event OnActivate(ObjectReference akActionRef)
	DraugrRef = akActionRef
	
	Enable(True)
	
	TranslateTo(DraugrRef.X, DraugrRef.Y, DraugrRef.Z + 96.0, 0.0, 0.0, 0.0, 100.0)
EndEvent

Event OnTranslationComplete()
	DraugrRef.Activate(Self)
	
	DraugrRef = None
	
	Disable(True)
	
	Utility.Wait(1.0)
	
	Delete()
EndEvent
