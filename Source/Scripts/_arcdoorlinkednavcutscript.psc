ScriptName _arcDoorLinkedNavcutScript Extends ObjectReference

ObjectReference kNavcutRef

Event OnLoad()
	kNavcutRef = GetLinkedRef()
	
	;1 = open
	If GetOpenState() == 1
		kNavCutRef.DisableNoWait()
	Else
		kNavCutRef.EnableNoWait()
	EndIf
EndEvent

Event OnOpen(ObjectReference akActionRef)
	kNavcutRef.DisableNoWait()
EndEvent

Event OnClose(ObjectReference akActionRef)
	kNavcutRef.EnableNoWait()
EndEvent

Event OnUnload()
	kNavcutRef = None
EndEvent
