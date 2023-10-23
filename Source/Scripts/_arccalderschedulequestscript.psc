ScriptName _arcCalderScheduleQuestScript Extends Quest

GlobalVariable Property _arcCalderScheduleDate01 Auto
GlobalVariable Property _arcCalderScheduleDate02 Auto
GlobalVariable Property _arcCalderScheduleDate03 Auto
GlobalVariable Property _arcCalderScheduleDate04 Auto
GlobalVariable Property GameDaysPassed Auto

ReferenceAlias Property Schedule Auto

Function SetCalderScheduleDates(Float TirdasOffset)
	Float NextTirdas = GameDaysPassed.GetValue() as Int + TirdasOffset

	_arcCalderScheduleDate01.SetValue(NextTirdas)
	_arcCalderScheduleDate02.SetValue(NextTirdas + 7.0)
	_arcCalderScheduleDate03.SetValue(NextTirdas + 14.0)
	_arcCalderScheduleDate04.SetValue(NextTirdas + 21.0)
	
	UpdateCurrentInstanceGlobal(_arcCalderScheduleDate01)
	UpdateCurrentInstanceGlobal(_arcCalderScheduleDate02)
	UpdateCurrentInstanceGlobal(_arcCalderScheduleDate03)
	UpdateCurrentInstanceGlobal(_arcCalderScheduleDate04)
	
	ObjectReference ScheduleRef =  Schedule.GetReference()
	ScheduleRef.Activate(ScheduleRef)
	Stop()
EndFunction
