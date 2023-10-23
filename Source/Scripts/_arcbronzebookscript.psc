ScriptName _arcBronzeBookScript Extends defaultDisableHavokOnLoad

ObjectReference Property PlayerRef Auto
Form Property _arcBronzeBook Auto

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
		
		;wait 0.1s, this makes sure we are not in the read menu
		Utility.Wait(0.1)
		
		If PlayerRef.GetItemCount(_arcBronzeBook)
			Return
		EndIf
		
		PlayerRef.AddItem(Self, 1, True)
	EndEvent

	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		;wait 0.1s, this makes sure we are not in the read menu
		Utility.Wait(0.1)
		
		If akNewContainer != PlayerRef
			Return
		EndIf
		
		Int BookCount = PlayerRef.GetItemCount(_arcBronzeBook)
		If BookCount == 1
			Return
		EndIf
		
		PlayerRef.RemoveItem(_arcBronzeBook, BookCount - 1, True)
		
		GoToState("Inventory")
	EndEvent
EndState

State Inventory
	Event OnLoad()
		GoToState("Complete")
	
		ReleaseToHavok()
	EndEvent
EndState

State Complete
	;do nothing
EndState
