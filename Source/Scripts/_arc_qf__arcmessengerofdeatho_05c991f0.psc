;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname _arc_QF__arcMessengerOfDeathO_05C991F0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Messenger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Messenger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentVictim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CurrentVictim Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;increment the kill count
kmyQuest.KillCount += 1

;fail current objective / do not set target objective
kmyQuest.SetNewObjective(-1, False)

;finish the quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;1000 is preset in all _arcMODxQuests as the shutdown stage

;cancel showing the target objective
kmyQuest.UnregisterForUpdate()
kmyQuest.GoToState("")

;hide the current objective, if it exists
If kmyQuest.CurrentObjective != -1
    SetObjectiveDisplayed(kmyQuest.CurrentObjective, False)
EndIf

If !kmyQuest.KillCount
    ;complete the main objective
    SetObjectiveCompleted(1000)
    
    ;wait for objective completed to be shown
    Utility.Wait(0.025)

    ;complete the quest
    SetStage(1010)
    Return
EndIf

;fail main objective
SetObjectiveFailed(1000)

;wait for objective failed to show
Utility.Wait(0.025)

;fail the quest
SetStage(1020)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;increment the kill count
kmyQuest.KillCount += 1

;complete current objective / set new objective
kmyQuest.SetNewObjective(20, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;a valid target trigger is not set
;the player has declined the challenge

;increment the kill count
kmyQuest.KillCount += 1

;fail the quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;set in stage 20 of _arcMessengerOfDeathQuest
;a valid target trigger is set
;the player has accepted the challenge

;show the main objective
SetObjectiveDisplayed(1000)

;complete current objective / set new objective
kmyQuest.SetNewObjective(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;we passed
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;increment the kill count
kmyQuest.KillCount += 1

;complete current objective / set new objective
kmyQuest.SetNewObjective(30, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;complete current objective / set new objective
kmyQuest.SetNewObjective(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;we failed
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;complete current objective / set new objective
kmyQuest.SetNewObjective(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE _arcMODxQuestScript
Quest __temp = self as Quest
_arcMODxQuestScript kmyQuest = __temp as _arcMODxQuestScript
;END AUTOCAST
;BEGIN CODE
;complete current objective / do not set target objective
kmyQuest.SetNewObjective(-1)

;finish the quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
