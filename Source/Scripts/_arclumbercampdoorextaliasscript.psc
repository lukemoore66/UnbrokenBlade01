ScriptName _arcLumberCampDoorExtAliasScript Extends ReferenceAlias

ObjectReference Property PlayerRef Auto
Faction Property _arcDragonBridgeLumberCampFaction Auto
Message Property FollowerBlockedMessage Auto

Bool bDoOnce
ObjectReference DoorRef

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		DoorRef = GetReference()
		DoorRef.BlockActivation(True)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		If (akActionRef == PlayerRef)
			DoorRef.Activate(akActionRef, True)
			Return
		EndIf
		
		Actor kActionRef = akActionRef as Actor
		If kActionRef.IsInFaction(_arcDragonBridgeLumberCampFaction)
			DoorRef.Activate(akActionRef, True)
			Return
		EndIf
		
		If bDoOnce == False
			FollowerBlockedMessage.Show()
			bDoOnce = True
		EndIf
	EndEvent
	
	Event OnEndState()
		DoorRef.BlockActivation(False)
		DoorRef = None
	EndEvent
EndState
