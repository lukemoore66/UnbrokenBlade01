ScriptName _arcSummonFXDeathScript Extends Actor

Auto State Alive
	Event OnDying(Actor akKiller)
		GoToState("Banishing")

		BlockActivation(True)
		
		Weapon RightWeapon = GetEquippedWeapon(True)
		Weapon LeftWeapon = GetEquippedWeapon(False)
		
		If RightWeapon
			RemoveItem(RightWeapon, 2147483647)
		EndIf
		
		If LeftWeapon
			RemoveItem(LeftWeapon, 2147483647)
		EndIf
	EndEvent
EndState

State Banishing
	Event OnUnload()
		GoToState("Banished")
		
		BlockActivation(False)
	EndEvent
EndState

State Banished
	;do nothing
EndState
