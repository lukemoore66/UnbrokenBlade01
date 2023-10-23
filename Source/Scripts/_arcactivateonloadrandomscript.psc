ScriptName _arcActivateOnLoadRandomScript Extends ObjectReference

Bool Property Active = True Auto
Float Property MinTime = 0.5 Auto
Float Property MaxTime = 2.0 Auto

Event OnInit()
	If Active
		Activate(Self)
	EndIf
EndEvent

Auto State Inactive
	Event OnActivate(ObjectReference akActionRef)
			GoToState("Active")
			
			If Is3DLoaded()
				OnLoad()
			EndIf
	EndEvent
EndState

State Active
	Event OnLoad()
		RegisterForSingleUpdate(Utility.RandomFloat(MinTime, MaxTime))
	EndEvent

	Event OnUpdate()
		;double check for parent cell attachment, as Is3DLoaded() does not always
		;work as intended, pehaps due to state changes, or the object stays resident
		;in memory if it is a trap that is firing a spell
		If Is3DLoaded() && GetParentCell().IsAttached()
			Activate(Self)
			RegisterForSingleUpdate(Utility.RandomFloat(MinTime, MaxTime))
		Else
			UnregisterForUpdate()
		EndIf
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdate()
	EndEvent
EndState

Event OnUnload()
	UnregisterForUpdate()
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent
