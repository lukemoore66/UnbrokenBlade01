ScriptName _arcGExSQuestPullChainIntRefScript Extends ObjectReference

Actor Property PlayerRef Auto
Quest Property _arcGuardianExitSceneQuest Auto
Faction Property _arcGuardianEnemyFaction Auto
Keyword Property LinkCustom01 Auto

State Busy
	Event OnActivate(ObjectReference akActionRef)
		Animate()
	EndEvent
EndState

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		
		If akActionRef != PlayerRef
			Animate()
			GoToState("Ready")
			Return
		EndIf
		
		;if the quest is running, and the traps have not finished firing
		;then don't do anything
		If _arcGuardianExitSceneQuest.IsRunning() && _arcGuardianExitSceneQuest.GetStage() < 30
			Animate()
			GoToState("Ready")
			Return
		EndIf
		
		PlayAnimationandWait("Pull", "Reset")
		
		ObjectReference TrapLinkerRef = GetLinkedRef()
		ObjectReference TeleportTriggerRef = GetLinkedRef(LinkCustom01)
		
		TrapLinkerRef.Activate(Self)
		
		If !PlayerRef.IsInFaction(_arcGuardianEnemyFaction)
			TeleportTriggerRef.EnableNoWait()
		EndIf
		
		;this will hold the door open for 5 sec
		Utility.Wait(5.0)
		
		TrapLinkerRef.Activate(Self)
		TeleportTriggerRef.DisableNoWait()
		
		;wait for traps to stop firing
		Utility.Wait(2.0)
		
		GoToState("Ready")
	EndEvent
EndState

Function Animate()
	BlockActivation(True)
	PlayAnimationandWait("Pull", "Reset")
	BlockActivation(False)
EndFunction
