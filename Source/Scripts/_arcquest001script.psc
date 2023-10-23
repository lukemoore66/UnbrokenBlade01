ScriptName _arcQuest001Script Extends _arcQuestScript Conditional

Int Property RingGiver = 0 Auto Conditional Hidden
{0 = stage 10 timer, 1 = stage 20 timer, 2 = lockbox, 3 = telisha, 4 = calder}
Int Property EivindTelishaMissingFG = 0 Auto Conditional Hidden

Location Property DragonBridgeLocation Auto
_arcQuest001PlayerAliasScript Property Player Auto
_arcQuest001TelishaLockboxAliasScript Property TelishaLockbox Auto
_arcQuest001RingAliasScript Property ArcadiaRing Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property _arcTyraJournalDate01 Auto
GlobalVariable Property _arcTyraJournalDate02 Auto
GlobalVariable Property _arcTyraJournalDate03 Auto
GlobalVariable Property _arcTyraJournalDate04 Auto
GlobalVariable Property _arcTyraJournalDate05 Auto
GlobalVariable Property _arcQuest001TargetTime Auto

Auto State Inactive
	;do nothing
EndState

State Stage10
	Event OnUpdateGameTime()
		GoToState("Inactive")
		;stage for ring is stolen by someone else
		SetStage(70)
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdateGameTime()
	EndEvent
EndState

State Stage20
	Event OnUpdateGameTime()
		GoToState("Inactive")
		
		;so if the lockbox is in the opened state, and it still has the ring in its inventory
		;and the timer has run out, and the player is still in dragon bridge
		;then we need to wait until the player leaves dragon bridge to have the ring stolen.
		;or until the player takes the ring out of the lockbox.
		
		If TelishaLockbox.GetState() == "Opened" && \
		ArcadiaRing.GetState() == "NotTaken" && \
		PlayerRef.IsInLocation(DragonBridgeLocation)
			Player.GoToState("Stage70Delay")
			Return
		EndIf
		
		;stage 70, ring is stolen by someone else
		RingGiver = 1
		SetStage(70)
	EndEvent
	
	Event OnEndState()
		UnregisterForUpdateGameTime()
	EndEvent
EndState

Function StartCalderOfferTimer(Float afTimeToWait)
	UnregisterForUpdateGameTime()
	
	_arcQuest001TargetTime.SetValue(GameDaysPassed.GetValue() + 1.0)
	
	UpdateCurrentInstanceGlobal(GameDaysPassed)
	UpdateCurrentInstanceGlobal(_arcQuest001TargetTime)
	
	RegisterForSingleUpdateGameTime(afTimeToWait)
EndFunction

Function SetTyraJournalDates()
	Float JournalDate05 = GameDaysPassed.GetValue() - 2.0

	If JournalDate05 < 0.0
		JournalDate05 = 0.0
	EndIf

	Float JournalDate04 = JournalDate05 - 5.0
	
	If JournalDate04 < 0.0
		JournalDate04 = 0.0
	EndIf

	_arcTyraJournalDate05.SetValue(JournalDate05)
	_arcTyraJournalDate04.SetValue(JournalDate04)
	_arcTyraJournalDate03.SetValue(JournalDate05 - 30.0)
	_arcTyraJournalDate02.SetValue(JournalDate05 - 90.0)
	_arcTyraJournalDate01.SetValue(JournalDate05 - 120.0)
EndFunction
