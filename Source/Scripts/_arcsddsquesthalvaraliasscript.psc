ScriptName _arcSDDSQuestHalvarAliasScript Extends ReferenceAlias

Quest Property _arcSDDeathSceneQuest Auto
Faction Property BanditFaction Auto

Actor HalvarRef
Float Assistance
Float Aggression

Auto State Inactive
	;do nothing
EndState

State Active
	Event OnBeginState()
		HalvarRef = GetReference() as Actor
		HalvarRef.AddToFaction(BanditFaction)
		
		Assistance = HalvarRef.GetActorValue("Assistance")
		HalvarRef.SetActorValue("Assistance", 0.0)
		
		Aggression = HalvarRef.GetActorValue("Aggression")
		HalvarRef.SetActorValue("Aggression", 0.0)
	EndEvent
	
	Event OnEndState()
		If _arcSDDeathSceneQuest.GetStage() < 30
			HalvarRef.StopCombat()
		EndIf
	
		HalvarRef.RemoveFromFaction(BanditFaction)
		
		HalvarRef.SetActorValue("Assistance", Assistance)
		
		HalvarRef.SetActorValue("Aggression", Aggression)
		
		HalvarRef.EvaluatePackage()
		
		HalvarRef = None
	EndEvent
EndState
