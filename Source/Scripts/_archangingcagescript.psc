ScriptName _arcHangingCageScript Extends ObjectReference

Event OnLoad()
	ObjectReference kLinkedRef = GetLinkedRef()
	If kLinkedRef
		kLinkedRef.EnableNoWait()
	EndIf
EndEvent
