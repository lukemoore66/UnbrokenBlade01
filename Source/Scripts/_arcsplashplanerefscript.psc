ScriptName _arcSplashPlaneRefScript Extends ObjectReference

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
ObjectReference Property PlayerRef Auto
Sound Property _arcWaveSplashSFX Auto

Float FalloffDistance = 3072.0
ObjectReference PushMarker

Event OnActivate(ObjectReference akActionRef)
	PushMarker = GetLinkedRef(LinkCustom02)

	Utility.Wait(2.0)
	
	_arcWaveSplashSFX.Play(PlayerRef)
	
	Utility.Wait(1.0)
	
	Enable()
	
	ObjectReference WaveRef = GetLinkedRef(LinkCustom01)
	
	TranslateToRef(GetLinkedRef(), 288.0)
	WaveRef.TranslateToRef(WaveRef.GetLinkedRef(), 288.0)
	
	OnUpdate()
EndEvent

Event OnUpdate()
	Float Intensity = 1.0 - (GetDistance(PlayerRef) / FalloffDistance)
	
	Game.ShakeCamera(PlayerRef, Intensity, 1.0)
	Game.ShakeController(Intensity, Intensity, 1.0)
EndEvent

Event OnUnload()
	PushMarker = None
	UnregisterForUpdate()
EndEvent

Event OnTranslationComplete()
	PushMarker = None
	UnregisterForUpdate()
EndEvent

Event OnTriggerEnter(ObjectReference akTriggerRef)
	Actor ActorRef = akTriggerRef as Actor
	
	If !ActorRef
		Return
	EndIf
	
	If ActorRef == PlayerRef
		Return
	EndIf
	
	PushMarker.MoveTo(ActorRef, 0.0, -64.0, 0.0, False)
	ActorRef.ModActorValue("Paralysis", 1.0)
	PushMarker.PushActorAway(ActorRef, 6.0)
EndEvent
