ScriptName _arcGOQuestScript Extends Quest

Actor Property PlayerRef Auto
Spell Property _arcGuardiansWisdomSpell Auto
GlobalVariable Property _arcGOQuestMessageShown Auto
Message Property _arcGuardiansWisdomMarkerMSG Auto

Function SetCurrentObjective(Int akCurrentObjective)
	Utility.Wait(0.1)

	;always hide all objectives
	SetObjectiveDisplayed(0, False)
	SetObjectiveDisplayed(10, False)
	SetObjectiveDisplayed(20, False)
	SetObjectiveDisplayed(30, False)
	SetObjectiveDisplayed(40, False)
	SetObjectiveDisplayed(50, False)
	SetObjectiveDisplayed(60, False)
	SetObjectiveDisplayed(70, False)
	SetObjectiveDisplayed(80, False)
	SetObjectiveDisplayed(90, False)
	
	If akCurrentObjective == -1	
		SetActive(False)
		Return
	EndIf
	
	SetObjectiveDisplayed(akCurrentObjective, True, True)
	SetActive(True)
EndFunction

Function ShowMessageWithDelay()
	GoToState("ShowMsg")
	RegisterForSingleUpdate(1.0)
EndFunction

State ShowMsg
	Event OnUpdate()
		GoToState("")
		_arcGOQuestMessageShown.SetValue(1.0)
		_arcGuardiansWisdomMarkerMSG.Show()
	EndEvent
EndState

Function ShutdownQuest()
	GoToState("")
	
	UnregisterForUpdate()

	;clear all objective and set quest to inactive
	SetCurrentObjective(-1)
	
	;this will stop the quest and remove the spell
	PlayerRef.DispelSpell(_arcGuardiansWisdomSpell)
	
	PlayerRef.RemoveSpell(_arcGuardiansWisdomSpell)
EndFunction
