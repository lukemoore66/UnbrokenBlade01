ScriptName _arcTeleportEffectScript Extends ActiveMagicEffect

ObjectReference Property PlayerRef Auto
ImageSpaceModifier Property _arcTeleportPlayerImod Auto
Keyword Property _arcTeleportTriggerKeyword Auto

ObjectReference DestMarkerRef
Actor ActorRef

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If !DestMarkerRef
		ActorRef = akTarget
		Return
	EndIf
	
	ActorRef.SetGhost(True)
	
	If ActorRef == PlayerRef
		_arcTeleportPlayerImod.Apply()
	EndIf
	
	;the time to translate will always be 1 sec, as speed in the TranslateToRef() function
	;is measured in units / sec
	ActorRef.TranslateToRef(DestMarkerRef, ActorRef.GetDistance(DestMarkerRef))
EndEvent

;this event is triggered in _arcTeleportActScript
;it is needed to pass the teleport trigger into this script
;as an ObjectReference
Event OnActivate(ObjectReference akActionRef)
	_arcTeleportActScript TeleportActRef = akActionRef as _arcTeleportActScript

	If !TeleportActRef
		Return
	EndIf
	
	DestMarkerRef = TeleportActRef.DestMarkerRef
	
	OnEffectStart(ActorRef, None)
EndEvent

Event OnTranslationComplete()
	ActorRef.SetGhost(False)
	Dispel()
EndEvent
