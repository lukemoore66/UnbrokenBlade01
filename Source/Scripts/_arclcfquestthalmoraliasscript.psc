ScriptName _arcLCFQuestThalmorAliasScript Extends _arcQuestActorAliasScript

Actor Property PlayerRef Auto
Location Property ThalmorEmbassyLocation Auto

Actor ThalmorRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()	
		ThalmorRef = GetReference() as Actor
	EndEvent
	
	Event OnDeath(Actor akKiller)
		GoToState("Inactive")
	EndEvent

	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == ThalmorEmbassyLocation
			If PlayerRef.HasLOS(ThalmorRef)
				RegisterForSingleLOSLost(PlayerRef, ThalmorRef)
				Return
			EndIf
			
			GoToState("Inactive")
		EndIf
	EndEvent
	
	Event OnUnload()
		GoToState("Inactive")
	EndEvent
	
	Event OnCellDetach()
		GoToState("Inactive")
	EndEvent
	
	Event OnDetachedFromCell()
		GoToState("Inactive")
	EndEvent
	
	Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
		GoToState("Inactive")
	EndEvent
	
	Event OnEndState()
		UnregisterForLOS(PlayerRef, ThalmorRef)
		
		If ThalmorRef.IsDead()
			Return
		EndIf
		
		ThalmorRef.Disable()
		
		ThalmorRef = None
	EndEvent
EndState
