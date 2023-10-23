ScriptName _arcQuestActorFollowerAliasScript Extends _arcQuestActorAliasScript

Actor Property PlayerRef Auto
Faction Property _arcPlayerAllyCrimeFaction Auto
Faction Property _arcPlayerFollowerFaction Auto

Int iRelationshipRank = -1
Faction kCrimeFaction

Function SetAlly(Bool abAlly)
	Actor kActorRef = GetReference() as Actor
	
	If abAlly
		iRelationshipRank = kActorRef.GetRelationshipRank(PlayerRef)
		kCrimeFaction = kActorRef.GetCrimeFaction()
		
		kActorRef.SetRelationshipRank(PlayerRef, 3)
		kActorRef.SetCrimeFaction(_arcPlayerAllyCrimeFaction)
		kActorRef.SetNotShowOnStealthMeter(True)
	Else
		kActorRef.SetRelationshipRank(PlayerRef, iRelationshipRank)
		kActorRef.SetCrimeFaction(kCrimeFaction)
		kActorRef.SetNotShowOnStealthMeter(False)
	EndIf
	
	kActorRef = None
EndFunction

Function SetFollow(Bool abFollow)
	Actor kActorRef = GetReference() as Actor
	
	If abFollow
		kActorRef.SetFactionRank(_arcPlayerFollowerFaction, 0)
	Else
		kActorRef.SetFactionRank(_arcPlayerFollowerFaction, -2)
	EndIf
	
	kActorRef.SetPlayerTeammate(abFollow, False)
	
	kActorRef.EvaluatePackage()
	
	kActorRef = None
EndFunction
