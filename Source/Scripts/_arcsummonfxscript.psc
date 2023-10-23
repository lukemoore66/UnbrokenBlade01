ScriptName _arcSummonFXScript Extends Actor

Activator Property _arcSummonInVFXAct Auto
Activator Property _arcSummonOutVFXAct Auto
Activator Property _arcSummonInSFXAct Auto
Activator Property _arcSummonOutSFXAct Auto
EffectShader Property _arcSummonInFXS Auto
EffectShader Property _arcSummonOutFXS Auto

Bool Property Active = True Auto
Bool Property IsBusy = False Auto Hidden

State Summoning
	Event OnLoad()
		If Is3DLoaded()
			_arcSummonInFXS.Play(Self, 1.0)
			PlaceAtMe(_arcSummonInSFXAct)
		EndIf
		
		GoToState("")
		
		IsBusy = False
	EndEvent
EndState

Event OnActivate(ObjectReference akActionRef)
	If !Active
		Return
	EndIf
	
	If IsDisabled()
		Summon(True)
	EndIf
EndEvent

Function Summon(Bool abPlaceFX = False)
	While IsBusy
		Utility.Wait(1.0)
	EndWhile
	
	If !IsDisabled()
		Return
	EndIf
	
	IsBusy = True
	
	Active = True
	
	If abPlaceFX
		PlaceAtMe(_arcSummonInVFXAct)
		Utility.Wait(0.5)
		
		Enable(True)
		
		IsBusy = False
		
		Return
	EndIf
	
	GoToState("Summoning")
	
	Enable(True)
EndFunction

Function Banish(Bool abPlaceFX = False)
	While IsBusy
		Utility.Wait(1.0)
	EndWhile
	
	If IsDisabled()
		Return
	EndIf
	
	IsBusy = True
	
	Active = True
	
	If abPlaceFX
		If Is3DLoaded()
			PlaceAtMe(_arcSummonOutVFXAct)
			Utility.Wait(0.5)
		EndIf
		
		Disable()
		
		IsBusy = False
		
		Return
	EndIf
	
	If Is3Dloaded()
		PlaceAtMe(_arcSummonOutSFXAct)
		_arcSummonOutFXS.Play(Self, 1.0)
		
		;alpha can only be set if AI is active
		;current package will exist if AI is active
		If GetCurrentPackage()
			SetAlpha (0.0, True)
		EndIf
		
		RemoveGhostFXShader()
		Utility.Wait(1.0)
	EndIf
	
	Disable(True)
	
	IsBusy = False
EndFunction

Function RemoveGhostFXShader()
	defaultGhostScript GhostRef = (Self as Actor) as defaultGhostScript
	
	If !GhostRef
		Return
	EndIf
	
	If !GhostRef.pGhostFXShader
		Return
	EndIf
	
	GhostRef.pGhostFXShader.Stop(GhostRef)
EndFunction
