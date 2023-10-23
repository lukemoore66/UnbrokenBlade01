ScriptName _arcQuest003OdeliaDoorExtAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Quest Property _arcQuest003 Auto
Faction Property _arcOdeliaEntryFaction Auto

ObjectReference DoorRef

Auto State Inactive
	Event OnBeginState()
		DoorRef = None
	EndEvent
EndState

State Active
	Event OnBeginState()
		DoorRef = GetReference()
		
		DoorRef.BlockActivation(True)
	EndEvent
	
	Event OnActivate(ObjectReference akActionRef)
		Actor kActor = akActionRef as Actor
		
		If !kActor
			Return
		EndIf
		
		If !kActor.IsInFaction(_arcOdeliaEntryFaction)
			Return
		EndIf
		
		;this stage is set up to wait for stage 205 to execute
		;before activating, as it needs to complete before changing cell
		;so it can grab all followers in the area
		If _arcQuest003.GetStage() < 205
			_arcQuest003.SetStage(205)
		EndIf
		
		DoorRef.Activate(kActor, True)
	EndEvent
	
	Event OnEndState()
		DoorRef.BlockActivation(False)
		
		DoorRef = None
	EndEvent
EndState
