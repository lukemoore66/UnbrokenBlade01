ScriptName _arcCalderScript Extends Actor

Location Property DragonBridgeFourShieldsTavernLocation Auto
Faction Property _arcTavernTrespassFaction Auto

;evaluate halvar's ai package whenever calder starts a new ai package
Event OnPackageStart(Package akNewPackage)
	Actor HalvarRef = GetLinkedRef() as Actor
	
	If HalvarRef.IsDead()
		Return
	EndIf
	
	HalvarRef.EvaluatePackage()
EndEvent

;evaluate halvar's ai package whenever calder changes location
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == DragonBridgeFourShieldsTavernLocation && IsInFaction(_arcTavernTrespassFaction)
		MoveToPackageLocation()
	EndIf

	Actor HalvarRef = GetLinkedRef() as Actor
	
	If HalvarRef.IsDead()
		Return
	EndIf
	
	HalvarRef.EvaluatePackage()
EndEvent

Function MoveToWithDog(ObjectReference akDestination = None)
	If IsDead()
		Return
	EndIf
	
	Scene CurrentScene = GetCurrentScene()
	If CurrentScene
		CurrentScene.Stop()
		CurrentScene = None
	EndIf
	
	StopCombat()
	
	If !akDestination
		EvaluatePackage()
		MoveToPackageLocation()
	Else
		MoveTo(akDestination)
	EndIf
	
	;move halvar
	Actor HalvarRef = GetLinkedRef() as Actor
	
	If HalvarRef.IsDead()
		Return
	EndIf
	
	;reuse current scene variable for halvar
	CurrentScene = HalvarRef.GetCurrentScene()
	If CurrentScene
		CurrentScene.Stop()
		CurrentScene = None
	EndIf
	
	HalvarRef.StopCombat()
	
	If !akDestination
		HalvarRef.EvaluatePackage()
		HalvarRef.MoveToPackageLocation()
	Else
		HalvarRef.MoveTo(akDestination)
	EndIf
	
	HalvarRef = None
EndFunction
