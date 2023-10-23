ScriptName _arcTESQuestThalmorAliasScript Extends _arcQuestActorAliasScript  

Function ResetAndMoveToPackageLoc()
	Actor kActorRef = GetReference() as Actor
	
	If !kActorRef
		Return
	EndIf
	
	kActorRef.Reset()
	Utility.Wait(0.1)
	kActorRef.EvaluatePackage()
	kActorRef.MoveToPackageLocation()
	
	kActorRef = None
EndFunction
