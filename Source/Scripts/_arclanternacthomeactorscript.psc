ScriptName _arcLanternActHomeActorScript Extends Actor

Keyword Property _arcLanternActHomeKeyword Auto

_arcLanternActHomeScript kLanternActHomeRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		;make sure we unregister for any updates before entring the Active state
		;just i case the lantern loads in and out in less than 1 second
		UnregisterForUpdate()
		
		kLanternActHomeRef = GetLinkedRef(_arcLanternActHomeKeyword) as _arcLanternActHomeScript
	EndEvent

	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If kLanternActHomeRef
			kLanternActHomeRef.Ignite()
		EndIf
	EndEvent
	
	Event OnDeath(Actor akKiller)
		If kLanternActHomeRef
			kLanternActHomeRef.Ignite()
		EndIf
	EndEvent
	
	;we need to wait a second here, as OnLocationChange()
	;may not have finished by the time the state has exited
	;resulting in OnIgnite() being called on a None object
	Event OnEndState()
		RegisterForSingleUpdate(1.0)
	EndEvent
EndState

Event OnUpdate()
	kLanternActHomeRef = None
EndEvent
