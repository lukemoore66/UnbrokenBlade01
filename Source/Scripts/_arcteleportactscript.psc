ScriptName _arcTeleportActScript Extends ObjectReference

Explosion Property _arcTeleportExplosion Auto
ObjectReference Property PlayerRef Auto
Spell Property _arcTeleportSpell Auto
MagicEffect Property _arcTeleportEffect Auto
Faction Property _arcTeleportFaction Auto
ObjectReference Property DestMarkerRef Auto Hidden
_arcFollowerManagerQuestScript Property _arcFollowerManagerQuest Auto

State Busy
	;do nothing
EndState

Auto State Ready
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		GoToState("Busy")
		
		Actor ActorRef = akTriggerRef as Actor
		
		If !ActorRef
			GoToState("Ready")
			Return
		EndIf
		
		If ActorRef.HasMagicEffect(_arcTeleportEffect)
			GoToState("Ready")
			Return
		EndIf
		
		If ActorRef.IsInFaction(_arcTeleportFaction)
			GoToState("Ready")
			Return
		EndIf
		
		_arcTeleportSpell.Cast(Self, akTriggerRef)
		
		;this seems to be the only reliable way of having the
		;actor activate correctly once the magic effect has been applied
		;it also is cleaner as it all happens within the scope of a single event
		;we cannot have any conditions on the spell or effect if we do
		;it like this though
		If !ActorRef.HasMagicEffect(_arcTeleportEffect)
			Utility.Wait(0.1)
		EndIf
			
		;activate the actor to pass in the teleport trigger as an
		;ObjectReference to the ActiveMagicEffect on the Actor
		akTriggerRef.Activate(Self)
		
		;activate self while in the Busy state
		;this will do nothing with this object
		;however it will pass the event onto any children
		;of which this activator is a parent of
		;this is useful when using an _arcTeleportMarkerAct in combination
		;with a teleport trigger
		Activate(Self)
		
		GoToState("Ready")
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		;if the activator is not the player and
		;is not a teleport trigger then stop here
		If akActionRef != PlayerRef && !(akActionRef as _arcTeleportActScript)
			Return
		EndIf
	
	GoToState("Busy")
	
	If _arcFollowerManagerQuest.TeleportActors(Self)
		If _arcTeleportExplosion
			PlaceAtMe(_arcTeleportExplosion)
		EndIf
	
		Utility.Wait(3.0)
	EndIf
	
	GoToState("Ready")
	EndEvent
EndState

Event OnLoad()
	DestMarkerRef = GetLinkedRef()
	
	If !DestMarkerRef
		DestMarkerRef = Self
	EndIf
EndEvent

Event OnUnload()
	DestMarkerRef = None
EndEvent
