ScriptName _arcSDWolfHowlTriggerScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Sound Property _arcWolfHowlDistantSFX Auto
Keyword Property LinkCustom01 Auto

Auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
			
		Actor akWolfRef = GetLinkedRef() as Actor
			
		If !akWolfRef.IsDead() && akWolfRef.GetDistance(PlayerRef) >= 512.0
			_arcWolfHowlDistantSFX.Play(akWolfRef)
			GetLinkedRef(LinkCustom01).GoToState("Inactive")
			akWolfRef = None
			Return
		EndIf
			
		akWolfRef = None
		
		GoToState("Active")
	EndEvent
EndState

State Inactive
	;do nothing
EndState
