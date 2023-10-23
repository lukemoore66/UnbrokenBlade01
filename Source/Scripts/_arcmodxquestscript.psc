ScriptName _arcMODxQuestScript Extends Quest

ReferenceAlias Property CurrentVictim Auto

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property _arcMODQuestTargetTrigger Auto
GlobalVariable Property _arcMODQuestTargetTime Auto
GlobalVariable Property _arcMODQuestObjHours Auto
GlobalVariable Property _arcMODQuestObjMins Auto
GlobalVariable Property _arcMODQuestObjCheckpoint Auto

Int Property CurrentObjective = -1 Auto Hidden
Int Property TargetObjective = -1 Auto Hidden
Int Property KillCount Auto Hidden

Int Stage

Event OnUpdate()
	DisplayNewObjective()
EndEvent

Function UpdateGlobals()
	;get the amount of time to reach goal
	Float TimeDelta = _arcMODQuestTargetTime.GetValue() - GameDaysPassed.GetValue()
	
	;get the amount of time to reach goal in hours
	Float TimeDeltaHours = (TimeDelta * 24.0)
	
	;add extra time to make up for the lost time
	;it takes for objectives to display, as well as the truncation
	;that occurs when converting to integers
	If IsStarting()
		;1 minute
		TimeDeltaHours += 0.01666666666
	Else
		;1.25 minutes
		TimeDeltaHours += 0.02083333333
	EndIf
	
	;get the amount of time to reach goal but hours only
	Int TimeDeltaHoursOnly = TimeDeltaHours as Int
	
	;get the amount of time to reach goal but minutes only
	Int TimeDeltaMinutesOnly = ((TimeDeltaHours - TimeDeltaHoursOnly) * 60.0) as Int
	
	;get the next checkpoint number
	Int Checkpoint = (_arcMODQuestTargetTrigger.GetValue() - 1.0) as Int
	
	;set global values
	_arcMODQuestObjHours.SetValue(TimeDeltaHoursOnly)
	_arcMODQuestObjMins.SetValue(TimeDeltaMinutesOnly)
	_arcMODQuestObjCheckpoint.SetValue(Checkpoint)
	
	;update global values in this quest instance
	UpdateCurrentInstanceGlobal(_arcMODQuestObjCheckpoint)
	UpdateCurrentInstanceGlobal(_arcMODQuestTargetTime)
	UpdateCurrentInstanceGlobal(_arcMODQuestObjHours)
	UpdateCurrentInstanceGlobal(_arcMODQuestObjMins)
EndFunction

Function SetNewObjective(Int aiTargetObjective, Bool aiCompleted = True)
	If CurrentObjective != -1
		If aiCompleted
			SetObjectiveCompleted(CurrentObjective)
		Else
			SetObjectiveFailed(CurrentObjective)
		EndIf
	EndIf
	
	TargetObjective = aiTargetObjective
	
	;wait, so other objectives do not display simultaneously
	RegisterForSingleUpdate(3.0)
EndFunction

Function DisplayNewObjective()
	If CurrentObjective != -1
		;hide old objectives, as when global instance data updates
		;and old objectives are displayed incorrectly as they will use the new data
		SetObjectiveDisplayed(CurrentObjective, False)
	EndIf
	
	;if we have a valid target objective, show it
	If TargetObjective != -1
	
		UpdateGlobals()
		
		SetObjectiveDisplayed(TargetObjective)
	EndIf
	
	;always set the current objective to the target objective
	CurrentObjective = TargetObjective
EndFunction
