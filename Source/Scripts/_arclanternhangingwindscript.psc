ScriptName _arcLanternHangingWindScript Extends ObjectReference

Float Property Strength = 8.0 Auto
{1 - 10}

Auto State Inactive
	Event OnCellAttach()
			GoToState("Active")
			
			If Is3DLoaded()
				OnLoad()
			EndIf
	EndEvent
EndState

State Active
	Event OnLoad()
		RegisterForSingleUpdate(Utility.RandomFloat(0.0, 3.0))
	EndEvent

	Event OnUpdate()
		If Is3DLoaded()
			ApplyHavokImpulse(Utility.RandomFloat(0.0, 1.0), Utility.RandomFloat(0.0, 1.0), 0.0, Utility.RandomFloat(0.5 * Strength, 1.0 * Strength))
			RegisterForSingleUpdate(Utility.RandomFloat(0.0, 3.0))
		EndIf
	EndEvent

	Event OnUnload()
		UnregisterForUpdate()
	EndEvent
	
	Event OnCellDetach()
		GoToState("Inactive")
		UnregisterForUpdate()
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdate()
	EndEvent
EndState
