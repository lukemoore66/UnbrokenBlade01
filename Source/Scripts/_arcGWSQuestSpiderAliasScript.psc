ScriptName _arcGWSQuestSpiderAliasScript Extends ReferenceAlias

Function TryToKillOrDisable()
	Actor SpiderRef = GetReference() as Actor
	
	If !SpiderRef
		Return
	EndIf
	
	If SpiderRef.GetSleepState()
		SpiderRef.Disable()
	EndIf
	
	SpiderRef.Kill()
EndFunction
