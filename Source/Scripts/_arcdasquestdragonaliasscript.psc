ScriptName _arcDASQuestDragonAliasScript Extends _arcQuestActorAliasScript

Quest Property _arcDragonAttackSceneQuest Auto
ReferenceAlias Property DragonStartMarker Auto

Actor DragonRef
ObjectReference DragonStartMarkerRef

State Active
	Event OnLoad()
		DragonRef = GetReference() as Actor
		DragonStartMarkerRef = DragonStartMarker.GetReference()
		
		RegisterForSingleUpdate(30.0)
	EndEvent
	
	Event OnUpdate()
		If !DragonRef.Is3DLoaded()
			OnUnload()
			Return
		EndIf
		
		RegisterForSingleUpdate(30.0)
		
		;this needs to be called once beforehand because of an engine bug
		DragonRef.GetCombatState()
		If DragonRef.GetCombatState()
			Return
		EndIf
		
		
		Actor TargetRef = Game.FindRandomActorFromRef(DragonStartMarkerRef, 5000.0)
		If !TargetRef
			Return
		EndIf
		
		If TargetRef.IsDead() || TargetRef.IsDisabled()
			Return
		EndIf
		
		DragonRef.StartCombat(TargetRef)
	EndEvent
	
	Event OnUnload()
		DragonRef = None
		DragonStartMarkerRef = None
		
		UnregisterForUpdate()
	EndEvent
EndState

State Inactive
	;do nothing
EndState


Event OnDeath(Actor akKiller)
	GoToState("Inactive")
		
	UnregisterForUpdate()
	
	DragonRef = None
	DragonStartMarkerRef = None
	
	_arcDragonAttackSceneQuest.SetStage(40)
EndEvent
