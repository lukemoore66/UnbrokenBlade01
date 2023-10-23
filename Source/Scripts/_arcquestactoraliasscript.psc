ScriptName _arcQuestActorAliasScript Extends ReferenceAlias

Float InitialAggression = -1.0

Function TryMoveTo(ObjectReference akDestinationRef, Bool abEnable = True)
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
	
	kActor.Disable()
	kActor.MoveTo(akDestinationRef)
	
	If abEnable
		kActor.Enable()
		kActor.EvaluatePackage()
	EndIf
EndFunction

Function TryRemove()
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
	
	;this is better than deleting, as it removes the actor from the world
	;and not their spawn marker
	kActor.SetCriticalStage(kActor.CritStage_DisintegrateEnd)
EndFunction

Function TryKill()
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
		
	kActor.Kill()
EndFunction

;actors will appear at odd angles if reset while loaded
;otherwise add a TryMoveTo(Self) afterwards
Function TryReset()
	ObjectReference kActor = GetReference()
	
	If !kActor
		Return
	EndIf
	
	kActor.Reset()
EndFunction

Function TrySetAggression(Float afAggression)
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
	
	InitialAggression = kActor.GetActorValue("Aggression")
	
	kActor.SetActorValue("Aggression", afAggression)
EndFunction

Function TryResetAggression()
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf

	If InitialAggression != -1.0
		kActor.SetActorValue("Aggression", InitialAggression)
		InitialAggression = -1.0
	EndIf
EndFunction

Function TryResetHealth()
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
		
	kActor.ResetHealthAndLimbs()
EndFunction

Function TryStopCombat()
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
	
	kActor.StopCombat()
	kActor.StopCombatAlarm()
EndFunction

Function TryStopCurrentScene()
	Actor kActor = GetReference() as Actor
	
	If !kActor
		Return
	EndIf
	
	Scene CurrentScene = kActor.GetCurrentScene()
	
	If CurrentScene
		CurrentScene.Stop()
	EndIf
EndFunction
