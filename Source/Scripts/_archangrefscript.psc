ScriptName _arcHangRefScript Extends Actor

Actor Property PlayerRef Auto
Message Property _arcHangRefMSG Auto
Bool Property Busy = False Auto Hidden

State Hanging
	Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		;only give the item back if the player is adding it
		If akSourceContainer != PlayerRef
			Return
		EndIf
		
		;the item has been added by the player, give it back
		;if the item has an ObjectReference, give that back
		If akItemReference
			RemoveItem(akItemReference, aiItemCount, True, akSourceContainer)
		Else
			;otherwise, just give back a copy of the base item
			RemoveItem(akBaseItem, aiItemCount, True, akSourceContainer)
		EndIf
		
		_arcHangRefMSG.Show()
	EndEvent
EndState

;this function is called by _arcHangActorEffectScript
;which is attached to the player when the game is loaded
;it will cast this script into the appropriate child script
;so the correct hanging function is performed for each actor
Function OnPCLoadGame()
	_arcTelishaHangRefScript TelishaHangRef = Self as _arcTelishaHangRefScript
	If TelishaHangRef
		TelishaHangRef.OnLoad()
		Return
	EndIf
	
	_arcHalvarHangRefScript HalvarHangRef = Self as _arcHalvarHangRefScript
	If HalvarHangRef
		HalvarHangRef.OnLoad()
		Return
	EndIf
	
	_arcBurningCorpseHangRefScript BurningCorpseHangRef = Self as _arcBurningCorpseHangRefScript
	If BurningCorpseHangRef
		BurningCorpseHangRef.OnLoad()
		Return
	EndIf
EndFunction
