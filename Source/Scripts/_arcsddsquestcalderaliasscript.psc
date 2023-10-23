ScriptName _arcSDDSQuestCalderAliasScript Extends _arcQuestActorAliasScript

ObjectReference Property PlayerRef Auto
Quest Property _arcSDDeathSceneQuest Auto
ReferenceAlias Property Halvar Auto
Faction Property BanditFaction Auto

Actor CalderRef
Float Assistance
Float Aggression

Auto State Inactive
	;do nothing
EndState

State Stage0
	Event OnBeginState()
		CalderRef = GetReference() as Actor
		
		CalderRef.BlockActivation(True)
		
		CalderRef.AddToFaction(BanditFaction)
		
		Assistance = CalderRef.GetActorValue("Assistance")
		CalderRef.SetActorValue("Assistance", 0.0)
		
		Aggression = CalderRef.GetActorValue("Aggression")
		CalderRef.SetActorValue("Aggression", 0.0)
		
	EndEvent
EndState

State Stage20
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef != PlayerRef
			Return
		EndIf
	
		GoToState("Inactive")
		
		_arcSDDeathSceneQuest.SetStage(30)
		
		CalderRef.RemoveFromFaction(BanditFaction)
		
		CalderRef.SetActorValue("Assistance", Assistance)
		
		CalderRef.SetActorValue("Aggression", Aggression)
				
		CalderRef.BlockActivation(False)
		
		CalderRef = None
	EndEvent
EndState
