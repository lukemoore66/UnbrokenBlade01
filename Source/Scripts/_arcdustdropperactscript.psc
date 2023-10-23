ScriptName _arcDustDropperActScript Extends objectReference

Sound Property AMBDustDropDebris Auto
Bool Property DeleteWhenDone Auto

State Inactive
	;do nothing
EndState

Auto State Active
	Event OnActivate(ObjectReference akTriggerRef)
		GoToState("Inactive")
		PlayAnimation("PlayAnim01")
		AMBDustDropDebris.Play(Self)
		Utility.Wait(3.34)
		PlayAnimation("PlayAnim02")
		AMBDustDropDebris.Play(Self)
		Utility.Wait(3.34)
		PlayAnimation("PlayAnim03")
		AMBDustDropDebris.Play(Self)
		Utility.Wait(3.34)
		GoToState("Active")
		
		If DeleteWhenDone
			Delete()
		EndIf
	EndEvent
EndState
