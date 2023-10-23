ScriptName _arcMODQuestActorAliasScript Extends _arcQuestActorAliasScript

Event OnCellDetach()
	ObjectReference ActorRef = GetReference()
	Scene CurrentScene = ActorRef.GetCurrentScene()
	
	If !CurrentScene
		Return
	EndIf
	
	CurrentScene.Stop()
	
	ActorRef.Disable()
EndEvent
