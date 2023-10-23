ScriptName _arcFireSconceActScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Form Property FXFire02 Auto
Bool Property FlamesOn = True Auto
Bool Property PlayerAct = True Auto
Float Property FlameFXDuration = 1.0 Auto

ObjectReference EmbersRef
ObjectReference LightRef

State Active
	;do nothing
EndState

Auto State Inactive
	Event OnActivate(ObjectReference akActionRef)
		If PlayerAct && akActionRef != PlayerRef
			Return
		EndIf
		
		If FlamesOn
			TurnOff()
			Return
		EndIf
		
		TurnOn()
	EndEvent
EndState

Event OnCellLoad()
	;don't use GetNthLinkedRef(), as this will just fill out the last linked ref
	;in the chain, as opposed to DNE if there is no LightRef
	EmbersRef = GetLinkedRef()
	LightRef = EmbersRef.GetLinkedRef()
	
	If FlamesOn
		EmbersRef.SetAnimationVariableFloat("fToggleBlend", 1.0)
		
		If LightRef
			LightRef.Enable()
		EndIf
		
		Return
	EndIf
	
	EmbersRef.SetAnimationVariableFloat("fToggleBlend", 0.0)
	
	If LightRef
		LightRef.Disable()
	EndIf
EndEvent

Event OnUnload()
	EmbersRef = None
	LightRef = None
EndEvent

Function TurnOn()
	GoToState("Active")
	
	FlamesOn = True
		
	ObjectReference FireFXRef = EmbersRef.PlaceAtMe(FXFire02)
	EmbersRef.SetAnimationVariableFloat("fToggleBlend", 1.0)
			
	If LightRef
		LightRef.Enable()
	EndIf
		
	Utility.Wait(FlameFXDuration)
	FireFXRef.Delete()
	
	GoToState("Inactive")
EndFunction

Function TurnOff()
	GoToState("Active")

	FlamesOn = False
			
	ObjectReference FireFXRef = EmbersRef.PlaceAtMe(FXFire02)
	EmbersRef.SetAnimationVariableFloat("fToggleBlend", 0.0)
	
	If LightRef
		LightRef.Disable()
	EndIf
	
	Utility.Wait(FlameFXDuration)
	FireFXRef.Delete()
	
	GoToState("Inactive")
EndFunction
