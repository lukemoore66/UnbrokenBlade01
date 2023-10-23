;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname _arc_QF__arcQuest004_05269FA9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Arcadia
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arcadia Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianDestMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianDestMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY portcullis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portcullis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telisha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telisha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArcadiaNocturnalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArcadiaNocturnalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardianFGMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardianFGMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaExitDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaExitDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OdeliaEntryDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OdeliaEntryDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitSceneTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExitSceneTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitPullchain
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExitPullchain Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;if we have a valid target trigger for the messenger of
;death quest, he will force greet us, we need to lock the player in

;lock the player in, so they have to forcegreet the messenger
;before they can leave
(Alias_ExitPullChain.GetReference() as _arcGExSQuestPullChainIntRefScript).GoToState("Busy")

;set up the messenger for his force greet
;this is in _arcMessengerOfDeathQuest under
;_arcMessengerOfDeathQuestMessengerFGBranchTopic
_arcDialogueQuest.MessengerForceGreet = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;this stage is set at the end of _arcMessengerOfDeathQuestMessengerFGBranchTopic
;in _arcMessengerOfDeathQuest
;the messenger has finished telling the player they will meet again
;it will only run if we force greet the messenger, however the door would have
;only been locked if we had a valid target for _arcMessengerOfDeathQuest
;in stage 80 of this quest

;unlock the door
(Alias_ExitPullChain.GetReference() as _arcGExSQuestPullChainIntRefScript).GoToState("Ready")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;set in stage of 160 of _arcArcadiaMeetQuest
;_arcArcadiaMeetQuestScene02 has just ended
;and the guardian has been banished
;this is here to conditionalize the guardian's package
;_arcQuest004GuardianTravelGuardianDestMarker so he will not try to travel
;when called upon at the exit in arcOdelia06 cell

;put the player's alias into the Stage80 state
;this will detect when the player has left odelia and will finish this quest
Player.GoToState("Stage80")

;add the player to the _arcGuardianFavourFaction at rank 1
;this means they can come and go from odelia as they please
PlayerRef.SetFactionRank(_arcGuardianFavourFaction, 1)

;unlock the front door
Alias_OdeliaEntryDoor.GetReference().Lock(False)

;unlock the rear door
OdeliaExitDoor.UnlockDoor()

;enable the exit scene trigger
Alias_ExitSceneTrigger.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;the guardian's debriefing is complete
;this stage is set at the end of _arcFlashbackQuest003
;due to _arcFlashbackQuest003Scene02 finishing

;banish guardian
(Alias_Guardian.GetReference() as _arcSummonFXScript).Banish()

;start _arcArcadiaMeetQuest here so we have all of Arcadia's dialogue options
;this will also start the scene where she summons the dragonborn automatically
_arcArcadiaMeetQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;set at the end of _arcQuest004GuardianExitBranch02Topic
;the guardian has told you how to save arcadia
;he will now gift you the power to summon a blade

;set stage in _arcArcdiaMeetQuest to 140
;this will start _arcArcadiaMeetQuestScene02
;where the guardian gifts the player with the summon spell
_arcArcadiaMeetQuest.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;the thalmor embassy scene did not play out
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;this stage conditionalizes the guardian's dialogue options in
;_arcQuest004GuardianDebriefBranchStartTopic so the guardian
;will only deliver his lines once
;this stage is set the end of _arcQuest004GuardianDebriefBranchStartTopic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;set in stage 90 of _arcArcadiaMeetQuest
;once the player has left odelia and has entered the flashback

;lock the player in by forcing the portcullis closed when it loads back in
(Alias_Portcullis.GetReference() as _arcDefault2StateActivator).IsOpen = False

;move the guardian into position
Guardian.TryMoveTo(Alias_GuardianDestMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;this stage is set by _arcArcadiaMeetQuest stage 10, once the player has
;engaged in conversation with arcadia

;remove silence
_arcMUSSilenceArcadiaGreet.Remove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;set in stage 130 of _arcArcadiaMeetQuest
;used to conditionalize dialogue for _arcQuest004GuardianExit01BranchTopic
;as wel as the guardian's package _arcQuest004GuardianFGStage40

;evaluate the guardian's package immediately, so he is guaranteed to force greet
(Alias_Guardian.GetReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;set in stage 150 of _arcArcadiaMeetQuest
;the guardian has just finished casting the spell on the player

;add the summon guardian spell to the player
PlayerRef.AddSpell(_arcSummonGuardianSpell)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;this stage is set by stage 90 of this quest
;shut down stage

SetObjectiveCompleted(0)

;always disable the exit scene trigger
Alias_ExitSceneTrigger.GetReference().DisableNoWait()

;always reset the messenger's force greet flag
_arcDialogueQuest.MessengerForceGreet = 0

;set the date for the bandit boss' journal in smuggler's den
;at least 7 days after exiting odelia, until the boss respawns
_arcSDBossJournalDate.SetValue(GameDaysPassed.GetValue() + 7.0)

;open the portcullis
(Alias_Portcullis.GetReference() as _arcDefault2StateActivator).IsOpen = True

;set odelia as cleared
_arcOdeliaLocation.SetCleared()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;the thalmor embassy scene played out
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;this stage is set in the Stage80 state on the player's alias for this quest
;when the player leaves odelia

;complete the objective before completing and stopping the quest
SetObjectiveCompleted(0)

;complete and stop the quest
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;set at the end of _arcQuest004GuardianExitBranch01Topic
;the guardian has told you you can come and go as you please
;to set up for  _arcQuest004GuardianExitBranch02Topic
;where the guardian tells you how to free arcadia
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;start up stage

;move arcadia into position
Alias_Arcadia.GetReference().MoveTo(Alias_ArcadiaNocturnalMarker.GetReference())

;set objective to escape odelia
SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;_arcFlashbackQuest003Scene01 has finished
;this stage conditionalizes the guardian's forcegreet package
;_arcQuest004GuardianDebriefBranchStartTopic

;silence any music
_arcMUSSilenceArcadiaGreet.Add()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

_arcQuestActorAliasScript Property Guardian Auto

_arcQuest004PlayerAliasScript Property Player Auto

_arcQuest004OdeliaExitDoorAliasScript Property OdeliaExitDoor Auto

Actor Property PlayerRef  Auto   

MusicType Property _arcMUSSilenceArcadiaGreet  Auto  

Faction Property _arcGuardianFavourFaction  Auto  

Quest Property _arcArcadiaMeetQuest  Auto  

SPELL Property _arcSummonGuardianSpell  Auto  

_arcDialogueQuestScript Property _arcDialogueQuest  Auto  

GlobalVariable Property _arcSDBossJournalDate  Auto  

GlobalVariable Property GameDaysPassed  Auto  

Location Property _arcOdeliaLocation  Auto  
