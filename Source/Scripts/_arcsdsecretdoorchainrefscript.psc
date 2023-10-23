ScriptName _arcSDSecretDoorChainRefScript Extends ObjectReference

ObjectReference Property PlayerRef Auto
Sound Property _arcSecretDoorOpenDistantSFX Auto
Sound Property AMBRumbleShake Auto

Auto State Active
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == PlayerRef
			BlockActivation(True)
			
			GoToState("Inactive")
			
			Utility.Wait(1.0)
			
			ObjectReference SecretDoorRef = GetLinkedRef()
			
			SecretDoorRef.Activate(Self)
			
			AMBRumbleShake.Play(Self)
			
			Utility.Wait(1.0)
			
			_arcSecretDoorOpenDistantSFX.Play(SecretDoorRef)
			
			Game.ShakeCamera(PlayerRef, 0.2, 2.0)
			Game.ShakeController(0.3, 0.3, 2.0)
			
			BlockActivation(False)
		EndIf
	EndEvent
EndState

State Inactive
	Event OnActivate(ObjectReference akActionRef)
		BlockActivation(True)
		
		PlayAnimationandWait("Pull","Reset")
		
		BlockActivation(False)
	EndEvent
EndState
