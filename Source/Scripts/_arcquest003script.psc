ScriptName _arcQuest003Script Extends _arcQuestScript Conditional

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property _arcOdeliaBanditJournalDate01 Auto
GlobalVariable Property _arcOdeliaBanditJournalDate02 Auto
GlobalVariable Property _arcOdeliaBanditJournalDate03 Auto

Function SetOdeliaBanditJournalDates()
	Float fGameDaysPassed = GameDaysPassed.GetValue()
	
	_arcOdeliaBanditJournalDate01.SetValue(fGameDaysPassed - 26.0)
	_arcOdeliaBanditJournalDate02.SetValue(fGameDaysPassed - 12.0)
	_arcOdeliaBanditJournalDate03.SetValue(fGameDaysPassed - 2.0)
	
	UpdateCurrentInstanceGlobal(_arcOdeliaBanditJournalDate01)
	UpdateCurrentInstanceGlobal(_arcOdeliaBanditJournalDate02)
	UpdateCurrentInstanceGlobal(_arcOdeliaBanditJournalDate03)
EndFunction

State ReadLetter
	Event OnBeginState()
		RegisterForSingleUpdate(0.01)
	EndEvent

	Event OnUpdate()
		SetStage(35)
		
		GoToState("")
	EndEvent
EndState
