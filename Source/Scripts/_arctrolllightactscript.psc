ScriptName _arcTrollLightActScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Sound Property StartSound Auto
Activator Property _arcTrollLightSFXAct Auto
Activator Property _arcTrollLightTrig Auto
Bool Property Translate = False Auto
Static Property _arcTrollLightMarker Auto
Keyword Property LinkCustom01 Auto

ObjectReference NextMarkerRef

Event OnInit()
	If Translate
		GoToState("Translate")
		Return
	EndIf
	
	GoToState("Waiting")
EndEvent

State Translate
	Event OnActivate(ObjectReference akActionRef)
		;only turn on and translate if it is the troll activating the light
		If akActionRef != GetLinkedRef()
			Return
		EndIf
	
		MoveTo(GetLinkedRef(), abMatchRotation = False)
	
		NextMarkerRef = Game.FindClosestReferenceOfTypeFromRef(_arcTrollLightMarker, Self, 16384.0)
	
		EnableNoWait(True)
	EndEvent
	
	Event OnLoad()
		StartSound.Play(Self)
		
		SplineTranslateToRef(NextMarkerRef, 2.5, 90.0, 0.1)
	EndEvent
	
	Event OnTranslationAlmostComplete()
		ObjectReference LightRef = NextMarkerRef.GetLinkedRef(LinkCustom01)
		
		If LightRef
			LightRef.Activate(Self)
		EndIf
		
		ObjectReference CurrentMarkerRef = NextMarkerRef
		
		NextMarkerRef = CurrentMarkerRef.GetLinkedRef()
		
		If NextMarkerRef
			SplineTranslateToRef(NextMarkerRef, 2.5, 90.0, 0.1)
			
			Return
		EndIf
		
		Utility.Wait(1.0)
		
		DisableLight()
		
		CurrentMarkerRef = None
		NextMarkerRef = None
	EndEvent
EndState

State Waiting
	Event OnActivate(ObjectReference akActionRef)		
		;return if the trigger activates this reference
		;_arcTrollLightActDisableScript takes care of disabling if needed
		If akActionRef.GetBaseObject() == _arcTrollLightTrig
			Return
		EndIf
		
		GoToState("ProximityDisable")
		
		EnableNoWait(True)
	EndEvent
EndState

State ProximityDisable
	Event OnLoad()
		StartSound.Play(Self)
	EndEvent

	Event OnTriggerEnter(ObjectReference akTriggerRef)
		If akTriggerRef != PlayerRef
			Return
		EndIf
		
		DisableLight()
	EndEvent
EndState

State Complete
	;do nothing
EndState

Function DisableLight()
	If IsDisabled()
		Return
	EndIf

	GoToState("Complete")
		
	StopTranslation()
	
	PlaceAtMe(_arcTrollLightSFXAct)
		
	DisableNoWait(True)
EndFunction
