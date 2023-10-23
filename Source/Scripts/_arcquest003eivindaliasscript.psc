ScriptName _arcQuest003EivindAliasScript Extends _arcQuestActorFollowerAliasScript  

Location Property DragonBridgeFourShieldsTavernLocation Auto

Actor EivindRef

Auto State Inactive
	;do nothing
EndState

State Stage160
	Event OnBeginState()
		EivindRef = GetReference() as Actor
		
		If EivindRef.GetCurrentLocation() == DragonBridgeFourShieldsTavernLocation
			EivindRef.EvaluatePackage()
		EndIf
	EndEvent

	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		If akNewLoc == DragonBridgeFourShieldsTavernLocation
			EivindRef.EvaluatePackage()
			EivindRef.MoveToPackageLocation()
		EndIf
	EndEvent
EndState
