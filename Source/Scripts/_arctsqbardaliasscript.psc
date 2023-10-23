ScriptName _arcTSQBardAliasScript Extends ReferenceAlias

Event OnUpdate()
	TryStopCurrentScene()
EndEvent

Event OnPackageStart(Package akNewPackage)
	TryStopCurrentScene()
EndEvent

Function TryStopCurrentScene(Bool abDelay = False)
	ObjectReference BardRef = GetReference()
	If !BardRef
		Return
	EndIf
	
	If abDelay
		RegisterForSingleUpdate(1.0)
		Return
	EndIf
	
	Scene CurrentScene = BardRef.GetCurrentScene()
	If !CurrentScene
		Return
	EndIf
	
	CurrentScene.Stop()
EndFunction
