Scriptname _arcVRQuestScript extends Quest  

Actor Property PlayerRef Auto
ReferenceAlias Property Ring Auto

;the actual item can't be passed in via event data through aliases
;probably because it is not guaranteed to have an ObjectReference
;so fake it instead.
Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, int aiAcquireType)
	PlayerRef.RemoveItem(akItemBase, abSilent = True)
	
	ObjectReference RingRef = Ring.GetReference()
	
	RingRef.EnableNoWait()
	
	PlayerRef.AddItem(RingRef, abSilent = True)
EndEvent
