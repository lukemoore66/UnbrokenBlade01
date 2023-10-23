ScriptName _arcTelishaProudspireIdleMarkerScript Extends ObjectReference

Event OnActivate(ObjectReference akActivator)
	(akActivator as Actor).SetLookAt(GetLinkedRef())
EndEvent
