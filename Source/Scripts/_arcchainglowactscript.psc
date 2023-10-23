ScriptName _arcChainGlowActScript Extends ObjectReference

Sound Property _arcChainGlowActSFX Auto

ObjectReference TriggerRef

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		TriggerRef = akActionRef
		
		Enable(True)
	EndEvent
	
	Event OnLoad()
		GoToState("Translating")
		
		_arcChainGlowActSFX.Play(TriggerRef)
		
		TranslateToRef(GetLinkedRef(), 100.0)
	EndEvent
EndState

State Translating
	Event OnTranslationComplete()
		GoToState("Complete")
		
		;delay activation to ensure all draugr are
		;banished and are in their respective sarcophagi
		Utility.Wait(2.0)
		
		TriggerRef.Activate(TriggerRef)
		
		Utility.Wait(1.0)
		
		Disable(True)
		
		TriggerRef = None
	EndEvent
EndState

State Complete
	;do nothing
EndState
