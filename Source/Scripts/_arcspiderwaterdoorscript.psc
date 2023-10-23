ScriptName _arcSpiderWaterDoorScript Extends ObjectReference

Default2StateActivator Property _arcSpiderWaterDoorRef Auto
ObjectReference Property _arcSpiderWaterDoorFX Auto

Event OnActivate(ObjectReference akActionRef)
	If _arcSpiderWaterDoorRef.IsOpen == True
		Utility.Wait(0.5)
		_arcSpiderWaterDoorFX.EnableNoWait(True)
	Else
		
		_arcSpiderWaterDoorFX.DisableNoWait(True)
	EndIf
EndEvent
