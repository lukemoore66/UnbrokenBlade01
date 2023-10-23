ScriptName _arcOExSQuestScript Extends _arcQuestScript

Function StartScene()
	Game.EnableFastTravel(False)
	Game.DisablePlayerControls(abLooking = True, abCamSwitch = True, abSneaking = True)
	CancelTransformations()
	PlayerRef.ForceRemoveRagdollFromWorld()
	Game.SetInChargen(True, True, False)
	Game.SetPlayerAIDriven(True)
	Game.ForceFirstPerson()
	Game.ShowFirstPersonGeometry(False)
EndFunction

Function FinishScene()
	Game.EnablePlayerControls()
	Game.SetInChargen(False, False, False)
	Game.SetPlayerAIDriven(False)
	Game.ShowFirstPersonGeometry(True)
	Game.EnableFastTravel(True)
EndFunction
