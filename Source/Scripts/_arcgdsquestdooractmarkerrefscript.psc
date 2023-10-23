ScriptName _arcGDSQuestDoorActMarkerRefScript Extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	Utility.Wait(4.0)
	
	GetLinkedRef().Lock(False)
EndEvent
