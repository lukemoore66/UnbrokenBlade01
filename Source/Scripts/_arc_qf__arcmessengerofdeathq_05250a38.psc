;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 122
Scriptname _arc_QF__arcMessengerOfDeathQ_05250A38 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Messenger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Messenger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Valronis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Valronis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BehaviourMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BehaviourMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DummyMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DummyMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ShackleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ShackleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentVictim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CurrentVictim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KneelMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KneelMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BookContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BookContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MessengerBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MessengerBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Eivind
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Eivind Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dead09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dead09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alive07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alive07 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_90
Function Fragment_90()
;BEGIN CODE
;quest target enumeration
;>0 valid target
; 0 offer pending
;-1 quest disabled
;-2 never run
;-3 everyone is dead
;-4 declined offer

;we have a valid target

;check if there is anyone to kill
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_92
Function Fragment_92()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;we have someone to kill

;fill dead alias list
kmyQuest.FillDeadAliases()

;start kill / success scene with delay
kmyQuest.SetStageWithDelay(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_98
Function Fragment_98()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;we have reached the next trigger and
;we have not made it in time and
;we have a valid target

;start the kill scene
kmyQuest.StartScene(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;the messenger needs to be summoned

;move the mesenger into position
Messenger.TryMoveTo(Alias_Trigger.GetReference(), False)

;summon the messenger
(Alias_Messenger.GetReference() as _arcSummonFXScript).Summon(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_105
Function Fragment_105()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;we need to play the coward scene

;start the tracking quest
kmyQuest._arcMODxQuest.Start()

;set the target trigger to -1 (quest disabled)
kmyQuest._arcMODQuestTargetTrigger.SetValue(-1.0)

;play the coward scene
kmyQuest.StartScene(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_104
Function Fragment_104()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;if there is no one to kill and
;the quest is not disabled

;set the target trigger to -3 (all dead)
kmyQuest._arcMODQuestTargetTrigger.SetValue(-3.0)

;play the all dead scene
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_96
Function Fragment_96()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;we have a valid target

;start the tracking quest
kmyQuest._arcMODxQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_108
Function Fragment_108()
;BEGIN CODE
;the messenger is not in a scene

;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_110
Function Fragment_110()
;BEGIN CODE
;always enable the current trigger
Alias_Trigger.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_91
Function Fragment_91()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;the quest has never been run before

;set target trigger to 0 (offer pending)
kmyQuest._arcMODQuestTargetTrigger.SetValue(0.0)

;initialize the dead actor array
kmyQuest._arcDialogueQuest.MessengerDeadActors = New Form[16]

;add eivind to the dead actor array
kmyQuest._arcDialogueQuest.MessengerDeadActors[0] = Alias_Eivind.GetReference()

;check if there is anyone to kill
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;shut down stage

;delete book
Alias_MessengerBook.GetReference().Delete()

;delete book container
Alias_BookContainer.GetReference().Delete()

;delete dummy marker
Alias_DummyMarker.GetReference().Delete()

;delete behaviour marker
Alias_BehaviourMarker.GetReference().Delete()

;banish the messenger
(Alias_Messenger.GetReference() as _arcSummonFXScript).Banish(False)

;remove perk
kmyQuest.AddPerk(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_100
Function Fragment_100()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;we have reached the next trigger and
;we have made it in time and
;we have a valid target

;play the success scene
kmyQuest.StartScene(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_112
Function Fragment_112()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;there is no one left to kill and
;the quest is now disabled

;stop the quest
Stop()

;fail the tracking quest
kmyQuest._arcMODxQuest.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_106
Function Fragment_106()
;BEGIN CODE
;the player has exited the trigger and
;there is still someone left to kill

;stop the quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_97
Function Fragment_97()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;we do not have a valid target

;set the target trigger to -4 (declined offer)
kmyQuest._arcMODQuestTargetTrigger.SetValue(-4.0)

;reset the messenger's force greet flag
kmyQuest.SetForceGreetFlag(0)

;play coward scene, which will subsequently start the kill scene
kmyQuest.SetStageWithDelay(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_102
Function Fragment_102()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;everyone is dead

;set the target trigger to -1 (quest disabled)
kmyQuest._arcMODQuestTargetTrigger.SetValue(-1.0)

;play the all dead scene
kmyQuest.StartScene(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_93
Function Fragment_93()
;BEGIN AUTOCAST TYPE _arcMODQuestScript
Quest __temp = self as Quest
_arcMODQuestScript kmyQuest = __temp as _arcMODQuestScript
;END AUTOCAST
;BEGIN CODE
;if we have no one to kill

;fill dead alias list
kmyQuest.FillDeadAliases()

;set the target trigger to -3 (everyone dead)
kmyQuest._arcMODQuestTargetTrigger.SetValue(-3.0)

;start all dead scene
kmyQuest.SetStageWithDelay(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcQuestActorAliasScript Property Messenger Auto

Quest Property _arcMessengerOfDeathOdeliaQuest  Auto  
