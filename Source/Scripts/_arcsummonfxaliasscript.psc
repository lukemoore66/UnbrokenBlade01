ScriptName _arcSummonFXAliasScript Extends ReferenceAlias

Activator Property _arcSummonInVFXAct Auto
Activator Property _arcSummonOutVFXAct Auto
Activator Property _arcSummonInSFXAct Auto
Activator Property _arcSummonOutSFXAct Auto
EffectShader Property _arcSummonInFXS Auto
EffectShader Property _arcSummonOutFXS Auto

Bool Property Active = True Auto
Bool Property IsBusy = False Auto Hidden

Actor ActorRef

Auto State Inactive
	Event OnBeginState()
		ActorRef = None
	EndEvent
EndState

State Summoning
	Event OnLoad()
		If ActorRef.Is3DLoaded()
			_arcSummonInFXS.Play(ActorRef, 1.0)
			ActorRef.PlaceAtMe(_arcSummonInSFXAct)
		EndIf
		
		GoToState("Active")
		
		IsBusy = False
	EndEvent
EndState

State Active
	Event OnBeginState()
		ActorRef = GetReference() as Actor
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		If !Active
			Return
		EndIf
		
		If ActorRef.IsDisabled()
			Summon(True)
		EndIf
	EndEvent
EndState

Function Summon(Bool abPlaceFX = False)
	While IsBusy
		Utility.Wait(0.5)
	EndWhile
	
	If GetState() == "Inactive"
		Return
	EndIf
	
	If !ActorRef.IsDisabled()
		Return
	EndIf
	
	IsBusy = True
	
	Active = True
	
	If abPlaceFX
		ActorRef.PlaceAtMe(_arcSummonInVFXAct)
		Utility.Wait(0.5)
		
		ActorRef.Enable(True)
		
		IsBusy = False
		
		Return
	EndIf
	
	GoToState("Summoning")
	
	ActorRef.Enable(True)
EndFunction

Function Banish(Bool abPlaceFX = False)
	While IsBusy
		Utility.Wait(1.0)
	EndWhile
	
	If GetState() == "Inactive"
		Return
	EndIf
	
	If ActorRef.IsDisabled()
		Return
	EndIf
	
	IsBusy = True
	
	Active = True
	
	If abPlaceFX
		If ActorRef.Is3Dloaded()
			ActorRef.PlaceAtMe(_arcSummonOutVFXAct)
			Utility.Wait(0.5)
		EndIf
		
		ActorRef.Disable()
		
		IsBusy = False
		
		Return
	EndIf
	
	If ActorRef.Is3Dloaded()
		ActorRef.PlaceAtMe(_arcSummonOutSFXAct)
		_arcSummonOutFXS.Play(ActorRef, 1.0)
		
		;alpha can only be set if AI is active
		;current package will exist if AI is active
		If ActorRef.GetCurrentPackage()
			ActorRef.SetAlpha (0.0, True)
		EndIf

		Utility.Wait(0.5)
	EndIf
	
	ActorRef.Disable()
	
	IsBusy = False
EndFunction

Function RemoveGhostFXShader()
	defaultGhostScript GhostRef = (ActorRef as Actor) as defaultGhostScript
	
	If !GhostRef
		Return
	EndIf
	
	If !GhostRef.pGhostFXShader
		Return
	EndIf
	
	GhostRef.pGhostFXShader.Stop(GhostRef)
EndFunction
