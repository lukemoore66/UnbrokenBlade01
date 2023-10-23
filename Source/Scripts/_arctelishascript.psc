ScriptName _arcTelishaScript Extends Actor
;creates telisha's amulet and equips it
;this has to be done at runtime as it needs to have a valid
;object reference to function properly if the player
;wants to equip it later

Form Property _arcTelishaAmulet Auto

Auto State Init
	Event OnCellLoad()
		GoToState("Complete")
		
		ObjectReference AmuletRef = PlaceAtMe(_arcTelishaAmulet, abForcePersist = True)
		
		AddItem(AmuletRef, abSilent = True)
		
		EquipItem(_arcTelishaAmulet, True, True)
	EndEvent
EndState

State Complete
	;do nothing
EndState
