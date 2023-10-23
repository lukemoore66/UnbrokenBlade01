ScriptName _arcBronzeForgeDoorActMarkerRefScript Extends ObjectReference

Keyword Property LinkCustom01 Auto

Event OnActivate(ObjectReference akActionRef)
	Utility.Wait(5.0)

	GetLinkedRef().SetOpen()
	GetLinkedRef(LinkCustom01).SetOpen()
EndEvent
