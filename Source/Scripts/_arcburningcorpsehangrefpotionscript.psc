ScriptName _arcBurningCorpseHangRefPotionScript Extends ObjectReference

Form Property ResistFire100 Auto
ObjectReference Property PlayerRef Auto

Auto State Active
	Event OnLoad()
		GoToState("Inactive")
		
		;this function is latent, and returns befroe it is finished
		;wait for it to complete
		RemoveAllItems()
		Utility.Wait(1.0)
		
		GoToState("Active")
	
		AddInventoryEventFilter(ResistFire100)
	
		Int PotionCount = GetItemCount(ResistFire100)
		
		If !PotionCount
			AddItem(ResistFire100)
			Return
		EndIf
		
		If PotionCount > 1
			RemoveItem(ResistFire100, PotionCount - 1)
		EndIf
	EndEvent
	
	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		If akBaseItem != ResistFire100
			Return
		EndIf
		
		If akDestContainer != PlayerRef
			Return
		EndIf
		
		GoToState("Inactive")
		
		RemoveInventoryEventFilter(ResistFire100)
	EndEvent
	
	Event OnUnload()
		RemoveInventoryEventFilter(ResistFire100)
	EndEvent
EndState

State Inactive
	Event OnLoad()
		RemoveAllItems()
	EndEvent
EndState
