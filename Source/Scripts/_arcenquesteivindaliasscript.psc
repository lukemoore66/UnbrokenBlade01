ScriptName _arcENQuestEivindAliasScript Extends _arcQuestActorFollowerAliasScript  

Location Property DragonBridgeFourShieldsTavernLocation Auto

Actor EivindRef

Auto State Active
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

State Inactive
	;do nothing
EndState
