ScriptName _arcOwlDraugrBossTrigRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto

Auto State Active
	Event OnLoad()
		(GetLinkedRef() as Actor).EnableAI(False)
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		DisableNoWait()
		
		Actor DraugrRef = GetLinkedRef() as Actor
		DraugrRef.EnableAI(True)
		DraugrRef.Activate(PlayerRef)
	EndEvent
EndState

State Inactive
	;do nothing
EndState
