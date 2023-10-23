ScriptName _arcTelishaPlaqueActScript Extends ObjectReference

Actor Property PlayerRef Auto
Form Property _arcTelishaAmulet Auto
Perk Property _arcTelishaPlaqueActPerk Auto

ObjectReference Property AmuletRef Auto Hidden

Auto State NotMounted
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		If !akActionRef.GetItemCount(_arcTelishaAmulet)
			Return
		EndIf
		
		AmuletRef = PlayerRef.DropObject(_arcTelishaAmulet)
		
		GoToState("Moving")
				
		WaitAmulet()
		
		AmuletRef.SetMotionType(Motion_Keyframed, False)
		
		AmuletRef.MoveToNode(Self, "AmuletNode")
		
		WaitAmulet()
				
		GoToState("Mounted")
	EndEvent
EndState

State Mounted
	Event OnTriggerLeave(ObjectReference akActionRef)
		If akActionRef != AmuletRef
			Return
		EndIf
		
		GoToState("NotMounted")
	EndEvent
EndState

State Moving
	Event OnBeginState()
		BlockActivation(True)
		AmuletRef.BlockActivation(True)
	EndEvent
	
	Event OnEndState()
		BlockActivation(False)
		AmuletRef.BlockActivation(False)
	EndEvent
EndState

Event OnCellAttach()
	PlayerRef.AddPerk(_arcTelishaPlaqueActPerk)
	
	;cells always load 3D data before becoming attached
	;so return here if the plaque is disabled
	If !Is3DLoaded()
		Return
	EndIf

	If AmuletRef
		GoToState("Moving")
	
		AmuletRef.Enable(False)
		
		WaitAmulet()
	
		AmuletRef.SetMotionType(Motion_Keyframed, False)
		
		AmuletRef.MoveToNode(Self, "AmuletNode")
		
		WaitAmulet()
		
		GoToState("Mounted")
		
		Return
	EndIf
EndEvent

Event OnCellDetach()
	PlayerRef.RemovePerk(_arcTelishaPlaqueActPerk)
EndEvent

;the SetMotionType() and MoveToNode() functions
;return before the effected object's 3d has loaded
;so we must wait a reasonable amount of time
Function WaitAmulet()
	Int Counter = 0
	
	;0.025 x 40 = 1 second
	While !AmuletRef.Is3DLoaded() && Counter < 4
		Utility.Wait(0.25)
		Counter += 1
	EndWhile
EndFunction
