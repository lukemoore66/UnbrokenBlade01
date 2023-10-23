ScriptName _arcCFQuestActorAliasScript Extends ReferenceAlias

Quest Property _arcCalderFleeQuest Auto

Event OnDetachedFromCell()
	;we want to make sure the actor is fully disabled before ending
	;the parent quest as it will check for this condition in
	;it's shutdown stage
	ObjectReference ActorRef = GetReference()
	
	ActorRef.Disable()
	ActorRef.MoveToMyEditorLocation()
	
	;a conditional fragment in stage 10 determines
	;if both halvar and calder are disabled
	_arcCalderFleeQuest.SetStage(10)
EndEvent
