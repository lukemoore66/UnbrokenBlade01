ScriptName _arcFireCandleActScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Bool Property CandleOn = True Auto

ObjectReference FlamesRef

State Active
	;do nothing
EndState

Auto State Inactive
	Event OnActivate(ObjectReference akActivator)
		If akActivator != PlayerRef
			Return
		EndIf
		
		GoToState("Active")
		
		If CandleOn
			CandleOn = False
			FlamesRef.Disable()
			
			GoToState("Inactive")
			
			Return
		EndIf
			
		CandleOn = True
		FlamesRef.Enable()
		
		GoToState("Inactive")
	EndEvent
EndState

Event OnLoad()
	FlamesRef = GetLinkedRef()
	
	If CandleOn
		FlamesRef.Enable()
		Return
	EndIf
	
	FlamesRef.Disable()
EndEvent

Event OnUnload()
	FlamesRef = None
EndEvent
