ScriptName _arcQuest001PlayerAliasScript Extends ReferenceAlias

Actor Property PlayerRef Auto
Location Property DragonBridgeFourShieldsTavernLocation Auto
Location Property DragonBridgeLocation Auto
_arcQuest001Script Property _arcQuest001 Auto
ReferenceAlias Property Eivind Auto

Auto State Inactive
	;do nothing
EndState

State Stage10
	Event OnUpdateGameTime()
		GoToState("Inactive")
		_arcQuest001.SetStage(70)
	EndEvent
EndState

State Stage20
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == DragonBridgeFourShieldsTavernLocation
			GoToState("Inactive")
			_arcQuest001.SetStage(30)
		EndIf
	EndEvent
EndState

State Stage70Delay
	;this state is set by _arcQuest001Script as per the conditions outlined in
	;the Stage20 state.
	
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If !PlayerRef.IsInLocation(DragonBridgeLocation)
			GoToState("Inactive")
			_arcQuest001.RingGiver = 1
			_arcQuest001.SetStage(70)
		EndIf
	EndEvent
EndState

State Stage100
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If !PlayerRef.IsInLocation(DragonBridgeLocation)
			GoToState("Inactive")
			_arcQuest001.SetStage(110)
		EndIf
	EndEvent
EndState

State Stage110
	Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		GoToState("Inactive")
		_arcQuest001.SetStage(120)
	EndEvent
EndState

State Stage130
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If PlayerRef.IsInInterior()
			GoToState("Inactive")
			(Eivind.GetReference() as Actor).MoveToPackageLocation()
		EndIf
	EndEvent
EndState
