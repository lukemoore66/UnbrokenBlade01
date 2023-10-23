ScriptName _arcFireOwlDoorRefScript Extends _arcPuzzleKeyDoorRefScript

Sound Property _arcOwlDoorSFXLP Auto

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto

ObjectReference DestMarkerRef
ObjectReference _arcFireOwlDoorActivateMarker02Ref

_arcFireSconceActScript _arcFire10SconceWithBaseActRef
_arcFireSconceActScript _arcFire11SconceWithBaseActRef

Float Duration
Int SoundInstance

Auto State Waiting
	Event OnLoad()
		DestMarkerRef = GetLinkedRef()
		_arcFire10SconceWithBaseActRef = GetLinkedRef(LinkCustom01) as _arcFireSconceActScript
		_arcFire11SconceWithBaseActRef = GetLinkedRef(LinkCustom02) as _arcFireSconceActScript
		_arcFireOwlDoorActivateMarker02Ref = GetLinkedRef(LinkCustom03)
		
		Duration = GetDistance(DestMarkerRef) / 12.0
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		GoToState("Moving")
		
		OnUpdate()
		
		SoundInstance = _arcOwlDoorSFXLP.Play(Self)
		
		Utility.Wait(1.0)
		
		TranslateToRef(DestMarkerRef, 12.0, 0.0)
		
		;set fire sconce flame fx time to translation duration for owl door
		_arcFire10SconceWithBaseActRef.FlameFXDuration = Duration
		_arcFire11SconceWithBaseActRef.FlameFXDuration = Duration
		
		;force sconces to think they are turned off
		_arcFire10SconceWithBaseActRef.FlamesOn = False
		_arcFire11SconceWithBaseActRef.FlamesOn = False
		
		;have the player activate the sconces
		_arcFire10SconceWithBaseActRef.Activate(PlayerRef)
		_arcFire11SconceWithBaseActRef.Activate(PlayerRef)
	EndEvent
EndState

State Moving
	Event OnUpdate()
		Rumble()
		RegisterForSingleUpdate(1.0)
	EndEvent

	Event OnTranslationComplete()
		GoToState("Complete")
		
		UnregisterForUpdate()
	
		Sound.StopInstance(SoundInstance)
		
		_arcFireOwlDoorActivateMarker02Ref.Activate(Self)
		
		;set flame fx duration back to default for sconces
		_arcFire10SconceWithBaseActRef.FlameFXDuration = 1.0
		_arcFire11SconceWithBaseActRef.FlameFXDuration = 1.0
	EndEvent
EndState

State Complete
	;do nothing
EndState

Event OnUnload()
	DestMarkerRef = None
	_arcFire10SconceWithBaseActRef = None
	_arcFire11SconceWithBaseActRef = None
EndEvent
