ScriptName _arcLightToggleScript Extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	_arcToggleLightTrigScript TriggerRef = akActionRef as _arcToggleLightTrigScript
	
	If !TriggerRef
		Return
	EndIf
	
	If TriggerRef.IsOn
		Enable()
		
		Return
	EndIf
	
	Disable()
EndEvent
