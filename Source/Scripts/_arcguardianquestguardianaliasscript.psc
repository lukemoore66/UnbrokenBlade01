ScriptName _arcGuardianQuestGuardianAliasScript Extends ReferenceAlias

Actor GuardianRef
Float Assistance
Float Aggression

Auto State Aggressive
	;do nothing
EndState

State Passive
	Event OnBeginState()
		GuardianRef = GetReference() as Actor
		
		GuardianRef.StopCombat()
		GuardianRef.StopCombatAlarm()
		
		Assistance = GuardianRef.GetActorValue("Assistance")
		GuardianRef.SetActorValue("Assistance", 0.0)
		
		Aggression = GuardianRef.GetActorValue("Aggression")
		GuardianRef.SetActorValue("Aggression", 0.0)
		
	EndEvent
	
	Event OnEndState()
		GuardianRef.SetActorValue("Assistance", Assistance)
		
		GuardianRef.SetActorValue("Aggression", Aggression)
		
		GuardianRef = None
	EndEvent
EndState
