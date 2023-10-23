ScriptName _arcLanternActHomeScript Extends ObjectReference

Keyword Property _arcLanternActHomeKeyword Auto
Bool Property AllowDisabledActor = True Auto

Bool bLightOn
ObjectReference kLight
Location HomeLocation
_arcLanternActHomeActorScript kActorRef

State Inactive
	;do nothing
EndState

Auto State Active
	Event OnCellLoad()
		kActorRef = GetLinkedRef(_arcLanternActHomeKeyword) as _arcLanternActHomeActorScript
		
		kLight = GetLinkedRef()	
		
		HomeLocation = kActorRef.GetEditorLocation()
		
		kActorRef.GoToState("Active")
		
		Ignite()
	EndEvent

	Event OnUnload()
		kActorRef.GoToState("Inactive")
		
		;if the actor is dead, go to the 'Inactive' state
		;it needs to be done here, after the actor has already been set to inactive
		;this effectively turns everything off once the owner is dead
		If kActorRef.IsDead()
			GoToState("Inactive")
		EndIf
		
		kLight = None
		kActorRef = None
		HomeLocation = None
	EndEvent
EndState

Bool Function IsActorHome()
	;if actor is dead, turn off lantern
	If kActorRef.IsDead()
		Return False
	EndIf
	
	;if actor is not allowed to be disabled and they are disabled, turn off lantern
	If !AllowDisabledActor && kActorRef.IsDisabled()
		Return False
	EndIf
	
	;it actor is not at home, turn off lantern
	If kActorRef.GetCurrentLocation() != HomeLocation
		Return False
	EndIf
	
	;otherwise, turn on lantern
	Return True
EndFunction

Function Ignite()
	If IsActorHome()
		bLightOn = True
		
		;only try to enable / disable if the light is loaded
		If kLight
			kLight.EnableNoWait()
		EndIf
		Return
	EndIf

	bLightOn = False
	
	;only try to enable / disable if the light is loaded
	If kLight
		kLight.DisableNoWait()
	EndIf
EndFunction
