ScriptName _arcTrollLightActDisableScript Extends ObjectReference

Activator Property _arcTrollLightTrig Auto

Event OnActivate(ObjectReference akActionRef)
	If akActionRef.GetBaseObject() != _arcTrollLightTrig
		Return
	EndIf
	
	((Self as ObjectReference) as _arcTrollLightActScript).DisableLight()
EndEvent
