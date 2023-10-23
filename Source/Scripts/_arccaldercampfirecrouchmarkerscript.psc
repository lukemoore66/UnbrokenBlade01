ScriptName _arcCalderCampFireCrouchMarkerScript Extends ObjectReference

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	ObjectReference kCampFire = GetLinkedRef()
	
	If akSource.GetDistance(kCampFire) <= 128.0 && asEventName == "PickUp"
		kCampFire.Activate(akSource)
		
		Actor kActorRef = (akSource as Actor)
		If kActorRef
			;be sure to wait to make sure the activate function finishes
			;in kCampfire
			Utility.Wait(1.0)
			kActorRef.EvaluatePackage()
			kActorRef = None
		EndIf
		
		kCampFire = None
	EndIf
EndEvent
