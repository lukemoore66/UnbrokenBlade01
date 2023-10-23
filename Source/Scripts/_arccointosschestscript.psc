ScriptName _arcCoinTossChestScript Extends ObjectReference

GlobalVariable Property GameDaysPassed Auto

Float GameDaysPassedExpiry

Event OnInit()
	GameDaysPassedExpiry = GameDaysPassed.GetValue() + 2.0
EndEvent

Event OnCellAttach()
	If GameDaysPassed.GetValue() > GameDaysPassedExpiry
		Delete()
	EndIf
EndEvent
