ScriptName _arcLightActScript Extends ObjectReference

Bool Property LightOn = True Auto
ObjectReference Property kLight Auto Hidden

Auto State Ready
	Event OnCellLoad()
		If !Is3DLoaded()
			Return
		EndIf
	
		GoToState("Busy")
		kLight = GetLinkedRef()
		
		If LightOn
			Ignite(True, False)
			Return
		EndIf
		
		Ignite(False, False)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		
		;guard clause in case light is activated when kLight does not exist
		;this can happen if light is activated before the parent cell has loaded
		If !kLight
			GoToState("Ready")
			Return
		EndIf
		
		If LightOn
			Ignite(False, True)
			Return
		EndIf
		
		Ignite(True, True)
	EndEvent
	
	Event OnUnload()
		GoToState("Busy")
		kLight = None
		Reactivate(False)
	EndEvent
EndState

State Busy
	Event OnBeginState()
		BlockActivation(True)
	EndEvent
EndState

Function Reactivate(Bool abWait)
	Utility.Wait(abWait as Float)
	BlockActivation(False)
	GoToState("Ready")
EndFunction

Function Ignite(Bool abIgnite, Bool abWait)
	If abIgnite
		LightOn = True
		kLight.Enable()
		Reactivate(abWait)
		Return
	EndIf
	
	LightOn = False
	kLight.Disable()
	Reactivate(abWait)
EndFunction
