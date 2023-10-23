ScriptName _arcOwlFireScript Extends ObjectReference

Form Property FXFire01 Auto
Bool Property Enabled = False Auto
Bool Property ScaleFire = False Auto

ObjectReference kFireFX
ObjectReference kFireLight

Event OnLoad()
	kFireLight = GetLinkedRef()
	If !kFireFX
		kFireFX = PlaceAtMe(FXFire01, abInitiallyDisabled = True)
		If ScaleFire == True
			kFireFX.SetScale(0.5)
		EndIf
	EndIf
	If Enabled == True
		Self.SetAnimationVariableFloat("fToggleBlend", 1)
	Else
		Self.SetAnimationVariableFloat("fToggleBlend", 0)
	EndIf
EndEvent

Event OnUnload()
	If kFireFX
		kFireFX.Delete()
		kFireFX = None
	EndIf
EndEvent

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Running")
		ToggleFireFX()
		GoToState("Waiting")
	EndEvent
EndState

State Running
	;do nothing
EndState

Function ToggleFireFX(Bool abLoad = False)
	If Enabled == True
		kFireFX.Enable()
		SetAnimationVariableFloat("fToggleBlend", 0)
		If kFireLight
			Utility.Wait(0.2)
			kFireLight.Disable(True)
		EndIf
		Utility.Wait(5.0)
		kFireFX.Disable()
		Enabled = False
	Else
		kFireFX.Enable()
		SetAnimationVariableFloat("fToggleBlend", 1)
		If kFireLight
			Utility.Wait(0.2)
			kFireLight.Enable(True)
		EndIf
		Utility.Wait(5.0)
		kFireFX.Disable()
		Enabled = True
	EndIf
EndFunction
