ScriptName _arcBarrierActScript Extends ObjectReference

Activator Property _arcBarrierVFXAct Auto
Light Property _arcBarrierActLight Auto

ObjectReference LightRef

Event OnLoad()
	PlayAnimation("PlayAnim02")
	PlaceAtMe(_arcBarrierVFXAct)
	LightRef = PlaceAtMe(_arcBarrierActLight)
EndEvent

Event OnActivate(ObjectReference akActionRef)
	If IsDisabled()
		Enable(True)
		
		Return
	EndIf
	
	Disable(True)
	
	LightRef.DisableNoWait(True)
	
	Utility.Wait(1.0)
	
	LightRef.Delete()
EndEvent
