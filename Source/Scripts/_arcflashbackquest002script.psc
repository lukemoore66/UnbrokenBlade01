ScriptName _arcFlashbackQuest002Script Extends _arcFlashbackQuestScript Conditional

;the IsLimbGone conditional function only appears to return -1
;so the following code is necessary
Int Property Decapitated = 0 Auto Hidden Conditional

ReferenceAlias Property Husband Auto

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
	If akSource == Husband.GetReference() && asEventName == "Decapitate"
		Decapitated = 1
		UnregisterForAnimationEvent(akSource, "Decapitate")
	EndIf
EndEvent
