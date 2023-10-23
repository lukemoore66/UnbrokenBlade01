ScriptName _arcGESQuestPullChainIntRefScript Extends ObjectReference

Actor Property PlayerRef Auto
Quest Property _arcGuardianEntrySceneQuest Auto
Faction Property _arcGuardianEnemyFaction Auto
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto

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
		If _arcGuardianEntrySceneQuest.IsRunning() && _arcGuardianEntrySceneQuest.GetStage() < 30
			Animate()
			GoToState("Ready")
			Return
		EndIf
		
		PlayAnimationandWait("Pull", "Reset")
		
		ObjectReference TrapLinkerRef = GetLinkedRef()
		ObjectReference TeleportTriggerRef = GetLinkedRef(LinkCustom01)
		_arcNorRotatingDoorScript DoorRef = GetLinkedRef(LinkCustom02) as _arcNorRotatingDoorScript
		
		TrapLinkerRef.Activate(Self)
		
		;open the rotating door if it is closed
		If !DoorRef.IsOpen
			DoorRef.Activate(Self)
		EndIf
		
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
